EESchema Schematic File Version 4
LIBS:RDC2-0032-cache
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
$Comp
L Device:C_Small C1
U 1 1 57739200
P 2450 2750
F 0 "C1" H 2460 2820 50  0000 L CNN
F 1 "0,1мкФ" H 2460 2670 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2450 2750 50  0001 C CNN
F 3 "" H 2450 2750 50  0000 C CNN
	1    2450 2750
	1    0    0    -1  
$EndComp
Text GLabel 7850 1450 2    60   Input ~ 0
VDD
Text GLabel 7850 1800 2    60   Input ~ 0
GND
$Comp
L Device:C_Small C12
U 1 1 57739994
P 6800 1650
F 0 "C12" H 6810 1720 50  0000 L CNN
F 1 "0,1мкФ" H 6810 1570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6800 1650 50  0001 C CNN
F 3 "" H 6800 1650 50  0000 C CNN
	1    6800 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 57739B63
P 2500 4650
F 0 "R3" V 2580 4650 50  0000 C CNN
F 1 "10k" V 2500 4650 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2430 4650 50  0001 C CNN
F 3 "" H 2500 4650 50  0000 C CNN
	1    2500 4650
	0    -1   -1   0   
$EndComp
Text GLabel 2150 2950 0    60   Input ~ 0
GND
Text GLabel 2150 2600 0    60   Input ~ 0
RST
$Comp
L Device:CP_Small C14
U 1 1 5773D287
P 7500 1650
F 0 "C14" H 7510 1720 50  0000 L CNN
F 1 "10мкФ" H 7510 1570 50  0000 L CNN
F 2 "NewComponents:TantalC_SizeA_EIA-3216_HandSoldering_mm" H 7500 1650 50  0001 C CNN
F 3 "" H 7500 1650 50  0000 C CNN
	1    7500 1650
	1    0    0    -1  
$EndComp
$Comp
L regul:AP131-33 DA1
U 1 1 577D742F
P 3150 1550
F 0 "DA1" H 2950 1800 50  0000 L CNN
F 1 "LP2985AIM5-3.3" H 3850 1800 50  0000 R CNN
F 2 "NewComponents:SOT-23-5_mm" H 3150 1150 50  0001 C CNN
F 3 "" H 3150 1550 50  0000 C CNN
	1    3150 1550
	1    0    0    -1  
$EndComp
Text GLabel 2150 1950 0    60   Input ~ 0
GND
Text GLabel 4200 1450 2    60   Input ~ 0
VDD
Text GLabel 2150 1450 0    60   Input ~ 0
5V
$Comp
L Device:C_Small C13
U 1 1 577E2E6F
P 7150 1650
F 0 "C13" H 7160 1720 50  0000 L CNN
F 1 "0,1мкФ" H 7160 1570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 7150 1650 50  0001 C CNN
F 3 "" H 7150 1650 50  0000 C CNN
	1    7150 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 577E2EAD
P 4000 1700
F 0 "C10" H 4010 1770 50  0000 L CNN
F 1 "4,7мкФ" H 4010 1620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 4000 1700 50  0001 C CNN
F 3 "" H 4000 1700 50  0000 C CNN
	1    4000 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 577E3165
P 3550 1700
F 0 "C9" H 3560 1770 50  0000 L CNN
F 1 "0,01мкФ" H 3560 1620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3550 1700 50  0001 C CNN
F 3 "" H 3550 1700 50  0000 C CNN
	1    3550 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 577E31AD
P 2500 1700
F 0 "C2" H 2510 1770 50  0000 L CNN
F 1 "4,7мкФ" H 2510 1620 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2500 1700 50  0001 C CNN
F 3 "" H 2500 1700 50  0000 C CNN
	1    2500 1700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R14
U 1 1 5812F245
P 10200 3800
F 0 "R14" V 10250 3600 50  0000 C CNN
F 1 "22R" V 10200 3800 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 10130 3800 50  0001 C CNN
F 3 "" H 10200 3800 50  0000 C CNN
	1    10200 3800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R13
U 1 1 5812F356
P 10200 3700
F 0 "R13" V 10250 3500 50  0000 C CNN
F 1 "22R" V 10200 3700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 10130 3700 50  0001 C CNN
F 3 "" H 10200 3700 50  0000 C CNN
	1    10200 3700
	0    -1   -1   0   
$EndComp
$Comp
L RDC2-0032-rescue:USBLC6 VD1
U 1 1 5812FA05
P 12550 3800
F 0 "VD1" H 12550 4000 60  0000 C CNN
F 1 "USBLC6" H 12550 3600 60  0000 C CNN
F 2 "NewComponents:SOT23-6L" H 12550 3800 60  0001 C CNN
F 3 "" H 12550 3800 60  0000 C CNN
	1    12550 3800
	-1   0    0    -1  
$EndComp
Text GLabel 10600 3700 2    60   Input ~ 0
USB_DM
Text GLabel 10600 3800 2    60   Input ~ 0
USB_DP
$Comp
L conn:CONN_01X02 XP2
U 1 1 581341C5
P 1850 4700
F 0 "XP2" H 1850 4850 50  0001 C CNN
F 1 "PLS-2" H 1850 4550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x02_mm" H 1850 4700 50  0001 C CNN
F 3 "" H 1850 4700 50  0000 C CNN
	1    1850 4700
	-1   0    0    -1  
