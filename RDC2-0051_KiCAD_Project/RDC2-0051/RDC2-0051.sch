EESchema Schematic File Version 4
LIBS:RDC2-0051-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 4950 700  2    60   Input ~ 0
VDD
Text GLabel 4950 1050 2    60   Input ~ 0
GND
Text GLabel 2550 2050 0    60   Input ~ 0
GND
Text GLabel 2550 1650 0    60   Input ~ 0
RST
$Comp
L Device:CP_Small C10
U 1 1 5DA47D76
P 4600 900
F 0 "C10" H 4610 970 50  0000 L CNN
F 1 "4.7u" H 4610 820 50  0000 L CNN
F 2 "NewComponents:TantalC_SizeA_EIA-3216_mm" H 4600 900 50  0001 C CNN
F 3 "" H 4600 900 50  0000 C CNN
	1    4600 900 
	1    0    0    -1  
$EndComp
Text GLabel 9050 1150 2    60   Input ~ 0
VDD
$Comp
L Device:R R5
U 1 1 5DA47D77
P 4450 2850
F 0 "R5" V 4500 2650 50  0000 C CNN
F 1 "22" V 4450 2850 50  0000 C CNN
F 2 "NewComponents:R_0603" V 4380 2850 50  0001 C CNN
F 3 "" H 4450 2850 50  0000 C CNN
	1    4450 2850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5DA47D78
P 4450 2750
F 0 "R4" V 4500 2550 50  0000 C CNN
F 1 "22" V 4450 2750 50  0000 C CNN
F 2 "NewComponents:R_0603" V 4380 2750 50  0001 C CNN
F 3 "" H 4450 2750 50  0000 C CNN
	1    4450 2750
	0    -1   -1   0   
$EndComp
$Comp
L RDC2-0051-rescue:USBLC6-NewComponents_KiCad VD1
U 1 1 5DA47D79
P 8200 2850
F 0 "VD1" H 8200 3050 60  0000 C CNN
F 1 "USBLC6" H 8200 2650 60  0000 C CNN
F 2 "NewComponents:SOT23-6L" H 8200 2850 60  0001 C CNN
F 3 "" H 8200 2850 60  0000 C CNN
	1    8200 2850
	-1   0    0    -1  
$EndComp
Text GLabel 4850 2750 2    60   Input ~ 0
USB_DM
Text GLabel 4850 2850 2    60   Input ~ 0
USB_DP
Text GLabel 7600 2750 0    60   Input ~ 0
USB_DM
Text GLabel 7600 2950 0    60   Input ~ 0
USB_DP
Text GLabel 7600 2850 0    60   Input ~ 0
5V
Text GLabel 8800 2850 2    60   Input ~ 0
GND
Text GLabel 7600 3350 0    60   Input ~ 0
GND
Text GLabel 9500 2650 0    60   Input ~ 0
5V
$Comp
L Device:C_Small C12
U 1 1 5DA47D7A
P 7700 3150
F 0 "C12" H 7710 3220 50  0000 L CNN
F 1 "0.1u" H 7710 3070 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7700 3150 50  0001 C CNN
F 3 "" H 7700 3150 50  0000 C CNN
	1    7700 3150
	1    0    0    -1  
$EndComp
Text GLabel 8300 2300 2    60   Input ~ 0
GND
Text GLabel 7900 1600 0    60   Input ~ 0
GND
Text GLabel 7400 2000 0    60   Input ~ 0
SPI1_MISO
Text GLabel 7400 1900 0    60   Input ~ 0
SPI1_MOSI
Text GLabel 7400 1800 0    60   Input ~ 0
SPI1_SCK
Wire Wire Line
	3550 700  3550 1350
Wire Wire Line
	3850 700  3850 800 
Connection ~ 3850 700 
Wire Wire Line
	3850 1000 3850 1050
Wire Wire Line
	2700 1650 2700 1750
Wire Wire Line
	2700 2050 2700 1950
Wire Wire Line
	2550 2050 2700 2050
Connection ~ 2700 1650
Wire Wire Line
	4600 800  4600 700 
Connection ~ 4600 700 
Wire Wire Line
	4600 1000 4600 1050
Connection ~ 4600 1050
Wire Wire Line
	4150 2750 4300 2750
Wire Wire Line
	4300 2850 4150 2850
Wire Wire Line
	4850 2750 4600 2750
Wire Wire Line
	4600 2850 4850 2850
Wire Wire Line
	8800 2850 8650 2850
Wire Wire Line
	7600 2850 7700 2850
Wire Wire Line
	7600 2750 7750 2750
Wire Wire Line
	7750 2950 7600 2950
Wire Wire Line
	7600 3350 7700 3350
Wire Wire Line
	7700 2850 7700 3050
Connection ~ 7700 2850
Wire Wire Line
	7700 3250 7700 3350
Wire Wire Line
	9050 1150 8900 1150
Wire Wire Line
	8200 1150 8200 1600
Wire Wire Line
	8300 2300 8200 2300
Wire Wire Line
	8200 2300 8200 2200
Wire Wire Line
	7800 1900 7400 1900
Wire Wire Line
	7400 2000 7800 2000
Wire Wire Line
	8000 1150 8000 1250
Connection ~ 8200 1150
Wire Wire Line
	8000 1450 8000 1600
Wire Wire Line
	8000 1600 7900 1600
Wire Wire Line
	8900 1400 8900 1150
Connection ~ 8900 1150
Wire Wire Line
	9050 2000 8900 2000
Wire Wire Line
	8900 1700 8900 2000
Connection ~ 8900 2000
Wire Wire Line
	8750 1900 8600 1900
Wire Wire Line
	8750 1150 8750 1800
Connection ~ 8750 1150
Wire Wire Line
	8600 1800 8750 1800
Connection ~ 8750 1800
Wire Wire Line
	4100 800  4100 700 
Connection ~ 4100 700 
Wire Wire Line
	4100 1000 4100 1050
Connection ~ 4100 1050
$Comp
L Switch:SW_Push SW1
U 1 1 5B781491
P 12200 2950
F 0 "SW1" H 12350 3060 50  0000 C CNN
F 1 "SW_PUSH" H 12200 2870 50  0001 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H13mm" H 12200 2950 50  0001 C CNN
F 3 "" H 12200 2950 50  0000 C CNN
	1    12200 2950
	1    0    0    -1  
