# Self-balance-robot-project

Self balance robot project include CAD models of robot, PCB project and Python code.
You can control this robot by Xbox gamepad, also you can stream video of camera.
Robot has got ultrasonic sensors on it, but code is not prepared yet.

BOM:
* Pololu motor driver drv8835
* IMU MPU 6050
* Pololu motor encoders
* Raspberry Pi 3B+ or Raspberry Pi Zero W
* Pololu encoders
* Pololu 997 micro DC motors HP 100:1 
* Pi Camera

# Motor calibration

To calibrate your motors you need run script calibrate_motors.py and follow instructions listed on screen:

sudo python3 calibrate_motors.py


# IMU calibration

To calibrate your imu you need to put robot in horizontal position and run script calibrate_imu.py and follow instructions listed on screen:

sudo python3 calibrate_imu.py

# Xbox pad connection

To connect your xbox pad you need to use bluetoothctl:

1.install xbox pad drivers:

	sudo apt-get install xboxdrv
	
2. Disable Enhanced Re-Transmission Mode (ERTM):

	echo 'options bluetooth disable_ertm=Y' | sudo tee -a /etc/modprobe.d/bluetooth.conf
	
3. restart your Raspberry:

	sudo reboot now
	
4. Run bluetooth tools:

	sudo bluetoothctl
	
5. Now you need to search and connect to your pad, also you can trust yours device to connect automatically after each gamepad power on:

	agent on
	
	default-agent
	
	scan on
	
	connect GAMEPAD_MAC_ADDRESS
	
	trust GAMEPAD_MAC_ADDRESS
