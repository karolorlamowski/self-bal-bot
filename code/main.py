import os
import json
import queue
import const
import utils
import imu
import motor
import encoder
import pid
import time
import RPi.GPIO
import bluetooth
import picamera
import streamer
import threading
import math
from evdev import InputDevice, categorize, ecodes

SETUP_FILE             = 'setup.json'

TARGET_SPEED_STEP  =  25
TURNING_SPEED_STEP =  30
TURNING_ANGLE_STEP =  10
OBSTACLE_DISTANCE  =  30
SHUTDOWN_PITCH     =  30
DISTANCE_SAMPLES   =  100

# Default constants used by the speed PID controller
SPEED_PID_KP     = 0.040
SPEED_PID_KI     = 0.001
SPEED_PID_KD     = 0.000
SPEED_PID_TARGET = 0.00
SPEED_PID_MIN    = -TARGET_SPEED_STEP * 2
SPEED_PID_MAX    =  TARGET_SPEED_STEP * 2
SPEED_PID_WINDUP = 0.05

# Default constants used by the balance PID controller
BALANCE_PID_KP     = 35.00
BALANCE_PID_KI     = 120.00
BALANCE_PID_KD     = 0.10
BALANCE_PID_TARGET =  -2.0
BALANCE_PID_MIN    =  -motor.PWM_MAX
BALANCE_PID_MAX    =   motor.PWM_MAX
BALANCE_PID_WINDUP =  0.25

LEFT_MOTOR_ENABLE = 13
LEFT_MOTOR_PIN_1  = 19

RIGHT_MOTOR_ENABLE = 12
RIGHT_MOTOR_PIN_1  = 16

LEFT_MOTOR_ENCODER_PIN_1 = 22
LEFT_MOTOR_ENCODER_PIN_2 = 27

RIGHT_MOTOR_ENCODER_PIN_1 = 4
RIGHT_MOTOR_ENCODER_PIN_2 = 17


x_axis_value = 0
y_axis_value = 0
STICK_ERROR = 3276.00
MIDDLE_VALUE = 32768.00

debug_mode                  = True
are_motors_on               = True
is_camera_on                = True
is_camera_recording         = True
complementary_filter_factor = 0.998
distance_readings           = []
distance_samples            = DISTANCE_SAMPLES
equilibrium_angle           = BALANCE_PID_TARGET
equilibrium_limit           = 0.3
filtered_pitch              = 0.0
relative_yaw_angle          = 0.0
target_speed                = SPEED_PID_TARGET
turn_angle_order            = 0.0
turn_speed_step             = 0.0
left_counter                = 0
right_counter               = 0
elapsed_time                = 0.000000000000001


#function of diamond coordinates 
def steering(x, y):
    # convert to polar
    r = math.hypot(x, y)
    t = math.atan2(y, x)

    # rotate by 45 degrees
    t += math.pi / 4

    # back to cartesian
    left = r * math.cos(t)
    right = r * math.sin(t)

    # rescale the new coords
    left = left * math.sqrt(2)
    right = right * math.sqrt(2)

    # clamp to -1/+1
    left = max(-1, min(left, 1))
    right = max(-1, min(right, 1))

    return left, right


