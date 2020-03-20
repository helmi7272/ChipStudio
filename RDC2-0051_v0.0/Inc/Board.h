/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2019
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#ifndef __BOARD_H
#define __BOARD_H


#include "stm32f042x6.h"


#define   RDC2_0051_ID                     1

//GPIO
#define   LINE_0_GPIO_GPIO                 GPIOA
#define   LINE_0_GPIO_PIN                  4
#define   LINE_1_GPIO_GPIO                 GPIOA
#define   LINE_1_GPIO_PIN                  5
#define   LINE_2_GPIO_GPIO                 GPIOA
#define   LINE_2_GPIO_PIN                  6
#define   LINE_3_GPIO_GPIO                 GPIOA
#define   LINE_3_GPIO_PIN                  7
#define   LINE_4_GPIO_GPIO                 GPIOB
#define   LINE_4_GPIO_PIN                  0
#define   LINE_5_GPIO_GPIO                 GPIOB
#define   LINE_5_GPIO_PIN                  1
#define   LINE_6_GPIO_GPIO                 GPIOA
#define   LINE_6_GPIO_PIN                  9
#define   LINE_7_GPIO_GPIO                 GPIOA
#define   LINE_7_GPIO_PIN                  10
#define   LINE_8_GPIO_GPIO                 GPIOA
#define   LINE_8_GPIO_PIN                  13
#define   LINE_9_GPIO_GPIO                 GPIOA
#define   LINE_9_GPIO_PIN                  14

//Resistors
#define   LINE_10_RESISTOR_GPIO            GPIOA
#define   LINE_10_RESISTOR_PIN             0
#define   LINE_11_RESISTOR_GPIO            GPIOA
#define   LINE_11_RESISTOR_PIN             1

//Keys
#define   LINE_12_KEY_GPIO                 GPIOA
#define   LINE_12_KEY_PIN                  2
#define   LINE_13_KEY_GPIO                 GPIOA
#define   LINE_13_KEY_PIN                  3

//SPI - DSP, flash memory
#define   SPI_GPIO                         GPIOB
#define   SPI_PORT                         SPI1
#define   SPI_SCK_PIN                      3
#define   SPI_SCK_AF                       0
#define   SPI_MISO_PIN                     4
#define   SPI_MISO_AF                      0
#define   SPI_MOSI_PIN                     5
#define   SPI_MOSI_AF                      0
#define   SPI_MEM_NSS_GPIO                 GPIOA
#define   SPI_MEM_NSS_PIN                  8
#define   SPI_DSP_NSS_GPIO                 GPIOA
#define   SPI_DSP_NSS_PIN                  15//debug//8

//I2C - DSP
#define   DSP_I2C_GPIO                     GPIOB
#define   DSP_I2C_SCL_PIN                  6
#define   DSP_I2C_SDA_PIN                  7
#define   DSP_I2C_AF                       1
#define   I2C_PORT                         I2C1

//I2C - GPIO
#define   GPIO_I2C_GPIO                    GPIOA
#define   GPIO_I2C_SCL_PIN                 LINE_6_GPIO_PIN
#define   GPIO_I2C_SDA_PIN                 LINE_7_GPIO_PIN
#define   GPIO_I2C_AF                      4

//ADC
#define   ADC_0_CHNL                       ADC_CHSELR_CHSEL4
#define   ADC_1_CHNL                       ADC_CHSELR_CHSEL5
#define   ADC_2_CHNL                       ADC_CHSELR_CHSEL6
#define   ADC_3_CHNL                       ADC_CHSELR_CHSEL7
#define   ADC_4_CHNL                       ADC_CHSELR_CHSEL8
#define   ADC_5_CHNL                       ADC_CHSELR_CHSEL9
#define   ADC_6_CHNL                       ADC_CHSELR_CHSEL0
#define   ADC_7_CHNL                       ADC_CHSELR_CHSEL1

#define   ADC_0_LINE_MASK                  (1 << 0)
#define   ADC_1_LINE_MASK                  (1 << 1)
#define   ADC_2_LINE_MASK                  (1 << 2)
#define   ADC_3_LINE_MASK                  (1 << 3)
#define   ADC_4_LINE_MASK                  (1 << 4)
#define   ADC_5_LINE_MASK                  (1 << 5)
#define   ADC_6_LINE_MASK                  (1 << 10)
#define   ADC_7_LINE_MASK                  (1 << 11)

#define   ADC_CHANNELS_MAX                 8

