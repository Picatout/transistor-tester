EESchema Schematic File Version 2  date 2013-03-15 12:44:30
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
LIBS:special
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
LIBS:transistor-tester-cache
EELAYER 24  0
EELAYER END
$Descr A4 11700 8267
Sheet 1 1
Title ""
Date "15 mar 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4150 2650 4150 3600
Wire Wire Line
	4150 2650 5850 2650
Wire Wire Line
	7700 4450 4350 4450
Connection ~ 4900 5000
Wire Wire Line
	4900 5000 4100 5000
Wire Wire Line
	4100 5000 4100 3850
Wire Wire Line
	4100 3850 4350 3850
Wire Wire Line
	7700 4450 7700 4150
Wire Wire Line
	5850 4050 7000 4050
Wire Wire Line
	5300 4800 5300 5200
Wire Wire Line
	3250 4000 3250 4150
Wire Wire Line
	3550 3600 2300 3600
Wire Wire Line
	6300 3700 6300 3600
Wire Wire Line
	6300 3600 5850 3600
Wire Wire Line
	4150 3600 4350 3600
Wire Wire Line
	2300 4200 2300 4400
Wire Wire Line
	4900 4800 4900 5200
Wire Wire Line
	7500 4050 7700 4050
Wire Wire Line
	4350 4450 4350 4050
Wire Wire Line
	5300 5000 6800 5000
Connection ~ 5300 5000
Wire Wire Line
	6800 5000 6800 3950
Wire Wire Line
	6800 3950 7700 3950
Wire Wire Line
	5850 3150 5850 3350
$Comp
L R R?
U 1 1 514345CF
P 5850 2900
F 0 "R?" V 5930 2900 50  0000 C CNN
F 1 "56K" V 5850 2900 50  0000 C CNN
	1    5850 2900
	1    0    0    -1  
$EndComp
Text Notes 8200 4000 0    60   ~ 0
C\nB\nE\n
$Comp
L PIC10F202 U?
U 1 1 51432993
P 4250 2600
F 0 "U?" H 5100 1500 60  0000 C CNN
F 1 "PIC10F202" H 5050 2100 60  0000 C CNN
	1    4250 2600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 5141FEBF
P 3250 4150
F 0 "#PWR2" H 3250 4150 30  0001 C CNN
F 1 "GND" H 3250 4080 30  0001 C CNN
	1    3250 4150
	1    0    0    -1  
$EndComp
$Comp
L SW_PUSH SW1
U 1 1 5141FEA2
P 3850 3600
F 0 "SW1" H 4000 3710 50  0000 C CNN
F 1 "test" H 3850 3520 50  0000 C CNN
	1    3850 3600
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 5141FE97
P 3250 3800
F 0 "C1" H 3300 3900 50  0000 L CNN
F 1 "100nF" H 3300 3700 50  0000 L CNN
	1    3250 3800
	1    0    0    -1  
$EndComp
Text Notes 7400 7550 0    60   ~ 0
transistor tester\n
$Comp
L LED D2
U 1 1 5141F2B4
P 5100 5200
F 0 "D2" H 5100 5300 50  0000 C CNN
F 1 "red pnp" H 5100 5100 50  0000 C CNN
	1    5100 5200
	-1   0    0    1   
$EndComp
$Comp
L LED D1
U 1 1 5141F2AD
P 5100 4800
F 0 "D1" H 5100 4900 50  0000 C CNN
F 1 "green NPN" H 5100 4700 50  0000 C CNN
	1    5100 4800
	1    0    0    -1  
$EndComp
$Comp
L CONN_3 K1
U 1 1 5141F257
P 8050 4050
F 0 "K1" V 8000 4050 50  0000 C CNN
F 1 "CONN_3" V 8100 4050 40  0000 C CNN
	1    8050 4050
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 5141F23B
P 7250 4050
F 0 "R2" V 7330 4050 50  0000 C CNN
F 1 "33K" V 7250 4050 50  0000 C CNN
	1    7250 4050
	0    1    1    0   
$EndComp
$Comp
L GND #PWR3
U 1 1 5141F220
P 6300 3700
F 0 "#PWR3" H 6300 3700 30  0001 C CNN
F 1 "GND" H 6300 3630 30  0001 C CNN
	1    6300 3700
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 5141F20C
P 2300 4400
F 0 "#PWR1" H 2300 4400 30  0001 C CNN
F 1 "GND" H 2300 4330 30  0001 C CNN
	1    2300 4400
	1    0    0    -1  
$EndComp
$Comp
L BATTERY BT1
U 1 1 5141F1FC
P 2300 3900
F 0 "BT1" H 2300 4100 50  0000 C CNN
F 1 "Cr2032" H 2300 3710 50  0000 C CNN
	1    2300 3900
	0    1    1    0   
$EndComp
$EndSCHEMATC