$EndComp
Text GLabel 11950 3700 0    60   Input ~ 0
USB_DM
Text GLabel 11950 3900 0    60   Input ~ 0
USB_DP
Text GLabel 11950 3800 0    60   Input ~ 0
5V
Text GLabel 13200 3800 2    60   Input ~ 0
GND
$Comp
L RDC2-0032-rescue:USB_OTG-RESCUE-RDC2-0032 XS1
U 1 1 5810FA5A
P 14150 3800
F 0 "XS1" V 13850 3800 50  0000 C CNN
F 1 "USB_OTG" H 14150 4000 50  0001 C CNN
F 2 "NewComponents:USB_Mini-B_mm" V 14100 3700 50  0001 C CNN
F 3 "" V 14100 3700 50  0000 C CNN
	1    14150 3800
	0    1    1    0   
$EndComp
Text GLabel 11950 4300 0    60   Input ~ 0
GND
Text GLabel 13650 3600 0    60   Input ~ 0
5V
$Comp
L Device:C_Small C15
U 1 1 582B60B8
P 12050 4100
F 0 "C15" H 12060 4170 50  0000 L CNN
F 1 "0,1мкФ" H 12060 4020 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 12050 4100 50  0001 C CNN
F 3 "" H 12050 4100 50  0000 C CNN
	1    12050 4100
	1    0    0    -1  
$EndComp
Text GLabel 2200 4900 2    60   Input ~ 0
VDD
$Comp
L stm32:STM32F042K6Tx DD1
U 1 1 59CBA66E
P 6150 3300
F 0 "DD1" H 3050 4425 50  0000 L BNN
F 1 "STM32F042K6Tx" H 9250 4425 50  0000 R BNN
F 2 "Housings_QFP:TQFP-32_7x7mm_Pitch0.8mm" H 9250 4375 50  0001 R TNN
F 3 "" H 6150 3300 50  0000 C CNN
	1    6150 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 59CBB8F7
P 6450 1650
F 0 "C11" H 6460 1720 50  0000 L CNN
F 1 "0,1мкФ" H 6460 1570 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 6450 1650 50  0001 C CNN
F 3 "" H 6450 1650 50  0000 C CNN
	1    6450 1650
	1    0    0    -1  
$EndComp
Text GLabel 6550 4650 2    60   Input ~ 0
GND
Wire Wire Line
	6050 1450 6450 1450
Wire Wire Line
	6800 1550 6800 1450
Connection ~ 6800 1450
Wire Wire Line
	7150 1450 7150 1550
Connection ~ 7150 1450
Wire Wire Line
	6450 1800 6800 1800
Wire Wire Line
	6800 1800 6800 1750
Wire Wire Line
	7150 1750 7150 1800
Connection ~ 7150 1800
Wire Wire Line
	2150 2600 2450 2600
Wire Wire Line
	2450 2600 2450 2650
Wire Wire Line
	2450 2950 2450 2850
Wire Wire Line
	2150 2950 2450 2950
Connection ~ 2450 2600
Wire Wire Line
	7500 1550 7500 1450
Connection ~ 7500 1450
Wire Wire Line
	7500 1750 7500 1800
Connection ~ 7500 1800
Wire Wire Line
	3450 1450 4000 1450
Wire Wire Line
	3450 1550 3550 1550
Wire Wire Line
	3550 1550 3550 1600
Wire Wire Line
	2150 1450 2300 1450
Wire Wire Line
	2500 1450 2500 1600
Wire Wire Line
	2850 1550 2750 1550
Wire Wire Line
	2750 1550 2750 1450
Connection ~ 2750 1450
Wire Wire Line
	4000 1950 4000 1800
Wire Wire Line
	2150 1950 2300 1950
Wire Wire Line
	3550 1800 3550 1950
Connection ~ 3550 1950
Wire Wire Line
	3150 1850 3150 1950
Connection ~ 3150 1950
Wire Wire Line
	2500 1800 2500 1950
Connection ~ 2500 1950
Connection ~ 2500 1450
Connection ~ 4000 1450
Wire Wire Line
	9350 3700 10050 3700
Wire Wire Line
	10050 3800 9350 3800
Wire Wire Line
	10600 3700 10350 3700
Wire Wire Line
	10350 3800 10600 3800
Wire Wire Line
	13200 3800 13000 3800
Wire Wire Line
	11950 3800 12050 3800
Wire Wire Line
	11950 3700 12100 3700
Wire Wire Line
	12100 3900 11950 3900
Wire Wire Line
	14250 4300 14250 4200
Wire Wire Line
	11950 4300 12050 4300
Wire Wire Line
	13850 4000 13700 4000
Wire Wire Line
	13700 4000 13700 4300
Connection ~ 13700 4300
Wire Wire Line
	13850 3700 13000 3700
Wire Wire Line
	13850 3800 13550 3800
Wire Wire Line
	13550 3800 13550 3900
Wire Wire Line
	13550 3900 13000 3900
Wire Wire Line
	12050 3800 12050 4000
Wire Wire Line
	2050 4650 2200 4650
Connection ~ 2200 4650
Wire Wire Line
	2050 4750 2100 4750
Wire Wire Line
	2100 4750 2100 4900
Wire Wire Line
	2100 4900 2200 4900
Wire Wire Line
	13650 3600 13850 3600
Connection ~ 12050 3800
Wire Wire Line
	12050 4200 12050 4300
Connection ~ 12050 4300
Wire Wire Line
	4000 1450 4000 1600
Wire Wire Line
	6050 1450 6050 2000
Wire Wire Line
	6050 2000 6150 2000
Wire Wire Line
	6250 2000 6250 2100
Connection ~ 6050 2000
Wire Wire Line
	6150 2100 6150 2000
Connection ~ 6150 2000
Wire Wire Line
	6050 4500 6050 4650
Wire Wire Line
	2650 4650 6050 4650
Wire Wire Line
	6150 4500 6150 4650
Connection ~ 6150 4650
Connection ~ 6050 4650
Wire Wire Line
	6450 1550 6450 1450
Connection ~ 6450 1450
Wire Wire Line
	6450 1750 6450 1800
