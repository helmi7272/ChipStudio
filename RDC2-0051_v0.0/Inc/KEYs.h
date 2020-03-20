/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2019, 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/



#ifndef __KEYS_H
#define __KEYS_H


#include "Board.h"
#include "stdlib.h"
#include "LogicIOLines.h"


#define       KEYS_DEBOUNCE_TIME           70 //мс

//таймер
#define       KEY_SCAN_TIMER               TIM17
#define       KEY_SCAN_TIMER_ENR           APB2ENR
#define       KEY_SCAN_TIMER_CLK_EN        RCC_APB2ENR_TIM17EN
#define       KEY_SCAN_TIMER_IRQ           TIM17_IRQn
#define       KEY_SCAN_TIMER_PSC           239
#define       KEY_SCAN_TIMER_ARR           199

#define       KEY_LEVEL_CHANGE_PENDING     (1 << 0)
#define       KEY_PRESSED_LEVEL            0
#define       SWITCH_THIRD_LEVEL           2


extern const uint8_t LINES_PINS[];


typedef struct
{
  uint16_t          Line;
  uint8_t           Pin;
  GPIO_TypeDef*     GPIO;
  volatile uint8_t  Level;  
  volatile uint8_t  State;
  volatile uint8_t  Counter;  
  
} KeyType;


void TIM17_IRQHandler(void);

void Keys_Init(uint16_t ButtonMask, void (*ButtonsPressedCallback)(uint16_t),
               uint16_t SwitchesMask, void (*SwitchesLevelChangedCallback)(uint16_t));

uint8_t GetKeyLevel(uint8_t KeyNum);

void Keys_Enable();

uint8_t Keys_GetButtonsCount();

uint8_t Keys_GetSwitchesCount();

uint16_t Keys_GetButtonLine(uint8_t ButtonNum);

uint16_t Keys_GetSwitchLine(uint8_t SwitchNum);

uint8_t Keys_GetSwitchLevel(uint8_t SwitchNum);


#endif //__KEYS_H