def balance_control_thread(imu_device, speed_pid_controller, balance_pid_controller):

    global debug_mode
    global complementary_filter_factor
    global distance_readings
    global distance_samples
    global equilibrium_angle
    global equilibrium_limit
    global filtered_pitch
    global relative_yaw_angle
    global target_speed
    global turn_angle_order
    global turn_speed_step
    global left_counter
    global right_counter
    global elapsed_time

    with open(SETUP_FILE, 'r') as json_file:
        setup_data = json.load(json_file)

    # Setup motors with their dedicated GPIOs and offsets
    left_motor  = motor.Motor(const.USE_RPI_GPIO, LEFT_MOTOR_ENABLE , LEFT_MOTOR_PIN_1 , setup_data['LEFT_MOTOR_OFFSET' ])
    right_motor = motor.Motor(const.USE_RPI_GPIO, RIGHT_MOTOR_ENABLE, RIGHT_MOTOR_PIN_1, setup_data['RIGHT_MOTOR_OFFSET'])

    # Setup left/right motors encoders with their dedicated GPIOs
    left_encoder  = encoder.Encoder(const.USE_RPI_GPIO, LEFT_MOTOR_ENCODER_PIN_1 , LEFT_MOTOR_ENCODER_PIN_2 )
    right_encoder = encoder.Encoder(const.USE_RPI_GPIO, RIGHT_MOTOR_ENCODER_PIN_1, RIGHT_MOTOR_ENCODER_PIN_2)

    # Setup IMU
    imu_device.reset        ()
    imu_device.reset_offsets()

    # Setup acceleration offsets
    imu_device.set_x_acceleration_offset(setup_data['ACCELERATION_X_OFFSET'])
    imu_device.set_y_acceleration_offset(setup_data['ACCELERATION_Y_OFFSET'])
    imu_device.set_z_acceleration_offset(setup_data['ACCELERATION_Z_OFFSET'])

    # Setup gyroscope offsets
    imu_device.set_x_gyroscope_offset(setup_data['GYROSCOPE_X_OFFSET'])
    imu_device.set_y_gyroscope_offset(setup_data['GYROSCOPE_Y_OFFSET'])
    imu_device.set_z_gyroscope_offset(setup_data['GYROSCOPE_Z_OFFSET'])

    while True:

        start_time = time.time()

        #speed computation
        speed_pid_controller.set_target(target_speed)

        left_counter  = left_encoder.get_counter()
        right_counter = right_encoder.get_counter()

        distance_readings.append((left_counter + right_counter) / 2)

        if len(distance_readings) > distance_samples:
            distance_readings.pop(0)
            current_speed = sum(distance_readings) / (distance_samples * elapsed_time)
        else:
            current_speed = target_speed

        target_angle = equilibrium_angle + speed_pid_controller.update(current_speed, distance_samples * elapsed_time)

        left_encoder.reset_counter ()
        right_encoder.reset_counter()

        #balance computation
        balance_pid_controller.set_target(target_angle)

        try:
            imu_device.read_acceleration_data()
            imu_device.read_gyroscope_data   ()
        except Exception as e:
            if debug_mode == True:
                print("IMU/I2C error detected")
                print("Error: " + str(e))
                print("Retrying!...")
            continue

        imu_device.compute_angles()
        imu_device.compute_rates ()

        pitch      = imu_device.get_pitch     ()
        pitch_rate = imu_device.get_pitch_rate()
        yaw_rate   = imu_device.get_yaw_rate  ()

        filtered_pitch    = complementary_filter_factor * (filtered_pitch + pitch_rate * elapsed_time) + (1 - complementary_filter_factor) * pitch
        balance_pid_speed = balance_pid_controller.update(filtered_pitch, elapsed_time)

        relative_yaw_angle += yaw_rate * elapsed_time

        #turn computation
        if (turn_speed_step > 0 and relative_yaw_angle >= turn_angle_order) \
        or (turn_speed_step < 0 and relative_yaw_angle <= turn_angle_order):

            turn_angle_order = 0.0
            turn_speed_step  = 0.0

            if debug_mode == True:
                print("Ordered turn is over!")

        #overal speed computetion
        overall_left_speed  = balance_pid_speed #+ turn_speed_step
        overall_right_speed = balance_pid_speed #- turn_speed_step

        #updating speed motors
        if (are_motors_on == False) \
            or ((overall_left_speed == 0) and (overall_right_speed == 0)) \
            or (target_angle - equilibrium_limit <= filtered_pitch <= target_angle + equilibrium_limit) \
            or (filtered_pitch <= -SHUTDOWN_PITCH) \
            or (filtered_pitch >= SHUTDOWN_PITCH):

            left_motor.stop ()
            right_motor.stop()

        else:

            if overall_left_speed > 0:
                left_motor.forward ( overall_left_speed)
            else:
                left_motor.backward(-overall_left_speed)

            if overall_right_speed > 0:
                right_motor.forward ( overall_right_speed)
            else:
                right_motor.backward(-overall_right_speed)

        end_time = time.time()

        elapsed_time = end_time - start_time




def bluetooth_control_thread():

    global debug_mode
    global are_motors_on
    global relative_yaw_angle
    global target_speed
    global turn_angle_order
    global turn_speed_step
    global x_axis_value
    global y_axis_value
    global STICK_ERROR
    global MIDDLE_VALUE
    

    #creates object gamepad
    gamepad = InputDevice('/dev/input/event0')

    #prints out device info at start
    print(gamepad)

    #display codes
    for event in gamepad.read_loop():

        if event.type == ecodes.EV_KEY:
            print(event)

        #Analog gamepad
        elif event.type == ecodes.EV_ABS:
            absevent = categorize(event)
            print("LEFT|RIGHT")
            plot = steering(x_axis_value, y_axis_value)
            print(plot)
            #print(ecodes.bytype[absevent.event.type][absevent.event.code], absevent.event.value)
            if ecodes.bytype[absevent.event.type][absevent.event.code] == "ABS_X": #LEFT 0 <-(YAXIS MIDDLE 32768)-> 65535 RIGHT
                if absevent.event.value   < MIDDLE_VALUE - STICK_ERROR:
                    x_axis_value = (absevent.event.value - MIDDLE_VALUE - STICK_ERROR) / (MIDDLE_VALUE - STICK_ERROR)

                elif absevent.event.value > MIDDLE_VALUE + STICK_ERROR:
                    x_axis_value = (absevent.event.value - MIDDLE_VALUE - STICK_ERROR) / (MIDDLE_VALUE - STICK_ERROR)                    

                else:
                    x_axis_value = 0

            elif ecodes.bytype[absevent.event.type][absevent.event.code] == "ABS_Y": #LEFT 0 <-(YAXIS MIDDLE 32768)-> 65535 RIGHT
                if absevent.event.value   < MIDDLE_VALUE - STICK_ERROR:
                    y_axis_value = (absevent.event.value - MIDDLE_VALUE - STICK_ERROR) / (MIDDLE_VALUE - STICK_ERROR)

                elif absevent.event.value > MIDDLE_VALUE + STICK_ERROR:
                    y_axis_value = (absevent.event.value - MIDDLE_VALUE - STICK_ERROR) / (MIDDLE_VALUE - STICK_ERROR)

                else:
                    y_axis_value = 0