Connection ~ 6800 1800
Wire Wire Line
	2200 4650 2200 4100
Wire Wire Line
	2200 4100 2950 4100
Text GLabel 10600 2600 2    60   Input ~ 0
AIN_0
Text GLabel 10600 2700 2    60   Input ~ 0
AIN_1
Text GLabel 10600 2800 2    60   Input ~ 0
AIN_2
Text GLabel 10600 2900 2    60   Input ~ 0
AIN_3
Text GLabel 10600 3000 2    60   Input ~ 0
AIN_4
Text GLabel 10600 3100 2    60   Input ~ 0
AIN_5
Text GLabel 10600 3200 2    60   Input ~ 0
AIN_6
Text GLabel 10600 3300 2    60   Input ~ 0
AIN_7
Wire Wire Line
	10600 2600 9350 2600
Wire Wire Line
	9350 2700 10600 2700
Wire Wire Line
	10600 2800 9350 2800
Wire Wire Line
	9350 2900 10600 2900
Wire Wire Line
	10600 3000 9350 3000
Wire Wire Line
	9350 3100 10600 3100
Wire Wire Line
	10600 3200 9350 3200
Wire Wire Line
	9350 3300 10600 3300
Text GLabel 10600 3400 2    60   Input ~ 0
KEY_3
Wire Wire Line
	10600 3400 9350 3400
Text GLabel 10600 3500 2    60   Input ~ 0
Tx
Text GLabel 10600 3600 2    60   Input ~ 0
Rx
Wire Wire Line
	10600 3500 9350 3500
Wire Wire Line
	9350 3600 10600 3600
Text GLabel 10600 3900 2    60   Input ~ 0
CONF_0
Text GLabel 10600 4000 2    60   Input ~ 0
CONF_1
Text GLabel 10600 4100 2    60   Input ~ 0
CONF_2
Wire Wire Line
	10600 3900 9350 3900
Wire Wire Line
	9350 4000 10600 4000
Wire Wire Line
	10600 4100 9350 4100
Text GLabel 1650 3100 0    60   Input ~ 0
KEY_0
Text GLabel 1650 3200 0    60   Input ~ 0
KEY_1
Wire Wire Line
	2950 3100 1650 3100
Wire Wire Line
	1650 3200 2950 3200
Text GLabel 1650 3400 0    60   Input ~ 0
AIN_8
Text GLabel 1650 3500 0    60   Input ~ 0
AIN_9
Wire Wire Line
	2950 3400 1650 3400
Wire Wire Line
	1650 3500 2950 3500
Text GLabel 1650 3600 0    60   Input ~ 0
KEY_2
Text GLabel 1650 3700 0    60   Input ~ 0
KEY_4
Text GLabel 1650 3800 0    60   Input ~ 0
KEY_5
Wire Wire Line
	2950 3600 1650 3600
Wire Wire Line
	1650 3700 2950 3700
Wire Wire Line
	2950 3800 1650 3800
Text GLabel 1650 3900 0    60   Input ~ 0
SCL
Text GLabel 1650 4000 0    60   Input ~ 0
SDA
Wire Wire Line
	2950 3900 1650 3900
Wire Wire Line
	1650 4000 2950 4000
$Comp
L Device:R R4
U 1 1 59E1926D
P 2500 6000
F 0 "R4" V 2580 6000 50  0000 C CNN
F 1 "10k" V 2500 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2430 6000 50  0001 C CNN
F 3 "" H 2500 6000 50  0000 C CNN
	1    2500 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 59E1B1B1
P 2700 6000
F 0 "R5" V 2780 6000 50  0000 C CNN
F 1 "10k" V 2700 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2630 6000 50  0001 C CNN
F 3 "" H 2700 6000 50  0000 C CNN
	1    2700 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 59E1B619
P 2900 6000
F 0 "R6" V 2980 6000 50  0000 C CNN
F 1 "10k" V 2900 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 2830 6000 50  0001 C CNN
F 3 "" H 2900 6000 50  0000 C CNN
	1    2900 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 59E1B712
P 3100 6000
F 0 "R7" V 3180 6000 50  0000 C CNN
F 1 "10k" V 3100 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3030 6000 50  0001 C CNN
F 3 "" H 3100 6000 50  0000 C CNN
	1    3100 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R8
U 1 1 59E1B72B
P 3300 6000
F 0 "R8" V 3380 6000 50  0000 C CNN
F 1 "10k" V 3300 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3230 6000 50  0001 C CNN
F 3 "" H 3300 6000 50  0000 C CNN
	1    3300 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 59E1BBF6
P 3500 6000
F 0 "R9" V 3580 6000 50  0000 C CNN
F 1 "10k" V 3500 6000 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 3430 6000 50  0001 C CNN
F 3 "" H 3500 6000 50  0000 C CNN
	1    3500 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R10
U 1 1 59E21CF6
P 5300 6200
F 0 "R10" V 5380 6200 50  0000 C CNN
F 1 "10k" V 5300 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5230 6200 50  0001 C CNN
F 3 "" H 5300 6200 50  0000 C CNN
	1    5300 6200
	-1   0    0    1   
$EndComp
Text GLabel 5800 6450 2    60   Input ~ 0
CONF_0
$Comp
L Device:R R11
U 1 1 59E236DA
P 5500 6200
F 0 "R11" V 5580 6200 50  0000 C CNN
F 1 "10k" V 5500 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5430 6200 50  0001 C CNN
F 3 "" H 5500 6200 50  0000 C CNN
	1    5500 6200
	-1   0    0    1   