$EndComp
Text GLabel 11800 2400 1    60   Input ~ 0
VDD
Text GLabel 12650 3350 2    60   Input ~ 0
GND
Wire Wire Line
	11800 2400 11800 2550
Wire Wire Line
	11800 2850 11800 2950
Connection ~ 11800 2950
Wire Wire Line
	12550 2950 12550 3350
Wire Wire Line
	11800 3350 12550 3350
Wire Wire Line
	11800 3250 11800 3350
Connection ~ 12550 3350
Wire Wire Line
	3850 700  4100 700 
Wire Wire Line
	3850 1050 4100 1050
Wire Wire Line
	2700 1650 3150 1650
Wire Wire Line
	4600 700  4950 700 
Wire Wire Line
	4600 1050 4950 1050
Wire Wire Line
	7700 2850 7750 2850
Wire Wire Line
	8200 1150 8000 1150
Wire Wire Line
	8900 1150 8750 1150
Wire Wire Line
	8900 2000 8600 2000
Wire Wire Line
	8750 1150 8200 1150
Wire Wire Line
	8750 1800 8750 1900
Wire Wire Line
	4100 700  4350 700 
Wire Wire Line
	4100 1050 4350 1050
Wire Wire Line
	11800 2950 11800 3050
Wire Wire Line
	12550 3350 12650 3350
Wire Wire Line
	12400 2950 12550 2950
Wire Wire Line
	11800 2950 12000 2950
Wire Wire Line
	2550 1650 2700 1650
Wire Wire Line
	3550 700  3850 700 
Wire Wire Line
	3650 1450 3650 1350
Wire Wire Line
	3650 1350 3550 1350
Connection ~ 3550 1350
Wire Wire Line
	3550 1350 3550 1450
$Comp
L Device:C_Small C4
U 1 1 5DA57CDF
P 2700 1850
F 0 "C4" H 2710 1920 50  0000 L CNN
F 1 "0.1u" H 2710 1770 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2700 1850 50  0001 C CNN
F 3 "" H 2700 1850 50  0000 C CNN
	1    2700 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5DA57DA9
P 3850 900
F 0 "C7" H 3860 970 50  0000 L CNN
F 1 "0.1u" H 3860 820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3850 900 50  0001 C CNN
F 3 "" H 3850 900 50  0000 C CNN
	1    3850 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5DA57E21
P 4100 900
F 0 "C8" H 4110 970 50  0000 L CNN
F 1 "0.1u" H 4110 820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4100 900 50  0001 C CNN
F 3 "" H 4100 900 50  0000 C CNN
	1    4100 900 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5DA47D86
P 8000 1350
F 0 "C13" H 8010 1420 50  0000 L CNN
F 1 "0.1u" H 8010 1270 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 8000 1350 50  0001 C CNN
F 3 "" H 8000 1350 50  0000 C CNN
	1    8000 1350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5DA62915
P 8900 1550
F 0 "R6" V 8980 1550 50  0000 C CNN
F 1 "10k" V 8900 1550 50  0000 C CNN
F 2 "NewComponents:R_0603" V 8830 1550 50  0001 C CNN
F 3 "" H 8900 1550 50  0000 C CNN
	1    8900 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 5DA47D89
P 11800 3150
F 0 "C14" H 11810 3220 50  0000 L CNN
F 1 "0.1u" H 11810 3070 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 11800 3150 50  0001 C CNN
F 3 "" H 11800 3150 50  0000 C CNN
	1    11800 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5DA47D8A
P 11800 2700
F 0 "R9" V 11880 2700 50  0000 C CNN
F 1 "10k" V 11800 2700 50  0000 C CNN
F 2 "NewComponents:R_0603" V 11730 2700 50  0001 C CNN
F 3 "" H 11800 2700 50  0000 C CNN
	1    11800 2700
	-1   0    0    -1  
$EndComp
Text GLabel 11600 2950 0    60   Input ~ 0
KEY_1
Wire Wire Line
	11600 2950 11800 2950
$Comp
L Switch:SW_Push SW2
U 1 1 5DACA0C8
P 12200 4300
F 0 "SW2" H 12350 4410 50  0000 C CNN
F 1 "SW_PUSH" H 12200 4220 50  0001 C CNN
F 2 "Button_Switch_THT:SW_PUSH_6mm_H13mm" H 12200 4300 50  0001 C CNN
F 3 "" H 12200 4300 50  0000 C CNN
	1    12200 4300
	1    0    0    -1  
$EndComp
Text GLabel 11800 3750 1    60   Input ~ 0
VDD
Text GLabel 12650 4700 2    60   Input ~ 0
GND
Wire Wire Line
	11800 3750 11800 3900
Wire Wire Line
	11800 4200 11800 4300
Connection ~ 11800 4300
Wire Wire Line
	12550 4300 12550 4700
Wire Wire Line
	11800 4700 12550 4700
Wire Wire Line
	11800 4600 11800 4700
Connection ~ 12550 4700
Wire Wire Line
	11800 4300 11800 4400
Wire Wire Line
	12550 4700 12650 4700
Wire Wire Line
	12400 4300 12550 4300
Wire Wire Line
	11800 4300 12000 4300
$Comp
L Device:C_Small C15
U 1 1 5DACA0DC
P 11800 4500
F 0 "C15" H 11810 4570 50  0000 L CNN
F 1 "0.1u" H 11810 4420 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 11800 4500 50  0001 C CNN
F 3 "" H 11800 4500 50  0000 C CNN
	1    11800 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 5DACA0E3
P 11800 4050
F 0 "R10" V 11880 4050 50  0000 C CNN
F 1 "10k" V 11800 4050 50  0000 C CNN
F 2 "NewComponents:R_0603" V 11730 4050 50  0001 C CNN
F 3 "" H 11800 4050 50  0000 C CNN
	1    11800 4050
	-1   0    0    -1  
$EndComp
Text GLabel 11600 4300 0    60   Input ~ 0
KEY_2
Wire Wire Line
	11600 4300 11800 4300