def camera_control_thread():

    global debug_mode
    global is_camera_on
    global is_camera_recording

    if debug_mode == True:
        print("Initiating camera module")

    camera = picamera.PiCamera(resolution=streamer.IMAGE_WIDTH + 'x' + streamer.IMAGE_HEIGHT, framerate=12)

    while True:

        if is_camera_on and not is_camera_recording:

            if debug_mode == True:
                print("Camera starting to record")

            camera.start_recording(streamer.streaming_output, format='mjpeg')
            is_camera_recording = True

        elif not is_camera_on and is_camera_recording:

            if debug_mode == True:
                print("Camera stopping to record")

            camera.stop_recording()
            is_camera_recording = False

        else:

            time.sleep(0.1)


def streaming_control_thread():

    global debug_mode

    while True:

        if debug_mode == True:
            print("Initiating streaming server")

        try:
            address = ('', 8000)
            steamer = streamer.StreamingServer(address, streamer.StreamingHandler)
            steamer.serve_forever()
        except Exception as e:
            if debug_mode == True:
                print("Streaming server exception")
                print("Error: " + str(e))
                print("Restarting!...")


def print_help():

    print("")
    print("Enter 1 to select speed PID, 2 to select balance PID")
    print("Enter selected PID values like: 'p=12', 'i=0.15', d='100', w='0.05'")
    print("")
    print("Enter target speed value like        : 's=50'")
    print("Enter distance samples value like    : 'm=50'")
    print("Enter equilibrium angle value like   : 'a=-3.00'")
    print("Enter equilibrium limit value like   : 'e=0.30'")
    print("Enter complementary filter value like: 'k=0.95'")
    print("")
    print("Press c to display current PIDs' values")
    print("Press u to display current IMU's values")
    print("Press o to display other parameters")
    print("")
    print("Press q to go for operational mode")
    print("Press h to display this help")
    print("")


def debug_control_thread(imu_device, proximity_sensor, speed_pid_controller, balance_pid_controller):

    global debug_mode
    global complementary_filter_factor
    global distance_readings
    global distance_samples
    global equilibrium_angle
    global equilibrium_limit
    global filtered_pitch
    global relative_yaw_angle
    global target_speed
    global turn_angle_order
    global left_counter
    global right_counter

    selected_pid = 1

    print_help()

    while debug_mode == True:

        print("> ", end = '')



def main():

    global debug_mode
    global are_motors_on

    if debug_mode == True:
        os.system("clear")


    if debug_mode == True:
        print("*****    CURRENTLY RUNNING IN DEBUG MODE    *****")
    else:
        print("***** CURRENTLY RUNNING IN OPERATIONAL MODE *****")

    if are_motors_on == True:
        print("*****      MOTORS CURRENTLY TURNED ON       *****")
    else:
        print("*****      MOTORS CURRENTLY TURNED OFF      *****")

    print("")

    imu_device                 = imu.ImuDevice()
    proximity_sensor           = proximity.ProximitySensor(PROXIMITY_SENSOR_TRIGGER_PIN, PROXIMITY_SENSOR_ECHO_PIN)
    speed_pid_controller       = pid.Pid(SPEED_PID_KP  , SPEED_PID_KI  , SPEED_PID_KD  , SPEED_PID_TARGET  , SPEED_PID_MIN  , SPEED_PID_MAX  , SPEED_PID_WINDUP  )
    balance_pid_controller     = pid.Pid(BALANCE_PID_KP, BALANCE_PID_KI, BALANCE_PID_KD, BALANCE_PID_TARGET, BALANCE_PID_MIN, BALANCE_PID_MAX, BALANCE_PID_WINDUP)

    bluetooth_control = threading.Thread(target = bluetooth_control_thread, args = [])
    bluetooth_control.start()

    balance_control = threading.Thread(target = balance_control_thread, args = [imu_device, speed_pid_controller, balance_pid_controller])
    balance_control.start()


    camera_control = threading.Thread(target = camera_control_thread, args = [])
    camera_control.start()

    streaming_control = threading.Thread(target = streaming_control_thread, args = [])
    streaming_control.start()



    if debug_mode == True:
        user_input_control = threading.Thread(target = debug_control_thread, args = [imu_device, proximity_sensor, speed_pid_controller, balance_pid_controller])
        user_input_control.start()

    bluetooth_control.join()
    balance_control.join  ()
    camera_control.join   ()
    streaming_control.join()

    if debug_mode == True:
        user_input_control.join()


if __name__ == '__main__':

    try:

        main()

    except KeyboardInterrupt:
        print("Keyboard interrupt...")
        RPi.GPIO.cleanup()
        os._exit(0)

    except Exception as e:
        print("Error: " + str(e))

    finally:
        RPi.GPIO.cleanup()
        os._exit(0)