$EndComp
Text GLabel 5800 5950 2    60   Input ~ 0
GND
Text GLabel 5800 6550 2    60   Input ~ 0
CONF_1
$Comp
L Device:R R12
U 1 1 59E23798
P 5700 6200
F 0 "R12" V 5780 6200 50  0000 C CNN
F 1 "10k" V 5700 6200 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 5630 6200 50  0001 C CNN
F 3 "" H 5700 6200 50  0000 C CNN
	1    5700 6200
	-1   0    0    1   
$EndComp
Text GLabel 5800 6650 2    60   Input ~ 0
CONF_2
$Comp
L conn:CONN_01X02 XP4
U 1 1 59E125DB
P 2050 1700
F 0 "XP4" H 2050 1850 50  0001 C CNN
F 1 "PLS-2" H 2050 1550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x02_mm" H 2050 1700 50  0001 C CNN
F 3 "" H 2050 1700 50  0000 C CNN
	1    2050 1700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2250 1650 2300 1650
Wire Wire Line
	2300 1650 2300 1450
Connection ~ 2300 1450
Wire Wire Line
	2250 1750 2300 1750
Wire Wire Line
	2300 1750 2300 1950
Connection ~ 2300 1950
Text GLabel 13850 2750 0    60   Input ~ 0
Tx
Text GLabel 13850 2850 0    60   Input ~ 0
Rx
Text GLabel 13850 2950 0    60   Input ~ 0
GND
Text GLabel 13850 3050 0    60   Input ~ 0
VDD
$Comp
L conn:CONN_01X04 XP17
U 1 1 59E18905
P 14250 2900
F 0 "XP17" H 14250 3150 50  0000 C CNN
F 1 "CONN_01X04" H 14250 2650 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x04_mm" H 14250 2900 50  0001 C CNN
F 3 "" H 14250 2900 50  0000 C CNN
	1    14250 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	14050 2750 13850 2750
Wire Wire Line
	13850 2850 14050 2850
Wire Wire Line
	14050 2950 13850 2950
Wire Wire Line
	13850 3050 14050 3050
Text GLabel 6750 6300 0    60   Input ~ 0
GND
Text GLabel 6750 6800 0    60   Input ~ 0
VDD
Text GLabel 7150 6550 2    60   Input ~ 0
AIN_0
Wire Wire Line
	7050 6550 7150 6550
Text GLabel 7900 6550 2    60   Input ~ 0
AIN_1
Wire Wire Line
	7900 6550 7800 6550
Text GLabel 8650 6550 2    60   Input ~ 0
AIN_2
Wire Wire Line
	8650 6550 8550 6550
Text GLabel 9400 6550 2    60   Input ~ 0
AIN_3
Wire Wire Line
	9400 6550 9300 6550
Text GLabel 10150 6550 2    60   Input ~ 0
AIN_4
Wire Wire Line
	10150 6550 10050 6550
Text GLabel 10900 6550 2    60   Input ~ 0
AIN_5
Wire Wire Line
	10900 6550 10800 6550
Text GLabel 11650 6550 2    60   Input ~ 0
AIN_6
Wire Wire Line
	11650 6550 11550 6550
Text GLabel 12400 6550 2    60   Input ~ 0
AIN_7
Wire Wire Line
	12400 6550 12300 6550
Text GLabel 13150 6550 2    60   Input ~ 0
AIN_8
Wire Wire Line
	13150 6550 13050 6550
Text GLabel 13900 6550 2    60   Input ~ 0
AIN_9
Wire Wire Line
	13900 6550 13800 6550
Wire Wire Line
	6750 6300 7100 6300
Wire Wire Line
	10100 6300 10100 6450
Wire Wire Line
	10100 6800 10100 6650
Wire Wire Line
	6750 6800 7100 6800
Wire Wire Line
	13850 6300 13850 6450
Wire Wire Line
	13850 6800 13850 6650
Wire Wire Line
	7100 6650 7100 6800
Connection ~ 7100 6800
Wire Wire Line
	7100 6300 7100 6450
Connection ~ 7100 6300
Wire Wire Line
	7850 6300 7850 6450
Connection ~ 7850 6300
Wire Wire Line
	7850 6650 7850 6800
Connection ~ 7850 6800
Wire Wire Line
	8600 6650 8600 6800
Connection ~ 8600 6800
Wire Wire Line
	8600 6300 8600 6450
Connection ~ 8600 6300
Wire Wire Line
	9350 6300 9350 6450
Connection ~ 9350 6300
Wire Wire Line
	9350 6650 9350 6800
Connection ~ 9350 6800
Wire Wire Line
	13100 6650 13100 6800
Connection ~ 13100 6800
Wire Wire Line
	13100 6300 13100 6450
Connection ~ 13100 6300
Wire Wire Line
	12350 6300 12350 6450
Connection ~ 12350 6300
Wire Wire Line
	12350 6650 12350 6800
Connection ~ 12350 6800
Wire Wire Line
	11600 6650 11600 6800
Connection ~ 11600 6800
Wire Wire Line
	11600 6300 11600 6450
Connection ~ 11600 6300
Wire Wire Line
	10850 6300 10850 6450
Connection ~ 10850 6300
Wire Wire Line
	10850 6650 10850 6800
Connection ~ 10850 6800
Text GLabel 1200 4450 0    60   Input ~ 0
SCL
Text GLabel 1200 4350 0    60   Input ~ 0
SDA
$Comp
L conn:CONN_01X02 XP1
U 1 1 59E3204E
P 1750 4400
F 0 "XP1" H 1750 4550 50  0001 C CNN
F 1 "PLS-2" H 1750 4250 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x02_mm" H 1750 4400 50  0001 C CNN
F 3 "" H 1750 4400 50  0000 C CNN
	1    1750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 4350 1500 4350
Wire Wire Line
	1200 4450 1400 4450