$Comp
L Regulator_Linear:LM1117-3.3 DA1
U 1 1 5DA47D8B
P 1850 700
F 0 "DA1" H 1850 852 50  0000 C CNN
F 1 "LM1117-3.3" H 1850 852 50  0001 C CNN
F 2 "TO_SOT_Packages_SMD:SOT-223" H 1850 700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm1117.pdf" H 1850 700 50  0001 C CNN
	1    1850 700 
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C1
U 1 1 5DA47D8C
P 1300 1000
F 0 "C1" H 1310 1070 50  0000 L CNN
F 1 "2.2u" H 1310 920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1300 1000 50  0001 C CNN
F 3 "" H 1300 1000 50  0000 C CNN
	1    1300 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 5DB01DEE
P 2400 1000
F 0 "C2" H 2410 1070 50  0000 L CNN
F 1 "2.2u" H 2410 920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2400 1000 50  0001 C CNN
F 3 "" H 2400 1000 50  0000 C CNN
	1    2400 1000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5DB01E5A
P 2700 1000
F 0 "C3" H 2710 1070 50  0000 L CNN
F 1 "2.2u" H 2710 920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2700 1000 50  0001 C CNN
F 3 "" H 2700 1000 50  0000 C CNN
	1    2700 1000
	1    0    0    -1  
$EndComp
Text GLabel 2900 700  2    60   Input ~ 0
VDD
Text GLabel 1050 1200 0    60   Input ~ 0
GND
Wire Wire Line
	2150 700  2400 700 
Wire Wire Line
	2700 1100 2700 1200
Wire Wire Line
	2700 1200 2400 1200
Wire Wire Line
	2700 900  2700 700 
Connection ~ 2700 700 
Wire Wire Line
	2700 700  2900 700 
Wire Wire Line
	2400 900  2400 700 
Connection ~ 2400 700 
Wire Wire Line
	2400 700  2700 700 
Wire Wire Line
	2400 1100 2400 1200
Connection ~ 2400 1200
Wire Wire Line
	2400 1200 1850 1200
Wire Wire Line
	1850 1000 1850 1200
Connection ~ 1850 1200
Wire Wire Line
	1850 1200 1300 1200
Wire Wire Line
	1300 1100 1300 1200
Connection ~ 1300 1200
Wire Wire Line
	1300 1200 1050 1200
Wire Wire Line
	1300 900  1300 700 
Wire Wire Line
	1300 700  1550 700 
Text GLabel 1050 700  0    60   Input ~ 0
5V
Wire Wire Line
	1300 700  1050 700 
Connection ~ 1300 700 
$Comp
L Connector_Generic:Conn_01x04 XP4
U 1 1 5DB3B2E3
P 7125 4450
F 0 "XP4" H 7075 4700 50  0001 L CNN
F 1 "Conn_01x04" H 7205 4350 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x04_mm" H 7125 4450 50  0001 C CNN
F 3 "~" H 7125 4450 50  0001 C CNN
	1    7125 4450
	1    0    0    -1  
$EndComp
Text GLabel 6275 5250 0    60   Input ~ 0
SPI1_SCK
Text GLabel 6275 5150 0    60   Input ~ 0
SPI1_MOSI
Text GLabel 6275 5350 0    60   Input ~ 0
SPI1_MISO
Text GLabel 6275 5450 0    60   Input ~ 0
SPI1_NSS1
Text GLabel 6275 4650 0    60   Input ~ 0
GND
Text GLabel 6275 4550 0    60   Input ~ 0
VDD
Text GLabel 6275 4450 0    60   Input ~ 0
GND
Text GLabel 6275 4350 0    60   Input ~ 0
5V
$Comp
L Device:R R12
U 1 1 5DB53F85
P 6575 5650
F 0 "R12" V 6655 5650 50  0000 C CNN
F 1 "10k" V 6575 5650 50  0000 C CNN
F 2 "NewComponents:R_0603" V 6505 5650 50  0001 C CNN
F 3 "" H 6575 5650 50  0000 C CNN
	1    6575 5650
	0    -1   -1   0   
$EndComp
Text GLabel 6275 5650 0    60   Input ~ 0
VDD
Wire Wire Line
	6925 4350 6275 4350
Wire Wire Line
	6275 4450 6925 4450
Wire Wire Line
	6925 4550 6275 4550
Wire Wire Line
	6275 4650 6925 4650
Wire Wire Line
	6925 5150 6275 5150
Wire Wire Line
	6275 5250 6825 5250
Wire Wire Line
	6925 5350 6275 5350
Wire Wire Line
	6275 5450 6825 5450
Wire Wire Line
	6425 5650 6375 5650
Wire Wire Line
	6725 5650 6825 5650
Wire Wire Line
	6825 5650 6825 5450
Connection ~ 6825 5450
Wire Wire Line
	6825 5450 6925 5450
Text GLabel 2550 3050 0    60   Input ~ 0
I2C1_SDA
Text GLabel 2550 2950 0    60   Input ~ 0
I2C1_SCL
Text GLabel 8875 4225 0    60   Input ~ 0
I2C1_SDA
Text GLabel 8875 4325 0    60   Input ~ 0
I2C1_SCL
$Comp
L Connector_Generic:Conn_01x04 XP6
U 1 1 5DBA8434
P 9725 4225
F 0 "XP6" H 9675 4475 50  0001 L CNN
F 1 "Conn_01x04" H 9805 4125 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x04_mm" H 9725 4225 50  0001 C CNN
F 3 "~" H 9725 4225 50  0001 C CNN
	1    9725 4225
	1    0    0    -1  
$EndComp
Text GLabel 8875 4125 0    60   Input ~ 0
GND
Text GLabel 8875 4425 0    60   Input ~ 0
VDD
Wire Wire Line
	8875 4125 9525 4125
Wire Wire Line
	9525 4225 9425 4225
Wire Wire Line
	8875 4325 9225 4325
Wire Wire Line
	9525 4425 9025 4425
$Comp
L Device:R R13
U 1 1 5DBC6059
P 9225 4675
F 0 "R13" V 9125 4675 50  0000 C CNN
F 1 "4k7" V 9225 4675 50  0000 C CNN
F 2 "NewComponents:R_0603" V 9155 4675 50  0001 C CNN
F 3 "" H 9225 4675 50  0000 C CNN
	1    9225 4675
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5DA47D94
P 9425 4675
F 0 "R14" V 9325 4675 50  0000 C CNN
F 1 "4k7" V 9425 4675 50  0000 C CNN
F 2 "NewComponents:R_0603" V 9355 4675 50  0001 C CNN
F 3 "" H 9425 4675 50  0000 C CNN
	1    9425 4675
	1    0    0    -1  
