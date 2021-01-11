EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Self-balancing-robot-pcb"
Date "2020-12-06"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x04_Female HC-SR4
U 1 1 5FC54581
P 1600 2150
F 0 "HC-SR4" H 1628 2126 50  0000 L CNN
F 1 "Conn_01x04_Female" H 1628 2035 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 1600 2150 50  0001 C CNN
F 3 "~" H 1600 2150 50  0001 C CNN
	1    1600 2150
	-1   0    0    1   
$EndComp
Text GLabel 8300 1400 0    50   Input ~ 0
SDA
Text GLabel 8300 1500 0    50   Input ~ 0
SCL
Text GLabel 1800 1150 2    50   Input ~ 0
SDA
Text GLabel 1800 1250 2    50   Input ~ 0
SCL
NoConn ~ 1800 1050
NoConn ~ 1800 950 
NoConn ~ 1800 850 
NoConn ~ 1800 750 
$Comp
L power:GND #PWR08
U 1 1 5FC807EC
P 2100 1450
F 0 "#PWR08" H 2100 1200 50  0001 C CNN
F 1 "GND" V 2105 1322 50  0000 R CNN
F 2 "" H 2100 1450 50  0001 C CNN
F 3 "" H 2100 1450 50  0001 C CNN
	1    2100 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FC848C5
P 2200 1950
F 0 "#PWR011" H 2200 1700 50  0001 C CNN
F 1 "GND" V 2205 1822 50  0000 R CNN
F 2 "" H 2200 1950 50  0001 C CNN
F 3 "" H 2200 1950 50  0001 C CNN
	1    2200 1950
	0    -1   -1   0   
$EndComp
Text GLabel 1800 2050 2    50   Input ~ 0
ECHO
Text GLabel 1800 2150 2    50   Input ~ 0
TRIG
Text Label 8400 1400 0    50   ~ 0
GPIO02
Text Label 8400 1500 0    50   ~ 0
GPIO03
Text Label 8500 3200 0    50   ~ 0
GND
Text Label 9200 1500 0    50   ~ 0
GND
Text Label 9200 3000 0    50   ~ 0
GPIO16
Text Label 9200 1300 0    50   ~ 0
5V
Text Label 9200 1400 0    50   ~ 0
5V
Text Label 8400 2900 0    50   ~ 0
GPIO13
Text Label 8400 3100 0    50   ~ 0
GPIO26
Text Label 9200 2800 0    50   ~ 0
GPIO12
Text GLabel 8300 3100 0    50   Input ~ 0
MODE
Text Label 8400 3000 0    50   ~ 0
GPIO19
Text GLabel 8300 2300 0    50   Input ~ 0
R_OUT_B
Text GLabel 8300 2400 0    50   Input ~ 0
L_OUT_A
$Comp
L power:GND #PWR021
U 1 1 5FD55175
P 7800 3200
F 0 "#PWR021" H 7800 2950 50  0001 C CNN
F 1 "GND" H 7805 3027 50  0000 C CNN
F 2 "" H 7800 3200 50  0001 C CNN
F 3 "" H 7800 3200 50  0001 C CNN
	1    7800 3200
	0    1    1    0   
$EndComp
Text Label 9200 2400 0    50   ~ 0
GPIO08
Text GLabel 8300 2900 0    50   Input ~ 0
IN2_EN_A
Text GLabel 8300 3000 0    50   Input ~ 0
IN1_PH_A
Text Label 9200 2000 0    50   ~ 0
GPIO23
Text GLabel 8300 2700 0    50   Input ~ 0
L_OUT_B
Text GLabel 8300 2200 0    50   Input ~ 0
R_OUT_A
Text Label 9200 3100 0    50   ~ 0
GPIO20
Text Label 9200 3200 0    50   ~ 0
GPIO21
Text Label 9200 2100 0    50   ~ 0
GPIO24
Text Label 8400 2200 0    50   ~ 0
GPIO10
Text Label 8400 2300 0    50   ~ 0
GPIO09
Text Label 8400 2400 0    50   ~ 0
GPIO11
Text GLabel 8300 1800 0    50   Input ~ 0
IN2_EN_B
Text GLabel 8300 1900 0    50   Input ~ 0
IN1_PH_B
$Comp
L Connector:Conn_01x06_Female Left_DC_motor1
U 1 1 5FC5C01D
P 1900 4950
F 0 "Left_DC_motor1" H 1792 4425 50  0000 C CNN
F 1 "Conn_01x06_Female" H 1792 4516 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1900 4950 50  0001 C CNN
F 3 "~" H 1900 4950 50  0001 C CNN
	1    1900 4950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x06_Female Right_DC_motor1