$Comp
L Device:R R1
U 1 1 59E335C9
P 1150 4700
F 0 "R1" V 1230 4700 50  0000 C CNN
F 1 "4k7" V 1150 4700 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1080 4700 50  0001 C CNN
F 3 "" H 1150 4700 50  0000 C CNN
	1    1150 4700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 59E33B8C
P 1150 4900
F 0 "R2" V 1230 4900 50  0000 C CNN
F 1 "4k7" V 1150 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_0603_HandSoldering" V 1080 4900 50  0001 C CNN
F 3 "" H 1150 4900 50  0000 C CNN
	1    1150 4900
	0    -1   -1   0   
$EndComp
Text GLabel 850  4900 0    60   Input ~ 0
VDD
Wire Wire Line
	850  4900 950  4900
Wire Wire Line
	1000 4700 950  4700
Wire Wire Line
	950  4700 950  4900
Connection ~ 950  4900
Wire Wire Line
	1300 4700 1400 4700
Wire Wire Line
	1400 4700 1400 4450
Connection ~ 1400 4450
Wire Wire Line
	1300 4900 1500 4900
Wire Wire Line
	1500 4900 1500 4350
Connection ~ 1500 4350
$Comp
L conn:CONN_01X03 XP7
U 1 1 59ED08D4
P 6850 6550
F 0 "XP7" H 6850 6750 50  0000 C CNN
F 1 "CONN_01X03" V 6950 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 6850 6550 50  0001 C CNN
F 3 "" H 6850 6550 50  0000 C CNN
	1    6850 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 6450 7050 6450
Wire Wire Line
	7050 6650 7100 6650
$Comp
L conn:CONN_01X03 XP8
U 1 1 59ED382D
P 7600 6550
F 0 "XP8" H 7600 6750 50  0000 C CNN
F 1 "CONN_01X03" V 7700 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 7600 6550 50  0001 C CNN
F 3 "" H 7600 6550 50  0000 C CNN
	1    7600 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7850 6450 7800 6450
Wire Wire Line
	7800 6650 7850 6650
$Comp
L conn:CONN_01X03 XP9
U 1 1 59ED4CFF
P 8350 6550
F 0 "XP9" H 8350 6750 50  0000 C CNN
F 1 "CONN_01X03" V 8450 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 8350 6550 50  0001 C CNN
F 3 "" H 8350 6550 50  0000 C CNN
	1    8350 6550
	-1   0    0    -1  
$EndComp
$Comp
L conn:CONN_01X03 XP10
U 1 1 59ED5EC7
P 9100 6550
F 0 "XP10" H 9100 6750 50  0000 C CNN
F 1 "CONN_01X03" V 9200 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 9100 6550 50  0001 C CNN
F 3 "" H 9100 6550 50  0000 C CNN
	1    9100 6550
	-1   0    0    -1  
$EndComp
$Comp
L conn:CONN_01X03 XP11
U 1 1 59ED67C5
P 9850 6550
F 0 "XP11" H 9850 6750 50  0000 C CNN
F 1 "CONN_01X03" V 9950 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 9850 6550 50  0001 C CNN
F 3 "" H 9850 6550 50  0000 C CNN
	1    9850 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8600 6450 8550 6450
Wire Wire Line
	8550 6650 8600 6650
Wire Wire Line
	9350 6450 9300 6450
Wire Wire Line
	9300 6650 9350 6650
Wire Wire Line
	10100 6450 10050 6450
Wire Wire Line
	10100 6650 10050 6650
Connection ~ 10100 6300
Connection ~ 10100 6800
$Comp
L conn:CONN_01X03 XP12
U 1 1 59EDB340
P 10600 6550
F 0 "XP12" H 10600 6750 50  0000 C CNN
F 1 "CONN_01X03" V 10700 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 10600 6550 50  0001 C CNN
F 3 "" H 10600 6550 50  0000 C CNN
	1    10600 6550
	-1   0    0    -1  
$EndComp
$Comp
L conn:CONN_01X03 XP13
U 1 1 59EDCB3B
P 11350 6550
F 0 "XP13" H 11350 6750 50  0000 C CNN
F 1 "CONN_01X03" V 11450 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 11350 6550 50  0001 C CNN
F 3 "" H 11350 6550 50  0000 C CNN
	1    11350 6550
	-1   0    0    -1  
$EndComp
$Comp
L conn:CONN_01X03 XP14
U 1 1 59EDCBF4
P 12100 6550
F 0 "XP14" H 12100 6750 50  0000 C CNN
F 1 "CONN_01X03" V 12200 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 12100 6550 50  0001 C CNN
F 3 "" H 12100 6550 50  0000 C CNN
	1    12100 6550
	-1   0    0    -1  
$EndComp
$Comp
L conn:CONN_01X03 XP15
U 1 1 59EDCCAE
P 12850 6550
F 0 "XP15" H 12850 6750 50  0000 C CNN
F 1 "CONN_01X03" V 12950 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 12850 6550 50  0001 C CNN
F 3 "" H 12850 6550 50  0000 C CNN
	1    12850 6550
	-1   0    0    -1  
$EndComp
$Comp
L conn:CONN_01X03 XP16
U 1 1 59EDCD6B
P 13600 6550
F 0 "XP16" H 13600 6750 50  0000 C CNN
F 1 "CONN_01X03" V 13700 6550 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x03_mm" H 13600 6550 50  0001 C CNN
F 3 "" H 13600 6550 50  0000 C CNN
	1    13600 6550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10850 6450 10800 6450
Wire Wire Line
	10800 6650 10850 6650
Wire Wire Line
	11600 6450 11550 6450
Wire Wire Line
	11550 6650 11600 6650
Wire Wire Line
	12350 6450 12300 6450
Wire Wire Line
	12300 6650 12350 6650