$EndComp
Wire Wire Line
	9225 4525 9225 4325
Connection ~ 9225 4325
Wire Wire Line
	9225 4325 9525 4325
Wire Wire Line
	9425 4525 9425 4225
Connection ~ 9425 4225
Wire Wire Line
	9425 4225 8875 4225
Wire Wire Line
	9025 4425 9025 4925
Wire Wire Line
	9025 4925 9225 4925
Wire Wire Line
	9425 4925 9425 4825
Connection ~ 9025 4425
Wire Wire Line
	9025 4425 8875 4425
Wire Wire Line
	9225 4825 9225 4925
Connection ~ 9225 4925
Wire Wire Line
	9225 4925 9425 4925
Wire Wire Line
	9950 3250 9950 3350
$Comp
L Device:R_POT_TRIM R7
U 1 1 5DCBF41E
P 11800 1150
F 0 "R7" V 11700 1200 50  0000 R CNN
F 1 "R_POT_TRIM" H 11730 1104 50  0001 R CNN
F 2 "NewComponents:R0904N" H 11800 1150 50  0001 C CNN
F 3 "~" H 11800 1150 50  0001 C CNN
	1    11800 1150
	0    -1   1    0   
$EndComp
$Comp
L Memory_EEPROM:25LCxxx DD3
U 1 1 5DA47D7C
P 8200 1900
F 0 "DD3" H 8100 2150 50  0000 C CNN
F 1 "25LCxxx" H 8200 2289 50  0001 C CNN
F 2 "NewComponents:SOIC-8_combo_Pitch1.27mm" H 8200 1900 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21832H.pdf" H 8200 1900 50  0001 C CNN
	1    8200 1900
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM R8
U 1 1 5D96372A
P 11800 1600
F 0 "R8" V 11700 1650 50  0000 R CNN
F 1 "R_POT_TRIM" H 11730 1554 50  0001 R CNN
F 2 "NewComponents:R0904N" H 11800 1600 50  0001 C CNN
F 3 "~" H 11800 1600 50  0001 C CNN
	1    11800 1600
	0    -1   1    0   
$EndComp
Text GLabel 12300 1600 2    60   Input ~ 0
GND
Text GLabel 11450 1150 0    60   Input ~ 0
VDD
Text GLabel 11450 1400 0    60   Input ~ 0
AIN1
Text GLabel 11450 1850 0    60   Input ~ 0
AIN2
Wire Wire Line
	11450 1400 11800 1400
Wire Wire Line
	11800 1400 11800 1300
Wire Wire Line
	11450 1850 11800 1850
Wire Wire Line
	11800 1850 11800 1750
Wire Wire Line
	11450 1150 11550 1150
Wire Wire Line
	11950 1150 12200 1150
Wire Wire Line
	11950 1600 12200 1600
Connection ~ 12200 1600
Connection ~ 11550 1150
Wire Wire Line
	11550 1150 11650 1150
Wire Wire Line
	11650 1600 11550 1600
Wire Wire Line
	11550 1600 11550 1150
$Comp
L Connector_Generic:Conn_01x02 XP3
U 1 1 5D9BB44B
P 7125 4000
F 0 "XP3" H 7075 4100 50  0001 L CNN
F 1 "Conn_01x02" H 7205 3900 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x02_mm" H 7125 4000 50  0001 C CNN
F 3 "~" H 7125 4000 50  0001 C CNN
	1    7125 4000
	1    0    0    -1  
$EndComp
Text GLabel 6725 4100 0    60   Input ~ 0
GND
Text GLabel 6725 4000 0    60   Input ~ 0
5V
Wire Wire Line
	6725 4000 6925 4000
Wire Wire Line
	6725 4100 6925 4100
Wire Wire Line
	10050 3250 10050 3350
Wire Wire Line
	8650 2750 9200 2750
Wire Wire Line
	7700 3350 9950 3350
Connection ~ 7700 3350
Wire Wire Line
	9950 3350 10050 3350
Connection ~ 9950 3350
Wire Wire Line
	9650 2650 9500 2650
Wire Wire Line
	9200 3050 9550 3050
Wire Wire Line
	9550 3050 9550 2950
Wire Wire Line
	9550 2950 9650 2950
Wire Wire Line
	9200 2750 9200 3050
Wire Wire Line
	9650 2850 9450 2850
Wire Wire Line
	9450 2850 9450 2950
Wire Wire Line
	9450 2950 8650 2950
$Comp
L Connector:USB_B_Micro XS1
U 1 1 5D96A1F1
P 9950 2850
F 0 "XS1" H 9720 2795 50  0001 R CNN
F 1 "USB_B_Micro" H 9721 2750 50  0001 R CNN
F 2 "NewComponents:USB_micro_Molex_47346-0001" H 10100 2800 50  0001 C CNN
F 3 "~" H 10100 2800 50  0001 C CNN
	1    9950 2850
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DA03ABE
P 1150 2150
F 0 "R1" V 1230 2150 50  0000 C CNN
F 1 "10k" V 1150 2150 50  0000 C CNN
F 2 "NewComponents:R_0603" V 1080 2150 50  0001 C CNN
F 3 "" H 1150 2150 50  0000 C CNN
	1    1150 2150
	0    1    -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5DA03C96
P 1150 2350
F 0 "R2" V 1230 2350 50  0000 C CNN
F 1 "10k" V 1150 2350 50  0000 C CNN
F 2 "NewComponents:R_0603" V 1080 2350 50  0001 C CNN
F 3 "" H 1150 2350 50  0000 C CNN
	1    1150 2350
	0    1    -1   0   
$EndComp
Text GLabel 850  2350 0    60   Input ~ 0
GND
Text GLabel 850  2150 0    60   Input ~ 0
VDD
Wire Wire Line
	850  2150 1000 2150
Wire Wire Line
	850  2350 1000 2350
Wire Wire Line
	1300 2150 1350 2150
