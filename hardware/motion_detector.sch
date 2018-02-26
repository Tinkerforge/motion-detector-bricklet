EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:motion_detector-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Motion Detector Bricklet"
Date "2013-09-20"
Rev "1.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2013, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 600  7650 0    40   ~ 0
Copyright Tinkerforge GmbH 2013.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions\n
$Comp
L GND #PWR01
U 1 1 4CE147DC
P 5200 2900
F 0 "#PWR01" H 5200 2900 30  0001 C CNN
F 1 "GND" H 5200 2830 30  0001 C CNN
F 2 "" H 5200 2900 60  0001 C CNN
F 3 "" H 5200 2900 60  0001 C CNN
	1    5200 2900
	1    0    0    -1  
$EndComp
$Comp
L DRILL U4
U 1 1 4C692B9B
P 10600 6350
F 0 "U4" H 10650 6400 60  0001 C CNN
F 1 "DRILL" H 10600 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10600 6350 60  0001 C CNN
F 3 "" H 10600 6350 60  0001 C CNN
	1    10600 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U3
U 1 1 4C692B9A
P 10600 6150
F 0 "U3" H 10650 6200 60  0001 C CNN
F 1 "DRILL" H 10600 6150 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10600 6150 60  0001 C CNN
F 3 "" H 10600 6150 60  0001 C CNN
	1    10600 6150
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 4C692B98
P 10900 6150
F 0 "U5" H 10950 6200 60  0001 C CNN
F 1 "DRILL" H 10900 6150 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10900 6150 60  0001 C CNN
F 3 "" H 10900 6150 60  0001 C CNN
	1    10900 6150
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 4C692B94
P 10900 6350
F 0 "U6" H 10950 6400 60  0001 C CNN
F 1 "DRILL" H 10900 6350 60  0000 C CNN
F 2 "kicad-libraries:DRILL_NP" H 10900 6350 60  0001 C CNN
F 3 "" H 10900 6350 60  0001 C CNN
	1    10900 6350
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR02
U 1 1 4C5FD35E
P 4550 2750
F 0 "#PWR02" H 4550 2850 30  0001 C CNN
F 1 "VCC" H 4550 2850 30  0000 C CNN
F 2 "" H 4550 2750 60  0001 C CNN
F 3 "" H 4550 2750 60  0001 C CNN
	1    4550 2750
	1    0    0    -1  
$EndComp
$Comp
L CAT24C U1
U 1 1 4C5FD337
P 5000 3600
F 0 "U1" H 4850 4100 60  0000 C CNN
F 1 "M24C64" H 5000 3600 60  0000 C CNN
F 2 "kicad-libraries:SOIC8" H 5000 3600 60  0001 C CNN
F 3 "" H 5000 3600 60  0001 C CNN
	1    5000 3600
	-1   0    0    -1  
$EndComp
$Comp
L VCC #PWR03
U 1 1 4C5FCFB4
P 4150 3050
F 0 "#PWR03" H 4150 3150 30  0001 C CNN
F 1 "VCC" H 4150 3150 30  0000 C CNN
F 2 "" H 4150 3050 60  0001 C CNN
F 3 "" H 4150 3050 60  0001 C CNN
	1    4150 3050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR04
U 1 1 4C5FCF5E
P 4250 3350
F 0 "#PWR04" H 4250 3350 30  0001 C CNN
F 1 "GND" H 4250 3280 30  0001 C CNN
F 2 "" H 4250 3350 60  0001 C CNN
F 3 "" H 4250 3350 60  0001 C CNN
	1    4250 3350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR05
U 1 1 4C5FCF4F
P 3550 4250
F 0 "#PWR05" H 3550 4250 30  0001 C CNN
F 1 "GND" H 3550 4180 30  0001 C CNN
F 2 "" H 3550 4250 60  0001 C CNN
F 3 "" H 3550 4250 60  0001 C CNN
	1    3550 4250
	1    0    0    -1  
$EndComp
$Comp
L CON-SENSOR P1
U 1 1 4C5FCF27
P 3550 3550
F 0 "P1" H 3300 4100 60  0000 C CNN
F 1 "CON-SENSOR" V 3700 3550 60  0000 C CNN
F 2 "kicad-libraries:CON-SENSOR" H 3550 3550 60  0001 C CNN
F 3 "" H 3550 3550 60  0001 C CNN
	1    3550 3550
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 55DCAB0B
P 5450 3550
F 0 "#PWR06" H 5450 3550 30  0001 C CNN
F 1 "GND" H 5450 3480 30  0001 C CNN
F 2 "" H 5450 3550 60  0001 C CNN
F 3 "" H 5450 3550 60  0001 C CNN
	1    5450 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 55DCAB26
P 6750 4250
F 0 "#PWR07" H 6750 4250 30  0001 C CNN
F 1 "GND" H 6750 4180 30  0001 C CNN
F 2 "" H 6750 4250 60  0001 C CNN
F 3 "" H 6750 4250 60  0001 C CNN
	1    6750 4250
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 55DCACDB
P 5250 3800
F 0 "R1" V 5250 3900 50  0000 C CNN
F 1 "1k" V 5250 3700 50  0000 C CNN
F 2 "kicad-libraries:0603" H 5250 3800 60  0001 C CNN
F 3 "" H 5250 3800 60  0000 C CNN
	1    5250 3800
	0    -1   -1   0   