Wire Wire Line
	13100 6450 13050 6450
Wire Wire Line
	13050 6650 13100 6650
Wire Wire Line
	13850 6450 13800 6450
Wire Wire Line
	13850 6650 13800 6650
$Comp
L conn:CONN_02X03 XP6
U 1 1 59ED1301
P 4950 6550
F 0 "XP6" H 4950 6750 50  0000 C CNN
F 1 "CONN_02X03" H 4950 6350 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_2x03_mm" H 4950 6550 50  0001 C CNN
F 3 "" H 4950 5350 50  0000 C CNN
	1    4950 6550
	1    0    0    -1  
$EndComp
Text GLabel 4500 6450 0    60   Input ~ 0
VDD
Wire Wire Line
	4500 6450 4600 6450
Wire Wire Line
	4600 6650 4700 6650
Wire Wire Line
	4600 6450 4600 6550
Connection ~ 4600 6450
Wire Wire Line
	4700 6550 4600 6550
Connection ~ 4600 6550
Wire Wire Line
	5200 6450 5300 6450
Wire Wire Line
	5200 6550 5500 6550
Wire Wire Line
	5200 6650 5700 6650
Wire Wire Line
	5300 6350 5300 6450
Connection ~ 5300 6450
Wire Wire Line
	5500 6350 5500 6550
Connection ~ 5500 6550
Wire Wire Line
	5700 6350 5700 6650
Connection ~ 5700 6650
Wire Wire Line
	5300 6050 5300 5950
Wire Wire Line
	5300 5950 5500 5950
Wire Wire Line
	5700 6050 5700 5950
Connection ~ 5700 5950
Wire Wire Line
	5500 6050 5500 5950
Connection ~ 5500 5950
$Comp
L conn:CONN_01X06 XP3
U 1 1 59ED7A20
P 1900 6500
F 0 "XP3" H 1900 6850 50  0000 C CNN
F 1 "CONN_01X06" V 2000 6500 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x06_mm" H 1900 6500 50  0001 C CNN
F 3 "" H 1900 6500 50  0000 C CNN
	1    1900 6500
	1    0    0    -1  
$EndComp
Text GLabel 1500 6750 0    60   Input ~ 0
GND
Wire Wire Line
	1500 6750 1600 6750
Wire Wire Line
	1700 6250 1600 6250
Wire Wire Line
	1600 6250 1600 6350
Connection ~ 1600 6750
Wire Wire Line
	1700 6650 1600 6650
Connection ~ 1600 6650
Wire Wire Line
	1600 6550 1700 6550
Connection ~ 1600 6550
Wire Wire Line
	1700 6450 1600 6450
Connection ~ 1600 6450
Wire Wire Line
	1600 6350 1700 6350
Connection ~ 1600 6350
$Comp
L conn:CONN_01X06 XP5
U 1 1 59ED91FC
P 2150 6500
F 0 "XP5" H 2150 6850 50  0000 C CNN
F 1 "CONN_01X06" V 2250 6500 50  0001 C CNN
F 2 "NewComponents:Pin_Header_Straight_1x06_mm" H 2150 6500 50  0001 C CNN
F 3 "" H 2150 6500 50  0000 C CNN
	1    2150 6500
	-1   0    0    -1  
$EndComp
Text GLabel 3650 6250 2    60   Input ~ 0
KEY_0
Text GLabel 3650 6350 2    60   Input ~ 0
KEY_1
Text GLabel 3650 6450 2    60   Input ~ 0
KEY_2
Text GLabel 3650 6550 2    60   Input ~ 0
KEY_3
Text GLabel 3650 6650 2    60   Input ~ 0
KEY_4
Text GLabel 3650 6750 2    60   Input ~ 0
KEY_5
$Comp
L Device:C_Small C3
U 1 1 59EDE8F4
P 2500 6950
F 0 "C3" H 2510 7020 50  0000 L CNN
F 1 "0,1" H 2510 6870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2500 6950 50  0001 C CNN
F 3 "" H 2500 6950 50  0000 C CNN
	1    2500 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 59EDF29B
P 2700 6950
F 0 "C4" H 2710 7020 50  0000 L CNN
F 1 "0,1" H 2710 6870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2700 6950 50  0001 C CNN
F 3 "" H 2700 6950 50  0000 C CNN
	1    2700 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C5
U 1 1 59EDF354
P 2900 6950
F 0 "C5" H 2910 7020 50  0000 L CNN
F 1 "0,1" H 2910 6870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 2900 6950 50  0001 C CNN
F 3 "" H 2900 6950 50  0000 C CNN
	1    2900 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C6
U 1 1 59EDF410
P 3100 6950
F 0 "C6" H 3110 7020 50  0000 L CNN
F 1 "0,1" H 3110 6870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3100 6950 50  0001 C CNN
F 3 "" H 3100 6950 50  0000 C CNN
	1    3100 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 59EDF4CF
P 3300 6950
F 0 "C7" H 3310 7020 50  0000 L CNN
F 1 "0,1" H 3310 6870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3300 6950 50  0001 C CNN
F 3 "" H 3300 6950 50  0000 C CNN
	1    3300 6950
	-1   0    0    1   
$EndComp
$Comp
L Device:C_Small C8
U 1 1 59EDF591
P 3500 6950
F 0 "C8" H 3510 7020 50  0000 L CNN
F 1 "0,1" H 3510 6870 50  0000 L CNN
F 2 "Capacitors_SMD:C_0603_HandSoldering" H 3500 6950 50  0001 C CNN
F 3 "" H 3500 6950 50  0000 C CNN
	1    3500 6950
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 6250 2500 6250
Wire Wire Line
	2350 6350 2700 6350
Wire Wire Line
	2350 6450 2900 6450