Wire Wire Line
	1350 2150 1350 2250
Wire Wire Line
	1350 2350 1300 2350
Wire Wire Line
	1450 2250 1350 2250
Connection ~ 1350 2250
Wire Wire Line
	1350 2250 1350 2350
$Comp
L MCU_ST_STM32F0:STM32F042K6Tx DD2
U 1 1 5DA2476D
P 3650 2350
F 0 "DD2" H 3900 3300 50  0000 C CNN
F 1 "STM32F042K6Tx" H 4000 1350 50  0000 C CNN
F 2 "NewComponents:LQFP-32_7x7mm_Pitch0.8mm" H 3250 1450 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00105814.pdf" H 3650 2350 50  0001 C CNN
	1    3650 2350
	1    0    0    -1  
$EndComp
Text GLabel 3800 3600 2    60   Input ~ 0
GND
$Comp
L Device:R R3
U 1 1 57739B63
P 3250 3600
F 0 "R3" V 3330 3600 50  0000 C CNN
F 1 "10k" V 3250 3600 50  0000 C CNN
F 2 "NewComponents:R_0603" V 3180 3600 50  0001 C CNN
F 3 "" H 3250 3600 50  0000 C CNN
	1    3250 3600
	0    -1   -1   0   
$EndComp
Text GLabel 3800 3700 2    60   Input ~ 0
VDD
Wire Wire Line
	2950 3150 2950 3600
Wire Wire Line
	2950 3600 3100 3600
Wire Wire Line
	3550 3350 3550 3450
Connection ~ 3550 3600
Wire Wire Line
	3550 3600 3800 3600
Wire Wire Line
	3400 3600 3550 3600
Wire Wire Line
	2950 3600 2800 3600
Connection ~ 2950 3600
$Comp
L Connector_Generic:Conn_01x02 XP1
U 1 1 5D952A29
P 2600 3600
F 0 "XP1" H 2550 3700 50  0001 L CNN
F 1 "Conn_01x02" H 2680 3500 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x02_mm" H 2600 3600 50  0001 C CNN
F 3 "~" H 2600 3600 50  0001 C CNN
	1    2600 3600
	-1   0    0    -1  
$EndComp
Text GLabel 2550 3150 0    60   Input ~ 0
Pixel
Text GLabel 2550 2450 0    50   Input ~ 0
GPIO4
Text GLabel 2550 2550 0    50   Input ~ 0
GPIO5
Wire Wire Line
	3800 3700 2800 3700
$Comp
L RDC2-0051-rescue:74AHC1G125-74xGxx DD1
U 1 1 5BD9BA98
P 1500 4650
F 0 "DD1" H 1600 4800 50  0000 C CNN
F 1 "74AHC1G125" H 1475 4385 50  0001 C CNN
F 2 "NewComponents:SOT-23-5_mm" H 1500 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/sg/scyt129e/scyt129e.pdf" H 1500 4650 50  0001 C CNN
	1    1500 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 4650 1900 4650
Wire Wire Line
	1100 4650 1200 4650
Text GLabel 1550 4400 2    50   Input ~ 0
GND
Wire Wire Line
	1500 4450 1500 4400
Wire Wire Line
	1500 4400 1550 4400
$Comp
L Connector_Generic:Conn_01x03 XP2
U 1 1 5BDB94B3
P 5000 4750
F 0 "XP2" H 4950 4950 50  0001 L CNN
F 1 "Conn_01x03" H 5080 4701 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 5000 4750 50  0001 C CNN
F 3 "~" H 5000 4750 50  0001 C CNN
	1    5000 4750
	1    0    0    -1  
$EndComp
Text GLabel 4600 4850 0    50   Input ~ 0
GND
Wire Wire Line
	4600 4750 4700 4750
Wire Wire Line
	4800 4850 4600 4850
Text GLabel 1100 4650 0    60   Input ~ 0
Pixel
Text Notes 1650 4850 2    50   ~ 0
VDD=5V
Text GLabel 4600 4750 0    60   Input ~ 0
5V
Text GLabel 4600 4550 0    50   Input ~ 0
LED_OUT
$Comp
L LED:SK6805 HL1
U 1 1 5DCFAE0B
P 2200 4650
F 0 "HL1" H 2150 4900 50  0000 R CNN
F 1 "SK6805" H 2150 4400 50  0000 R CNN
F 2 "LED_SMD:LED_SK6805_PLCC4_2.4x2.7mm_P1.3mm" H 2250 4350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/3484/3484_Datasheet.pdf" H 2300 4275 50  0001 L TNN
	1    2200 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5DD17582
P 2700 4450
F 0 "C5" H 2710 4520 50  0000 L CNN
F 1 "0.1u" H 2710 4370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2700 4450 50  0001 C CNN
F 3 "" H 2700 4450 50  0000 C CNN
	1    2700 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2200 4300 2200 4350
Wire Wire Line
	2200 4950 2200 5000
Wire Wire Line
	2200 5000 2700 5000
Wire Wire Line
	2700 4350 2700 4300
Wire Wire Line
	2700 4300 2200 4300
Wire Wire Line
	2700 4550 2700 5000
Wire Wire Line
	4800 4650 4700 4650
Wire Wire Line
	4600 4550 4700 4550
Wire Wire Line
	4700 4550 4700 4650
Wire Wire Line
	2550 3150 2950 3150
Connection ~ 2950 3150
Wire Wire Line
	2950 3150 3150 3150
Wire Wire Line
	3650 3350 3650 3450
Wire Wire Line
	3650 3450 3550 3450
Connection ~ 3550 3450
Wire Wire Line
	3550 3450 3550 3600
Wire Wire Line
	3750 1450 3750 1350
Wire Wire Line
	3750 1350 3650 1350
Connection ~ 3650 1350
Wire Wire Line
	3150 2950 2550 2950
Wire Wire Line
	2550 3050 3150 3050
Text GLabel 2550 2650 0    60   Input ~ 0
SPI1_SCK
Text GLabel 2550 2850 0    60   Input ~ 0
SPI1_MOSI
Text GLabel 2550 2750 0    60   Input ~ 0
SPI1_MISO
Text GLabel 4850 3150 2    60   Input ~ 0
SPI1_NSS1
Wire Wire Line
	4850 3150 4150 3150