U 1 1 5FC5E2C3
P 1950 5950
F 0 "Right_DC_motor1" H 1842 5425 50  0000 C CNN
F 1 "Conn_01x06_Female" H 1842 5516 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 1950 5950 50  0001 C CNN
F 3 "~" H 1950 5950 50  0001 C CNN
	1    1950 5950
	1    0    0    -1  
$EndComp
Text GLabel 1700 4850 0    50   Input ~ 0
L_OUT_B
Text GLabel 1750 5850 0    50   Input ~ 0
R_OUT_B
Text GLabel 1750 5950 0    50   Input ~ 0
R_OUT_A
Text GLabel 1700 4950 0    50   Input ~ 0
L_OUT_A
$Comp
L power:GND #PWR05
U 1 1 5FCCB5A1
P 1250 5750
F 0 "#PWR05" H 1250 5500 50  0001 C CNN
F 1 "GND" V 1255 5622 50  0000 R CNN
F 2 "" H 1250 5750 50  0001 C CNN
F 3 "" H 1250 5750 50  0001 C CNN
	1    1250 5750
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5FCCC7BB
P 1250 4750
F 0 "#PWR03" H 1250 4500 50  0001 C CNN
F 1 "GND" V 1255 4622 50  0000 R CNN
F 2 "" H 1250 4750 50  0001 C CNN
F 3 "" H 1250 4750 50  0001 C CNN
	1    1250 4750
	0    1    -1   0   
$EndComp
Text GLabel 1750 6150 0    50   Input ~ 0
R_M2
Text GLabel 1750 6250 0    50   Input ~ 0
R_M1
Text GLabel 1700 5150 0    50   Input ~ 0
L_M2
Text GLabel 1700 5250 0    50   Input ~ 0
L_M1
NoConn ~ 8700 1600
NoConn ~ 8700 2600
NoConn ~ 9200 2600
Text Label 9500 1700 2    50   ~ 0
GPIO15
Text Label 9500 1600 2    50   ~ 0
GPIO14
Wire Wire Line
	8700 1400 8300 1400
Wire Wire Line
	8700 1500 8300 1500
Wire Wire Line
	8700 2200 8300 2200
Wire Wire Line
	8700 3000 8300 3000
Wire Wire Line
	8700 2900 8300 2900
Wire Wire Line
	8300 3100 8700 3100
Wire Wire Line
	8300 1900 8700 1900
Wire Wire Line
	8300 2700 8700 2700
Wire Wire Line
	8300 2400 8700 2400
Text Label 9200 2500 0    50   ~ 0
GPIO07
Wire Wire Line
	8300 1800 8700 1800
Wire Wire Line
	1700 4750 1250 4750
Wire Wire Line
	1700 5050 1250 5050
Wire Wire Line
	1750 5750 1250 5750
Wire Wire Line
	1750 6050 1250 6050
Wire Wire Line
	2200 1950 1800 1950
Wire Wire Line
	2200 2250 1800 2250
Wire Wire Line
	2100 1350 1800 1350
Wire Wire Line
	2100 1450 1800 1450
NoConn ~ 9200 1800
NoConn ~ 8700 2000
NoConn ~ 9200 2300
Text GLabel 1100 3950 0    50   Input ~ 0
R_M1
Text GLabel 1100 4050 0    50   Input ~ 0
R_M2
Text GLabel 1100 3850 0    50   Input ~ 0
L_M1
Text GLabel 1100 3750 0    50   Input ~ 0
L_M2
Text GLabel 1600 4150 0    50   Input ~ 0
MODE
Text Label 1450 3750 0    50   ~ 0
O2B
Text Label 1450 3850 0    50   ~ 0
O1B
Text Label 1450 3950 0    50   ~ 0
O2A
Text Label 1450 4050 0    50   ~ 0
O1A
Wire Wire Line
	1100 4050 1600 4050