Wire Wire Line
	2350 6550 3100 6550
Wire Wire Line
	2350 6650 3300 6650
Wire Wire Line
	2350 6750 3500 6750
Wire Wire Line
	2500 6150 2500 6250
Connection ~ 2500 6250
Wire Wire Line
	2700 6150 2700 6350
Connection ~ 2700 6350
Wire Wire Line
	2900 6150 2900 6450
Connection ~ 2900 6450
Wire Wire Line
	3100 6150 3100 6550
Connection ~ 3100 6550
Wire Wire Line
	3300 6150 3300 6650
Connection ~ 3300 6650
Wire Wire Line
	3500 6150 3500 6750
Connection ~ 3500 6750
Text GLabel 2400 7150 0    60   Input ~ 0
GND
Text GLabel 2400 5750 0    60   Input ~ 0
VDD
Wire Wire Line
	2400 5750 2500 5750
Wire Wire Line
	3500 5750 3500 5850
Wire Wire Line
	3300 5850 3300 5750
Connection ~ 3300 5750
Wire Wire Line
	3100 5850 3100 5750
Connection ~ 3100 5750
Wire Wire Line
	2900 5850 2900 5750
Connection ~ 2900 5750
Wire Wire Line
	2700 5850 2700 5750
Connection ~ 2700 5750
Wire Wire Line
	2500 5850 2500 5750
Connection ~ 2500 5750
Wire Wire Line
	2400 7150 2500 7150
Wire Wire Line
	3500 7150 3500 7050
Wire Wire Line
	3300 7050 3300 7150
Connection ~ 3300 7150
Wire Wire Line
	3100 7050 3100 7150
Connection ~ 3100 7150
Wire Wire Line
	2900 7050 2900 7150
Connection ~ 2900 7150
Wire Wire Line
	2700 7050 2700 7150
Connection ~ 2700 7150
Wire Wire Line
	2500 7050 2500 7150
Connection ~ 2500 7150
Wire Wire Line
	6800 1450 7150 1450
Wire Wire Line
	7150 1450 7500 1450
Wire Wire Line
	7150 1800 7500 1800
Wire Wire Line
	2450 2600 2950 2600
Wire Wire Line
	7500 1450 7850 1450
Wire Wire Line
	7500 1800 7850 1800
Wire Wire Line
	2750 1450 2850 1450
Wire Wire Line
	3550 1950 4000 1950
Wire Wire Line
	3150 1950 3550 1950
Wire Wire Line
	2500 1950 3150 1950
Wire Wire Line
	2500 1450 2750 1450
Wire Wire Line
	4000 1450 4200 1450
Wire Wire Line
	13700 4300 14250 4300
Wire Wire Line
	2200 4650 2350 4650
Wire Wire Line
	12050 3800 12100 3800
Wire Wire Line
	12050 4300 13700 4300
Wire Wire Line
	6050 2000 6050 2100
Wire Wire Line
	6150 2000 6250 2000
Wire Wire Line
	6150 4650 6550 4650
Wire Wire Line
	6050 4650 6150 4650
Wire Wire Line
	6450 1450 6800 1450
Wire Wire Line
	6800 1800 7150 1800
Wire Wire Line
	2300 1450 2500 1450
Wire Wire Line
	2300 1950 2500 1950
Wire Wire Line
	7100 6800 7850 6800
Wire Wire Line
	7100 6300 7850 6300
Wire Wire Line
	7850 6300 8600 6300
Wire Wire Line
	7850 6800 8600 6800
Wire Wire Line
	8600 6800 9350 6800
Wire Wire Line
	8600 6300 9350 6300
Wire Wire Line
	9350 6300 10100 6300
Wire Wire Line
	9350 6800 10100 6800
Wire Wire Line
	13100 6800 13850 6800
Wire Wire Line
	13100 6300 13850 6300
Wire Wire Line
	12350 6300 13100 6300
Wire Wire Line
	12350 6800 13100 6800
Wire Wire Line
	11600 6800 12350 6800
Wire Wire Line
	11600 6300 12350 6300
Wire Wire Line
	10850 6300 11600 6300
Wire Wire Line
	10850 6800 11600 6800
Wire Wire Line
	950  4900 1000 4900
Wire Wire Line
	1400 4450 1550 4450
Wire Wire Line
	1500 4350 1550 4350
Wire Wire Line
	10100 6300 10850 6300
Wire Wire Line
	10100 6800 10850 6800
Wire Wire Line
	4600 6450 4700 6450
Wire Wire Line
	4600 6550 4600 6650
Wire Wire Line
	5300 6450 5800 6450
Wire Wire Line
	5500 6550 5800 6550
Wire Wire Line
	5700 6650 5800 6650
Wire Wire Line
	5700 5950 5800 5950
Wire Wire Line
	5500 5950 5700 5950
Wire Wire Line
	1600 6750 1700 6750
Wire Wire Line
	1600 6650 1600 6750
Wire Wire Line
	1600 6550 1600 6650
Wire Wire Line
	1600 6450 1600 6550
Wire Wire Line
	1600 6350 1600 6450
Wire Wire Line
	2500 6250 3650 6250
Wire Wire Line
	2500 6250 2500 6850
Wire Wire Line
	2700 6350 3650 6350
Wire Wire Line
	2700 6350 2700 6850
Wire Wire Line
	2900 6450 3650 6450
Wire Wire Line
	2900 6450 2900 6850
Wire Wire Line
	3100 6550 3650 6550
Wire Wire Line
	3100 6550 3100 6850
Wire Wire Line
	3300 6650 3650 6650
Wire Wire Line
	3300 6650 3300 6850
Wire Wire Line
	3500 6750 3650 6750
Wire Wire Line
	3500 6750 3500 6850