Wire Wire Line
	2550 2850 3150 2850
Wire Wire Line
	3150 2750 2550 2750
Wire Wire Line
	2550 2650 3150 2650
Text GLabel 4850 3050 2    60   Input ~ 0
GPIO9\SWCLK
Text GLabel 4850 2950 2    60   Input ~ 0
GPIO8\SWDIO
Wire Wire Line
	4850 3050 4150 3050
Wire Wire Line
	4150 2950 4850 2950
Text GLabel 4850 2650 2    60   Input ~ 0
GPIO7\I2C_SDA
Text GLabel 4850 2550 2    60   Input ~ 0
GPIO6\I2C_SCL
Wire Wire Line
	4150 2650 4850 2650
Wire Wire Line
	4850 2550 4150 2550
Text GLabel 4850 2050 2    60   Input ~ 0
GPIO0\SPI_CS
Wire Wire Line
	4850 2450 4150 2450
Text GLabel 4850 1650 2    60   Input ~ 0
AIN1
Text GLabel 4850 1750 2    60   Input ~ 0
AIN2
Text GLabel 4850 1850 2    60   Input ~ 0
KEY_1
Text GLabel 4850 1950 2    60   Input ~ 0
KEY_2
Text GLabel 4850 2450 2    60   Input ~ 0
SPI1_NSS2
Text GLabel 4850 2150 2    60   Input ~ 0
GPIO1\SPI_SCK
Text GLabel 4850 2250 2    60   Input ~ 0
GPIO2\SPI_MISO
Text GLabel 4850 2350 2    60   Input ~ 0
GPIO3\SPI_MOSI
Wire Wire Line
	4150 1650 4850 1650
Wire Wire Line
	4850 1750 4150 1750
Wire Wire Line
	4150 1850 4850 1850
Wire Wire Line
	4850 1950 4150 1950
Wire Wire Line
	4150 2050 4850 2050
Wire Wire Line
	4850 2150 4150 2150
Wire Wire Line
	4150 2250 4850 2250
Wire Wire Line
	4850 2350 4150 2350
Text GLabel 2550 2250 0    60   Input ~ 0
DSP_RST
Text GLabel 2550 2150 0    60   Input ~ 0
DSP_MUTE
Wire Wire Line
	3150 2150 2550 2150
Wire Wire Line
	2550 2250 3150 2250
$Comp
L LED:SK6805 HL2
U 1 1 5E7C89C3
P 3200 4650
F 0 "HL2" H 3150 4900 50  0000 R CNN
F 1 "SK6805" H 3150 4400 50  0000 R CNN
F 2 "LED_SMD:LED_SK6805_PLCC4_2.4x2.7mm_P1.3mm" H 3250 4350 50  0001 L TNN
F 3 "https://cdn-shop.adafruit.com/product-files/3484/3484_Datasheet.pdf" H 3300 4275 50  0001 L TNN
	1    3200 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5E7C89CA
P 3700 4450
F 0 "C6" H 3710 4520 50  0000 L CNN
F 1 "0.1u" H 3710 4370 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3700 4450 50  0001 C CNN
F 3 "" H 3700 4450 50  0000 C CNN
	1    3700 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3200 4300 3200 4350
Wire Wire Line
	3200 4950 3200 5000
Wire Wire Line
	3200 5000 3700 5000
Wire Wire Line
	3700 4350 3700 4300
Wire Wire Line
	3700 4300 3200 4300
Wire Wire Line
	3700 4550 3700 5000
Text GLabel 4000 5000 2    50   Input ~ 0
GND
Text GLabel 4000 4300 2    60   Input ~ 0
5V
Wire Wire Line
	2900 4650 2500 4650
Wire Wire Line
	2700 4300 3200 4300
Connection ~ 2700 4300
Connection ~ 3200 4300
Wire Wire Line
	3200 5000 2700 5000
Connection ~ 3200 5000
Connection ~ 2700 5000
Connection ~ 3700 4300
Connection ~ 3700 5000
$Comp
L Device:C_Small C9
U 1 1 5EC5DA45
P 4350 900
F 0 "C9" H 4360 970 50  0000 L CNN
F 1 "0.1u" H 4360 820 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4350 900 50  0001 C CNN
F 3 "" H 4350 900 50  0000 C CNN
	1    4350 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1000 4350 1050
Connection ~ 4350 1050
Wire Wire Line
	4350 1050 4600 1050
Wire Wire Line
	4350 800  4350 700 
Connection ~ 4350 700 
Wire Wire Line
	4350 700  4600 700 
$Comp
L Device:R R11
U 1 1 5EE33494
P 6575 5000
F 0 "R11" V 6655 5000 50  0000 C CNN
F 1 "10k" V 6575 5000 50  0000 C CNN
F 2 "NewComponents:R_0603" V 6505 5000 50  0001 C CNN
F 3 "" H 6575 5000 50  0000 C CNN
	1    6575 5000
	0    -1   -1   0   
$EndComp
Text GLabel 6275 5000 0    60   Input ~ 0
GND
Wire Wire Line
	6725 5000 6825 5000
Wire Wire Line
	6825 5000 6825 5250
Connection ~ 6825 5250
Wire Wire Line
	6825 5250 6925 5250
Wire Wire Line
	6425 5000 6375 5000
Text GLabel 1450 2250 2    60   Input ~ 0
DSP_MUTE
Text GLabel 9325 5175 0    60   Input ~ 0
DSP_MUTE
Text GLabel 9325 5375 0    60   Input ~ 0
DSP_RST
$Comp
L Connector_Generic:Conn_01x04 XP7
U 1 1 5EEA0BE4
P 9725 5275
F 0 "XP7" H 9675 5525 50  0001 L CNN
F 1 "Conn_01x04" H 9805 5175 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x04_mm" H 9725 5275 50  0001 C CNN
F 3 "~" H 9725 5275 50  0001 C CNN
	1    9725 5275
	1    0    0    -1  
$EndComp
Text GLabel 9325 5275 0    60   Input ~ 0
GND
Text GLabel 9325 5475 0    60   Input ~ 0
GND
Wire Wire Line
	9325 5175 9525 5175
Wire Wire Line
	9525 5275 9325 5275
Wire Wire Line
	9325 5375 9425 5375
