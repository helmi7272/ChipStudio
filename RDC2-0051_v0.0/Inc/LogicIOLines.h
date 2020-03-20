/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#ifndef __LOGIC_IO_LINES_H
#define __LOGIC_IO_LINES_H

#include "Board.h"


#define   DSP_I2C_INTERFACE                0
#define   GPIO_I2C_INTERFACE               1


enum LinesGPIOFunc
{ 
  LINE_NOT_ACTIVE,
  LINE_BUTTON,
  LINE_SWITCH,
  LINE_ADC,
  LINE_CS,
  LINE_AF,
};

enum LinesOutLevels
{ 
  OUT_LEVEL_LOW,
  OUT_LEVEL_HIGH,
};




void IOLines_Init(uint8_t *Config, uint16_t *ADCLines, uint16_t *KeyLines, uint16_t *SwitchLines);

void IOLines_SetOutputLevel(uint8_t Line, uint8_t Level);

void ActivateI2CLines(uint8_t InterfaceNum);

void DeActivateI2CLines(uint8_t InterfaceNum);

void IOLines_DeInitLine(uint8_t Line);

void IOLines_InitLine(uint8_t Line, uint8_t Function);

uint8_t IOLines_GetLineFunction(uint8_t Line, uint8_t LineConfig);

GPIO_TypeDef* IOLines_GetLineGPIO(uint8_t Line);


#endif //__LOGIC_IO_LINES_H