Wire Wire Line
	1100 3950 1600 3950
Wire Wire Line
	1100 3850 1600 3850
Wire Wire Line
	1100 3750 1600 3750
$Comp
L power:GND #PWR01
U 1 1 5FCB7476
P 1600 3550
F 0 "#PWR01" H 1600 3300 50  0001 C CNN
F 1 "GND" V 1605 3422 50  0000 R CNN
F 2 "" H 1600 3550 50  0001 C CNN
F 3 "" H 1600 3550 50  0001 C CNN
	1    1600 3550
	0    1    1    0   
$EndComp
Text GLabel 2150 4050 2    50   Input ~ 0
IN1_PH_A
Text GLabel 2150 3950 2    50   Input ~ 0
IN2_EN_A
Text GLabel 2150 3850 2    50   Input ~ 0
IN1_PH_B
Text GLabel 2150 3750 2    50   Input ~ 0
IN2_EN_B
$Comp
L power:GND #PWR09
U 1 1 5FCBE873
P 2150 3550
F 0 "#PWR09" H 2150 3300 50  0001 C CNN
F 1 "GND" V 2155 3422 50  0000 R CNN
F 2 "" H 2150 3550 50  0001 C CNN
F 3 "" H 2150 3550 50  0001 C CNN
	1    2150 3550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2150 4150 2600 4150
$Comp
L Connector_Generic:Conn_01x07 DRV8835
U 1 1 5FCE9D9C
P 1800 3850
F 0 "DRV8835" H 1400 4350 50  0000 L CNN
F 1 "Conn_01x07" H 1250 4275 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 1800 3850 50  0001 C CNN
F 3 "~" H 1800 3850 50  0001 C CNN
	1    1800 3850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x07 J2
U 1 1 5FCEACDE
P 1950 3850
F 0 "J2" H 1600 3350 50  0001 C CNN
F 1 "Conn_01x07" H 1575 3425 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x07_P2.54mm_Vertical" H 1950 3850 50  0001 C CNN
F 3 "~" H 1950 3850 50  0001 C CNN
	1    1950 3850
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5FCB87DD
P 3750 5250
F 0 "H4" H 3850 5250 50  0000 L CNN
F 1 "MountingHole" H 3850 5205 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 5250 50  0001 C CNN
F 3 "~" H 3750 5250 50  0001 C CNN
	1    3750 5250
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5FCBA065
P 3750 5050
F 0 "H3" H 3850 5050 50  0000 L CNN
F 1 "MountingHole" H 3850 5005 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 5050 50  0001 C CNN
F 3 "~" H 3750 5050 50  0001 C CNN
	1    3750 5050
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5FCC52DD
P 3750 4850
F 0 "H2" H 3850 4850 50  0000 L CNN
F 1 "MountingHole" H 3850 4805 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 4850 50  0001 C CNN
F 3 "~" H 3750 4850 50  0001 C CNN
	1    3750 4850
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5FCCB2AF
P 3750 4650
F 0 "H1" H 3850 4650 50  0000 L CNN
F 1 "MountingHole" H 3850 4605 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 4650 50  0001 C CNN
F 3 "~" H 3750 4650 50  0001 C CNN
	1    3750 4650
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H8
U 1 1 5FCD1568
P 3750 6200
F 0 "H8" H 3850 6200 50  0000 L CNN
F 1 "MountingHole" H 3850 6155 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 6200 50  0001 C CNN
F 3 "~" H 3750 6200 50  0001 C CNN
	1    3750 6200
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H7
U 1 1 5FCD77B9
P 3750 6000
F 0 "H7" H 3850 6000 50  0000 L CNN
F 1 "MountingHole" H 3850 5955 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 6000 50  0001 C CNN
F 3 "~" H 3750 6000 50  0001 C CNN
	1    3750 6000
	-1   0    0    1   