#define   LINES_GPIO_OFFSET                0
#define   LINES_GPIO_COUNT                 10
#define   LINES_RESISTORS_OFFSET           (LINES_GPIO_OFFSET + LINES_GPIO_COUNT)
#define   LINES_RESISTORS_COUNT            2
#define   LINES_KEYS_OFFSET                (LINES_RESISTORS_OFFSET + LINES_RESISTORS_COUNT)
#define   LINES_KEYS_COUNT                 2
#define   LINES_GPIO_INTERFACE_OFFSET      (LINES_KEYS_OFFSET + LINES_KEYS_COUNT)
#define   LINES_GPIO_INTERFACE_I2C_OFFSET  LINES_GPIO_INTERFACE_OFFSET
#define   LINES_GPIO_INTERFACE_SPI_OFFSET  (LINES_GPIO_INTERFACE_I2C_OFFSET + 1)
#define   LINES_GPIO_INTERFACE_COUNT       2
#define   LINES_DSP_INTERFACE_OFFSET       (LINES_GPIO_INTERFACE_OFFSET + LINES_GPIO_INTERFACE_COUNT)
#define   LINES_DSP_INTERFACE_I2C_OFFSET   LINES_DSP_INTERFACE_OFFSET
#define   LINES_DSP_INTERFACE_SPI_OFFSET   (LINES_DSP_INTERFACE_I2C_OFFSET + 1)
#define   LINES_DSP_INTERFACE_CS_OFFSET    (LINES_DSP_INTERFACE_SPI_OFFSET + 1)
#define   LINES_DSP_INTERFACE_COUNT        3
#define   LOGIC_LINES_COUNT                (LINES_GPIO_COUNT + LINES_RESISTORS_COUNT + \
                                            LINES_KEYS_COUNT + LINES_GPIO_INTERFACE_COUNT + \
                                            LINES_DSP_INTERFACE_COUNT)

#define   EEPROM_PAGE_SIZE                 256
#define   MEMORY_ADDRESS_SIZE_USED         3
#define   SRAM_ALLOCATION_SIZE_MAX         EEPROM_PAGE_SIZE


#define   DELAY_TIMER_BOOT_PSC             11999//7999
#define   DELAY_TIMER_BOOT_ARR             9999//5999
#define   DELAY_TIMER_DSP_PSC              39
#define   DELAY_TIMER_DSP_ARR              29
#define   DELAY_TIMER_I2C_PSC              29
#define   DELAY_TIMER_I2C_ARR              9


#define   I2C_INTERFACE                    0
#define   SPI_INTERFACE                    1

#define   NO_CHIP_SELECT_LINE              0xFF

#define   FIRMWARE_VERSION_BYTE_1          0x00
#define   FIRMWARE_VERSION_BYTE_2          0x00
#define   FIRMWARE_VERSION_BYTE_3          0x00
#define   FIRMWARE_VERSION_BYTE_4          0x00

#define   HARDWARE_VERSION                 0x01

#define   M_BITS_UINTS                     0
#define   K_BITS_UINTS                     1

#define   MEMORY_SIZE                      32
#define   MEMORY_SIZE_UINTS                M_BITS_UINTS

#define   STATUS_CONFIG_DOWNLOAD           (1 << 0)



enum ErrorCodes
{ 
  MALLOC_ERROR,
  CONTROLLER_ID_ERROR,
  DSP_DISCONNECTED,
};



typedef struct
{
  uint32_t Address;
  uint16_t Size;
  uint8_t  Data[SRAM_ALLOCATION_SIZE_MAX];
  
} TransferType;


typedef struct
{
  uint16_t  Line;
  uint32_t  ConfigAdr;
  //uint16_t  LastValue;
  
} POTType;


typedef struct
{
  uint16_t  Line;
  uint32_t  ConfigAdr;
  uint8_t   Counter;
  uint8_t   ValuesCount;
  
} ButtonType;


typedef struct
{
  uint16_t  Line;
  uint32_t  ConfigAdr;
  
} SwitchType;


void RDC2_0051_Init();

void ADCCallBack(uint16_t Status);

void ButtonsCallBack(uint16_t Status);

void SwitchesCallBack(uint16_t Status);

void ADCLineHandler(uint16_t ADCValue, uint32_t LineConfAdr);

void ButtonLineHandler(ButtonType *ButtonPtr);

void SwitchLineHandler(uint8_t Value, uint32_t LineConfAdr);

void LineHandler(uint8_t LineType, uint16_t Value, uint32_t LineConfAdr);

void BootConfig();

void BootControllerConfig();

void BootDSPConfig(uint8_t *ConfigMap);

void BootLineConfig(uint8_t *ConfigMap);

uint32_t JoinBytesIntoValue(uint8_t *Data, uint8_t Size);

void MemTransferUpdate(uint8_t *Data);

void ErrorHandler(uint8_t ErrorCode);


#endif //__BOARD_H