Wire Wire Line
	9525 5475 9325 5475
Wire Wire Line
	7400 1800 7800 1800
Text GLabel 14200 1100 0    60   Input ~ 0
GND
Text GLabel 14200 1000 0    60   Input ~ 0
VDD
Text GLabel 14200 900  0    60   Input ~ 0
GND
Text GLabel 14200 800  0    60   Input ~ 0
5V
Wire Wire Line
	14200 1100 14300 1100
Wire Wire Line
	14200 900  14300 900 
$Comp
L Connector_Generic:Conn_01x04 XP8
U 1 1 5F401135
P 14500 900
F 0 "XP8" H 14450 1150 50  0001 L CNN
F 1 "Conn_01x04" H 14580 800 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x04_mm" H 14500 900 50  0001 C CNN
F 3 "~" H 14500 900 50  0001 C CNN
	1    14500 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	14300 800  14200 800 
Wire Wire Line
	14300 1000 14200 1000
$Comp
L Device:C_Small C11
U 1 1 5DA1FC4A
P 4700 5000
F 0 "C11" H 4710 5070 50  0000 L CNN
F 1 "2.2u" H 4710 4920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4700 5000 50  0001 C CNN
F 3 "" H 4700 5000 50  0000 C CNN
	1    4700 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 4900 4700 4750
Connection ~ 4700 4750
Wire Wire Line
	4700 4750 4800 4750
Text GLabel 4750 5200 2    50   Input ~ 0
GND
Wire Wire Line
	4700 5100 4700 5200
Wire Wire Line
	4700 5200 4750 5200
Wire Wire Line
	12200 1150 12200 1600
Wire Wire Line
	12200 1600 12300 1600
Text GLabel 9050 2000 2    60   Input ~ 0
SPI1_NSS2
Wire Wire Line
	2550 2550 3150 2550
Wire Wire Line
	2550 2450 3150 2450
Text GLabel 14900 1600 1    60   Input ~ 0
VDD
$Comp
L Connector_Generic:Conn_01x03 XP11
U 1 1 5F42B9C4
P 15200 1850
F 0 "XP11" H 15150 2050 50  0001 L CNN
F 1 "Conn_01x03" H 15280 1801 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 1850 50  0001 C CNN
F 3 "~" H 15200 1850 50  0001 C CNN
	1    15200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 1600 14900 1750
Wire Wire Line
	14900 1750 15000 1750
Wire Wire Line
	15000 1950 14800 1950
$Comp
L Connector_Generic:Conn_01x03 XP12
U 1 1 5F42B9E8
P 15200 2250
F 0 "XP12" H 15150 2450 50  0001 L CNN
F 1 "Conn_01x03" H 15280 2201 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 2250 50  0001 C CNN
F 3 "~" H 15200 2250 50  0001 C CNN
	1    15200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 2150 15000 2150
Wire Wire Line
	15000 2350 14800 2350
Connection ~ 14800 2350
Wire Wire Line
	14900 1750 14900 2150
Connection ~ 14900 1750
$Comp
L Connector_Generic:Conn_01x03 XP13
U 1 1 5F42BA14
P 15200 2650
F 0 "XP13" H 15150 2850 50  0001 L CNN
F 1 "Conn_01x03" H 15280 2601 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 2650 50  0001 C CNN
F 3 "~" H 15200 2650 50  0001 C CNN
	1    15200 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 2550 15000 2550
Wire Wire Line
	15000 2750 14800 2750
$Comp
L Connector_Generic:Conn_01x03 XP14
U 1 1 5F42BA37
P 15200 3050
F 0 "XP14" H 15150 3250 50  0001 L CNN
F 1 "Conn_01x03" H 15280 3001 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 3050 50  0001 C CNN
F 3 "~" H 15200 3050 50  0001 C CNN
	1    15200 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 2950 15000 2950
Wire Wire Line
	15000 3150 14800 3150
Connection ~ 14800 3150
Wire Wire Line
	14900 2550 14900 2950
Connection ~ 14900 2550
Wire Wire Line
	14900 2150 14900 2550
Connection ~ 14900 2150
Connection ~ 14800 2750
Text GLabel 14700 1850 0    60   Input ~ 0
GPIO0\SPI_CS
Text GLabel 14700 2250 0    60   Input ~ 0
GPIO1\SPI_SCK
Text GLabel 14700 2650 0    60   Input ~ 0
GPIO2\SPI_MISO
Text GLabel 14700 3050 0    60   Input ~ 0
GPIO3\SPI_MOSI
Text GLabel 14700 4250 0    60   Input ~ 0
GPIO6\I2C_SCL
Text GLabel 14700 4650 0    60   Input ~ 0
GPIO7\I2C_SDA
Text GLabel 14700 5050 0    60   Input ~ 0
GPIO8\SWDIO
Text GLabel 14700 5450 0    60   Input ~ 0
GPIO9\SWCLK
Text GLabel 14700 3450 0    50   Input ~ 0
GPIO4
Text GLabel 14700 3850 0    50   Input ~ 0
GPIO5
$Comp
L Connector_Generic:Conn_01x03 XP15
U 1 1 5DD2C25D
P 15200 3450
F 0 "XP15" H 15150 3650 50  0001 L CNN
F 1 "Conn_01x03" H 15280 3401 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 3450 50  0001 C CNN
F 3 "~" H 15200 3450 50  0001 C CNN
	1    15200 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 3350 15000 3350
Wire Wire Line
	15000 3550 14800 3550
$Comp
L Connector_Generic:Conn_01x03 XP16
U 1 1 5DD2C27A
P 15200 3850
F 0 "XP16" H 15150 4050 50  0001 L CNN
F 1 "Conn_01x03" H 15280 3801 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 3850 50  0001 C CNN
F 3 "~" H 15200 3850 50  0001 C CNN
	1    15200 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 3750 15000 3750
Wire Wire Line
	15000 3950 14800 3950
Connection ~ 14800 3950
Wire Wire Line
	14900 3350 14900 3750
Connection ~ 14900 3350
$Comp
L Connector_Generic:Conn_01x03 XP17
U 1 1 5DD2C29D
P 15200 4250
F 0 "XP17" H 15150 4450 50  0001 L CNN
F 1 "Conn_01x03" H 15280 4201 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 4250 50  0001 C CNN
F 3 "~" H 15200 4250 50  0001 C CNN
	1    15200 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 4150 15000 4150