$EndComp
Wire Wire Line
	8700 3200 7800 3200
Wire Wire Line
	9200 1300 9600 1300
Wire Wire Line
	9200 1400 9600 1400
Wire Wire Line
	9600 1400 9600 1300
Connection ~ 9600 1300
Wire Wire Line
	9600 1300 10050 1300
Wire Wire Line
	9200 1500 10050 1500
$Comp
L power:GND #PWR029
U 1 1 5FD056C1
P 10050 1500
F 0 "#PWR029" H 10050 1250 50  0001 C CNN
F 1 "GND" V 10055 1372 50  0000 R CNN
F 2 "" H 10050 1500 50  0001 C CNN
F 3 "" H 10050 1500 50  0001 C CNN
	1    10050 1500
	0    -1   -1   0   
$EndComp
NoConn ~ 9200 2200
NoConn ~ 8700 2500
NoConn ~ 8700 1700
NoConn ~ 9200 2900
NoConn ~ 8700 1300
NoConn ~ 9200 1900
NoConn ~ 9200 2700
NoConn ~ 8700 2800
$Comp
L power:+5V #PWR012
U 1 1 5FE263CF
P 2200 2250
F 0 "#PWR012" H 2200 2100 50  0001 C CNN
F 1 "+5V" V 2215 2378 50  0000 L CNN
F 2 "" H 2200 2250 50  0001 C CNN
F 3 "" H 2200 2250 50  0001 C CNN
	1    2200 2250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR04
U 1 1 5FE28BFE
P 1250 5050
F 0 "#PWR04" H 1250 4900 50  0001 C CNN
F 1 "+5V" V 1265 5178 50  0000 L CNN
F 2 "" H 1250 5050 50  0001 C CNN
F 3 "" H 1250 5050 50  0001 C CNN
	1    1250 5050
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR06
U 1 1 5FE2926F
P 1250 6050
F 0 "#PWR06" H 1250 5900 50  0001 C CNN
F 1 "+5V" V 1265 6178 50  0000 L CNN
F 2 "" H 1250 6050 50  0001 C CNN
F 3 "" H 1250 6050 50  0001 C CNN
	1    1250 6050
	0    -1   1    0   
$EndComp
$Comp
L power:+5V #PWR07
U 1 1 5FE298FA
P 2100 1350
F 0 "#PWR07" H 2100 1200 50  0001 C CNN
F 1 "+5V" V 2115 1478 50  0000 L CNN
F 2 "" H 2100 1350 50  0001 C CNN
F 3 "" H 2100 1350 50  0001 C CNN
	1    2100 1350
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR028
U 1 1 5FE31691
P 10050 1300
F 0 "#PWR028" H 10050 1150 50  0001 C CNN
F 1 "+5V" V 10065 1428 50  0000 L CNN
F 2 "" H 10050 1300 50  0001 C CNN
F 3 "" H 10050 1300 50  0001 C CNN
	1    10050 1300
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR015
U 1 1 5FE31F59
P 2600 4150
F 0 "#PWR015" H 2600 4000 50  0001 C CNN
F 1 "+5V" V 2615 4278 50  0000 L CNN
F 2 "" H 2600 4150 50  0001 C CNN
F 3 "" H 2600 4150 50  0001 C CNN
	1    2600 4150
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR010
U 1 1 5FE326C0
P 2150 3650
F 0 "#PWR010" H 2150 3500 50  0001 C CNN
F 1 "+5V" V 2165 3778 50  0000 L CNN
F 2 "" H 2150 3650 50  0001 C CNN
F 3 "" H 2150 3650 50  0001 C CNN
	1    2150 3650
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5FE32DB5
P 1600 3650
F 0 "#PWR02" H 1600 3500 50  0001 C CNN
F 1 "+5V" V 1615 3778 50  0000 L CNN
F 2 "" H 1600 3650 50  0001 C CNN
F 3 "" H 1600 3650 50  0001 C CNN
	1    1600 3650
	0    -1   -1   0   