$EndComp
NoConn ~ 4000 4000
$Comp
L C C1
U 1 1 4CE147C5
P 4950 2850
F 0 "C1" V 4900 2700 50  0000 L CNN
F 1 "100nF" V 4800 2750 50  0000 L CNN
F 2 "kicad-libraries:0603" H 4950 2850 60  0001 C CNN
F 3 "" H 4950 2850 60  0001 C CNN
	1    4950 2850
	0    1    1    0   
$EndComp
$Comp
L LED D1
U 1 1 5A93EC5E
P 4500 3800
F 0 "D1" H 4600 3900 50  0000 C CNN
F 1 "LED" H 4400 3900 50  0000 C CNN
F 2 "kicad-libraries:0603" H 4500 3800 50  0001 C CNN
F 3 "" H 4500 3800 50  0000 C CNN
	1    4500 3800
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR08
U 1 1 5A93ED24
P 5700 3600
F 0 "#PWR08" H 5700 3700 30  0001 C CNN
F 1 "VCC" H 5700 3700 30  0000 C CNN
F 2 "" H 5700 3600 60  0001 C CNN
F 3 "" H 5700 3600 60  0001 C CNN
	1    5700 3600
	1    0    0    -1  
$EndComp
NoConn ~ 4000 3900
NoConn ~ 4600 3300
$Comp
L +5V #PWR09
U 1 1 5A93F529
P 4050 3050
F 0 "#PWR09" H 4050 3150 30  0001 C CNN
F 1 "+5V" H 4050 3150 30  0000 C CNN
F 2 "" H 4050 3050 60  0001 C CNN
F 3 "" H 4050 3050 60  0001 C CNN
	1    4050 3050
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR010
U 1 1 5A93F640
P 6400 3100
F 0 "#PWR010" H 6400 3200 30  0001 C CNN
F 1 "+5V" H 6400 3200 30  0000 C CNN
F 2 "" H 6400 3100 60  0001 C CNN
F 3 "" H 6400 3100 60  0001 C CNN
	1    6400 3100
	1    0    0    -1  
$EndComp
$Comp
L HC-SR501 U2
U 1 1 5A93F94D
P 7050 3500
F 0 "U2" H 7000 3900 60  0000 C CNN
F 1 "HC-SR501" H 7100 3100 60  0000 C CNN
F 2 "kicad-libraries:HC-SR501" H 7050 3500 60  0001 C CNN
F 3 "" H 7050 3500 60  0000 C CNN
	1    7050 3500
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5A940226
P 6400 3700
F 0 "C2" V 6350 3550 50  0000 L CNN
F 1 "100nF" V 6250 3600 50  0000 L CNN
F 2 "kicad-libraries:0603" H 6400 3700 60  0001 C CNN
F 3 "" H 6400 3700 60  0001 C CNN
	1    6400 3700
	-1   0    0    1   
$EndComp
NoConn ~ 6800 3200
$Comp
L GND #PWR011
U 1 1 5A940679
P 6400 4250
F 0 "#PWR011" H 6400 4250 30  0001 C CNN
F 1 "GND" H 6400 4180 30  0001 C CNN
F 2 "" H 6400 4250 60  0001 C CNN
F 3 "" H 6400 4250 60  0001 C CNN
	1    6400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3050 4150 3300
Wire Wire Line
	4150 3300 4000 3300
Wire Wire Line
	4000 3500 4600 3500
Wire Wire Line
	4000 3600 5550 3600
Wire Wire Line
	3550 4250 3550 4150
Wire Wire Line
	4000 3400 4600 3400
Wire Wire Line
	4000 3200 4250 3200
Wire Wire Line
	4250 3200 4250 3350
Wire Wire Line
	5550 3600 5550 3400
Wire Wire Line
	5550 3400 5400 3400
Wire Wire Line
	5450 3550 5450 3200
Wire Wire Line
	5450 3200 5400 3200
Wire Wire Line
	5400 3300 5450 3300
Connection ~ 5450 3300
Wire Wire Line
	5400 3500 5450 3500
Connection ~ 5450 3500
Wire Wire Line
	4600 3200 4550 3200
Wire Wire Line
	4550 3200 4550 2750
Wire Wire Line
	4550 2850 4750 2850
Connection ~ 4550 2850
Wire Wire Line
	5150 2850 5200 2850
Wire Wire Line
	5200 2850 5200 2900
Wire Wire Line
	5500 3800 5700 3800
Wire Wire Line
	5700 3800 5700 3600
Wire Wire Line
	5000 3800 4700 3800
Wire Wire Line
	4300 3800 4000 3800
Wire Wire Line
	4000 3700 6800 3700
Wire Wire Line
	4050 3050 4050 3100
Wire Wire Line
	4050 3100 4000 3100
Wire Wire Line
	6800 3800 6750 3800
Wire Wire Line
	6750 3800 6750 4250
Wire Wire Line
	6800 3600 6650 3600
Wire Wire Line
	6650 3600 6650 3400
Wire Wire Line
	6650 3400 6400 3400
Wire Wire Line
	6400 3100 6400 3500
Connection ~ 6400 3400
Wire Wire Line
	6800 3400 6750 3400
Wire Wire Line
	6750 3400 6750 3300
Wire Wire Line
	6750 3300 6800 3300
Wire Wire Line
	6400 3900 6400 4250
$EndSCHEMATC