Wire Wire Line
	15000 4350 14800 4350
$Comp
L Connector_Generic:Conn_01x03 XP18
U 1 1 5DD2C2B9
P 15200 4650
F 0 "XP18" H 15150 4850 50  0001 L CNN
F 1 "Conn_01x03" H 15280 4601 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 4650 50  0001 C CNN
F 3 "~" H 15200 4650 50  0001 C CNN
	1    15200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 4550 15000 4550
Wire Wire Line
	15000 4750 14800 4750
Wire Wire Line
	14900 4150 14900 4550
Connection ~ 14900 4150
Wire Wire Line
	14900 3750 14900 4150
Connection ~ 14900 3750
Connection ~ 14800 4350
Wire Wire Line
	14900 2950 14900 3350
Connection ~ 14900 2950
Connection ~ 14800 3550
Wire Wire Line
	14800 1950 14800 2350
Wire Wire Line
	14800 2350 14800 2750
Wire Wire Line
	14800 2750 14800 3150
Wire Wire Line
	14800 3150 14800 3550
Wire Wire Line
	14800 3550 14800 3950
Wire Wire Line
	14800 3950 14800 4350
Wire Wire Line
	14800 4350 14800 4750
$Comp
L Connector_Generic:Conn_01x03 XP19
U 1 1 5E011C73
P 15200 5050
F 0 "XP19" H 15150 5250 50  0001 L CNN
F 1 "Conn_01x03" H 15280 5001 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 5050 50  0001 C CNN
F 3 "~" H 15200 5050 50  0001 C CNN
	1    15200 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 4950 15000 4950
Wire Wire Line
	15000 5150 14800 5150
$Comp
L Connector_Generic:Conn_01x03 XP20
U 1 1 5E011C7B
P 15200 5450
F 0 "XP20" H 15150 5650 50  0001 L CNN
F 1 "Conn_01x03" H 15280 5401 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 15200 5450 50  0001 C CNN
F 3 "~" H 15200 5450 50  0001 C CNN
	1    15200 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	14900 5350 15000 5350
Wire Wire Line
	15000 5550 14800 5550
Connection ~ 14800 5550
Wire Wire Line
	14800 5750 14800 5550
Wire Wire Line
	14900 4950 14900 5350
Wire Wire Line
	14800 5150 14800 5550
Wire Wire Line
	14800 5150 14800 4750
Connection ~ 14800 5150
Connection ~ 14800 4750
Wire Wire Line
	14900 4950 14900 4550
Connection ~ 14900 4950
Connection ~ 14900 4550
Text GLabel 14800 5750 3    60   Input ~ 0
GND
Wire Wire Line
	14700 1850 15000 1850
Wire Wire Line
	15000 2250 14700 2250
Wire Wire Line
	14700 2650 15000 2650
Wire Wire Line
	15000 3050 14700 3050
Wire Wire Line
	14700 3450 15000 3450
Wire Wire Line
	15000 3850 14700 3850
Wire Wire Line
	14700 4250 15000 4250
Wire Wire Line
	15000 4650 14700 4650
Wire Wire Line
	14700 5050 15000 5050
Wire Wire Line
	15000 5450 14700 5450
Wire Wire Line
	3700 4300 4000 4300
Wire Wire Line
	3700 5000 4000 5000
Wire Wire Line
	3500 4650 4700 4650
Connection ~ 4700 4650
$Comp
L Connector_Generic:Conn_01x06 XP5
U 1 1 5DA72D56
P 7125 5250
F 0 "XP5" H 7205 5196 50  0001 L CNN
F 1 "Conn_01x06" H 7205 5151 50  0001 L CNN
F 2 "NewComponents:Pin_Header_Straight_1x06_mm" H 7125 5250 50  0001 C CNN
F 3 "~" H 7125 5250 50  0001 C CNN
	1    7125 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6925 5050 6925 4800
Wire Wire Line
	6925 4800 6375 4800
Wire Wire Line
	6375 4800 6375 5000
Connection ~ 6375 5000
Wire Wire Line
	6375 5000 6275 5000
Wire Wire Line
	6925 5550 6925 5800
Wire Wire Line
	6925 5800 6375 5800
Wire Wire Line
	6375 5800 6375 5650
Connection ~ 6375 5650
Wire Wire Line
	6375 5650 6275 5650
$Comp
L Device:C_Small C16
U 1 1 5DAD6D55
P 1200 5000
F 0 "C16" H 1210 5070 50  0000 L CNN
F 1 "0.1u" H 1210 4920 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 1200 5000 50  0001 C CNN
F 3 "" H 1200 5000 50  0000 C CNN
	1    1200 5000
	1    0    0    -1  
$EndComp
Text GLabel 1100 5150 0    50   Input ~ 0
GND
Text GLabel 1100 4850 0    60   Input ~ 0
5V
Wire Wire Line
	1100 4850 1200 4850
Wire Wire Line
	1200 4850 1200 4900
Wire Wire Line
	1200 5100 1200 5150
Wire Wire Line
	1200 5150 1100 5150
$Comp
L Device:R R15
U 1 1 5DB8BA3B
P 9175 5675
F 0 "R15" V 9255 5675 50  0000 C CNN
F 1 "10k" V 9175 5675 50  0000 C CNN
F 2 "NewComponents:R_0603" V 9105 5675 50  0001 C CNN
F 3 "" H 9175 5675 50  0000 C CNN
	1    9175 5675
	0    1    -1   0   
$EndComp
Text GLabel 8875 5675 0    60   Input ~ 0
GND
Wire Wire Line
	9425 5375 9425 5675
Wire Wire Line
	9425 5675 9325 5675
Connection ~ 9425 5375
Wire Wire Line
	9425 5375 9525 5375
Wire Wire Line
	9025 5675 8875 5675
Wire Notes Line
	700  4000 700  5450
Wire Notes Line
	700  5450 5175 5450
Wire Notes Line
	5175 5450 5175 4000
Wire Notes Line
	5175 4000 700  4000
Text Notes 2775 5400 0    79   ~ 0
DNA
$EndSCHEMATC