$EndComp
NoConn ~ 9200 3200
$Comp
L Mechanical:MountingHole H6
U 1 1 5FDBA77F
P 3750 5800
F 0 "H6" H 3850 5800 50  0000 L CNN
F 1 "MountingHole" H 3850 5755 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 5800 50  0001 C CNN
F 3 "~" H 3750 5800 50  0001 C CNN
	1    3750 5800
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5FDBBAF5
P 3750 5600
F 0 "H5" H 3850 5600 50  0000 L CNN
F 1 "MountingHole" H 3850 5555 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3750 5600 50  0001 C CNN
F 3 "~" H 3750 5600 50  0001 C CNN
	1    3750 5600
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H12
U 1 1 5FDC9A6C
P 3800 7100
F 0 "H12" H 3900 7100 50  0000 L CNN
F 1 "MountingHole" H 3900 7055 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3800 7100 50  0001 C CNN
F 3 "~" H 3800 7100 50  0001 C CNN
	1    3800 7100
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H11
U 1 1 5FDC9A72
P 3800 6900
F 0 "H11" H 3900 6900 50  0000 L CNN
F 1 "MountingHole" H 3900 6855 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3800 6900 50  0001 C CNN
F 3 "~" H 3800 6900 50  0001 C CNN
	1    3800 6900
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H10
U 1 1 5FDC9A78
P 3800 6700
F 0 "H10" H 3900 6700 50  0000 L CNN
F 1 "MountingHole" H 3900 6655 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3800 6700 50  0001 C CNN
F 3 "~" H 3800 6700 50  0001 C CNN
	1    3800 6700
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H9
U 1 1 5FDC9A7E
P 3800 6500
F 0 "H9" H 3900 6500 50  0000 L CNN
F 1 "MountingHole" H 3900 6455 50  0001 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3800 6500 50  0001 C CNN
F 3 "~" H 3800 6500 50  0001 C CNN
	1    3800 6500
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole H13
U 1 1 5FDC92E2
P 3800 7350
F 0 "H13" H 3900 7350 50  0000 L CNN
F 1 "MountingHole" H 3900 7305 50  0001 L CNN
F 2 "MountingHole:MountingHole_8.4mm_M8" H 3800 7350 50  0001 C CNN
F 3 "~" H 3800 7350 50  0001 C CNN
	1    3800 7350
	-1   0    0    1   
$EndComp
Text Notes 4000 6950 0    50   ~ 0
Holes for Raspberry Pi Camera\n
Text Notes 3950 5950 0    50   ~ 0
Holes for ultrasonic sensors\n
Text Notes 3950 5000 0    50   ~ 0
Holes for Raspberry Pi Zero \n
Wire Notes Line
	3500 4500 5100 4500
Wire Notes Line
	5100 4500 5100 5400
Wire Notes Line
	5100 5400 3500 5400
Wire Notes Line
	3500 5400 3500 4500
Wire Notes Line
	3500 5450 5100 5450
Wire Notes Line
	5100 5450 5100 6300
Wire Notes Line
	5100 6300 3500 6300
Wire Notes Line
	3500 6300 3500 5450
Wire Notes Line
	3500 6350 5250 6350
Wire Notes Line
	5250 6350 5250 7500
Wire Notes Line
	5250 7500 3500 7500
Wire Notes Line
	3500 7500 3500 6350
Wire Notes Line
	700  1750 2550 1750
Wire Notes Line
	700  600  2450 600 
Wire Notes Line
	2450 600  2450 1600
Wire Notes Line
	2450 1600 700  1600
Wire Notes Line
	700  1600 700  600 
Wire Notes Line
	750  3150 2950 3150
Wire Notes Line
	2950 3150 2950 4350
Wire Notes Line
	2950 4350 750  4350
Wire Notes Line
	750  4350 750  3150
Wire Notes Line
	850  4550 2250 4550
Wire Notes Line
	2250 4550 2250 5550
Wire Notes Line
	2250 5550 850  5550
Wire Notes Line
	850  5550 850  4550
Wire Notes Line
	850  5600 2250 5600
Wire Notes Line
	2250 5600 2250 6550
Wire Notes Line
	2250 6550 850  6550