Wire Wire Line
	3300 5750 3500 5750
Wire Wire Line
	3100 5750 3300 5750
Wire Wire Line
	2900 5750 3100 5750
Wire Wire Line
	2700 5750 2900 5750
Wire Wire Line
	2500 5750 2700 5750
Wire Wire Line
	3300 7150 3500 7150
Wire Wire Line
	3100 7150 3300 7150
Wire Wire Line
	2900 7150 3100 7150
Wire Wire Line
	2700 7150 2900 7150
Wire Wire Line
	2500 7150 2700 7150
$Comp
L Device:R_POT RV?
U 1 1 5DE3FEBC
P 3725 9675
F 0 "RV?" H 3655 9628 50  0001 R CNN
F 1 "RV1" V 3725 9750 43  0000 R CNN
F 2 "" H 3725 9675 50  0001 C CNN
F 3 "~" H 3725 9675 50  0001 C CNN
	1    3725 9675
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5DE91BF5
P 4050 9675
F 0 "RV?" H 3980 9628 50  0001 R CNN
F 1 "RV1" V 4050 9750 43  0000 R CNN
F 2 "" H 4050 9675 50  0001 C CNN
F 3 "~" H 4050 9675 50  0001 C CNN
	1    4050 9675
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5DE92498
P 4375 9675
F 0 "RV?" H 4305 9628 50  0001 R CNN
F 1 "RV1" V 4375 9725 43  0000 R CNN
F 2 "" H 4375 9675 50  0001 C CNN
F 3 "~" H 4375 9675 50  0001 C CNN
	1    4375 9675
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5DEAD1F0
P 4775 9675
F 0 "RV?" H 4705 9628 50  0001 R CNN
F 1 "RV1" V 4775 9725 43  0000 R CNN
F 2 "" H 4775 9675 50  0001 C CNN
F 3 "~" H 4775 9675 50  0001 C CNN
	1    4775 9675
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5DEAD925
P 5075 9675
F 0 "RV?" H 5005 9628 50  0001 R CNN
F 1 "RV1" V 5075 9725 43  0000 R CNN
F 2 "" H 5075 9675 50  0001 C CNN
F 3 "~" H 5075 9675 50  0001 C CNN
	1    5075 9675
	-1   0    0    1   
$EndComp
$Comp
L Device:R_POT RV?
U 1 1 5DEADD97
P 5375 9675
F 0 "RV?" H 5305 9628 50  0001 R CNN
F 1 "RV1" V 5375 9725 43  0000 R CNN
F 2 "" H 5375 9675 50  0001 C CNN
F 3 "~" H 5375 9675 50  0001 C CNN
	1    5375 9675
	-1   0    0    1   
$EndComp
Wire Wire Line
	5375 9825 5375 10000
Wire Wire Line
	5375 10000 5075 10000
Wire Wire Line
	3725 10000 3725 9825
Wire Wire Line
	4050 9825 4050 10000
Connection ~ 4050 10000
Wire Wire Line
	4050 10000 3725 10000
Wire Wire Line
	4375 9825 4375 10000
Connection ~ 4375 10000
Wire Wire Line
	4375 10000 4050 10000
Wire Wire Line
	4775 9825 4775 10000
Connection ~ 4775 10000
Wire Wire Line
	4775 10000 4375 10000
Wire Wire Line
	5075 9825 5075 10000
Connection ~ 5075 10000
Wire Wire Line
	5075 10000 4775 10000
Wire Wire Line
	5375 9525 5375 9375
Wire Wire Line
	5375 9375 5075 9375
Wire Wire Line
	3725 9375 3725 9525
Wire Wire Line
	5075 9525 5075 9375
Connection ~ 5075 9375
Wire Wire Line
	5075 9375 4775 9375
Wire Wire Line
	4775 9525 4775 9375
Connection ~ 4775 9375
Wire Wire Line
	4775 9375 4375 9375
Wire Wire Line
	4375 9525 4375 9375
Connection ~ 4375 9375
Wire Wire Line
	4375 9375 4050 9375
Wire Wire Line
	4050 9525 4050 9375
Connection ~ 4050 9375
Wire Wire Line
	4050 9375 3725 9375
Wire Wire Line
	5225 9675 5175 9675
Wire Wire Line
	5175 9675 5175 9175
Wire Wire Line
	4925 9675 4875 9675
Wire Wire Line
	4875 9675 4875 9175
$Comp
L Connector:AudioJack3 J1
U 1 1 5DE2F107
P 7700 9600
F 0 "J1" H 7684 9933 50  0000 C CNN
F 1 "AudioJack3" H 7684 9840 50  0000 C CNN
F 2 "" H 7700 9600 50  0001 C CNN
F 3 "~" H 7700 9600 50  0001 C CNN
	1    7700 9600
	1    0    0    -1  
$EndComp
$Comp
L Connector:XLR3_AudioJack2_Combo J1
U 1 1 5DE2FDAC
P 10400 9375
F 0 "J1" V 10400 9607 50  0000 L CNN
F 1 "XLR3_AudioJack2_Combo" V 10354 9607 50  0001 L CNN
F 2 "" H 10400 9475 50  0001 C CNN
F 3 " ~" H 10400 9475 50  0001 C CNN
	1    10400 9375
	0    -1   -1   0   
$EndComp
$Comp
L Connector:XLR3_AudioJack2_Combo J2
U 1 1 5DE8664F
P 10400 10075
F 0 "J2" V 10400 10307 50  0000 L CNN
F 1 "XLR3_AudioJack2_Combo" V 10354 10307 50  0001 L CNN
F 2 "" H 10400 10175 50  0001 C CNN
F 3 " ~" H 10400 10175 50  0001 C CNN
	1    10400 10075
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