Wire Notes Line
	850  6550 850  5600
Wire Notes Line
	7350 950  10450 950 
Wire Notes Line
	10450 950  10450 3450
Wire Notes Line
	10450 3450 7350 3450
Wire Notes Line
	7350 3450 7350 950 
$Comp
L Connector:Conn_01x08_Female MPU6050
U 1 1 5FC4F4F7
P 1600 1150
F 0 "MPU6050" H 1628 1126 50  0000 L CNN
F 1 "Conn_01x08_Female" H 1628 1035 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x08_P2.54mm_Vertical" H 1600 1150 50  0001 C CNN
F 3 "~" H 1600 1150 50  0001 C CNN
	1    1600 1150
	-1   0    0    1   
$EndComp
NoConn ~ 3700 6250
Wire Notes Line
	700  1750 700  2400
Wire Notes Line
	700  2400 2550 2400
Wire Notes Line
	2550 2400 2550 1750
Wire Wire Line
	9200 1600 9600 1600
Text GLabel 9600 1700 2    50   Input ~ 0
ECHO
Text Label 8400 1800 0    50   ~ 0
GPIO17
Text GLabel 9600 1600 2    50   Input ~ 0
TRIG
Wire Wire Line
	9600 1700 9200 1700
Text Label 8400 1900 0    50   ~ 0
GPIO27
$Comp
L Connector_Generic:Conn_02x20_Odd_Even RPI_0_W1
U 1 1 5FD2B281
P 8900 2200
F 0 "RPI_0_W1" H 8950 3317 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 8950 3226 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 8900 2200 50  0001 C CNN
F 3 "~" H 8900 2200 50  0001 C CNN
	1    8900 2200
	1    0    0    -1  
$EndComp
Text Label 8400 2700 0    50   ~ 0
GPIO05
Text Label 8500 2500 0    50   ~ 0
GND
Wire Wire Line
	8300 2300 8700 2300
NoConn ~ 9200 2100
NoConn ~ 9200 2400
NoConn ~ 9200 2800
NoConn ~ 9200 3000
NoConn ~ 9200 3100
NoConn ~ 9200 2000
$Comp
L Self-balancing-robot-pcb-library:Step-up_converter Coverter_LM2577
U 1 1 5FE8237B
P 8950 5300
F 0 "Coverter_LM2577" H 8950 6115 50  0000 C CNN
F 1 "Step-up_converter" H 8950 6024 50  0000 C CNN
F 2 "Self-balancing-robot-pcb:Step-up_converter_40x31" H 8950 5300 50  0001 C CNN
F 3 "" H 8950 5300 50  0001 C CNN
	1    8950 5300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5FE862DA
P 9550 5050
F 0 "#PWR017" H 9550 4800 50  0001 C CNN
F 1 "GND" V 9555 4922 50  0000 R CNN
F 2 "" H 9550 5050 50  0001 C CNN
F 3 "" H 9550 5050 50  0001 C CNN
	1    9550 5050
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR016
U 1 1 5FE86B42
P 9550 4800
F 0 "#PWR016" H 9550 4650 50  0001 C CNN
F 1 "+5V" V 9565 4928 50  0000 L CNN
F 2 "" H 9550 4800 50  0001 C CNN
F 3 "" H 9550 4800 50  0001 C CNN
	1    9550 4800
	0    1    1    0   
$EndComp
NoConn ~ 9200 2500
NoConn ~ 8700 2100
$Comp
L Device:Battery BT1
U 1 1 5FEA8E71
P 7650 4950
F 0 "BT1" H 7768 5046 50  0000 L CNN
F 1 "Battery_Cell" H 7768 4955 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 7650 5010 50  0001 C CNN
F 3 "~" V 7650 5010 50  0001 C CNN
	1    7650 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 5050 8200 5050
Wire Wire Line
	8350 4800 8200 4800
Wire Wire Line
	7650 4750 8200 4750
Wire Wire Line
	8200 4750 8200 4800
Wire Wire Line
	8200 5050 8200 5150
Wire Wire Line
	8200 5150 7650 5150
$EndSCHEMATC
