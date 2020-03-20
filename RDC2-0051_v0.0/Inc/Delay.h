/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/



#ifndef __DELAY_H
#define __DELAY_H


#include "Board.h"


#define   DELAY_TIMER                      TIM16
#define   DELAY_TIMER_ENR                  APB2ENR
#define   DELAY_TIMER_CLK_EN               RCC_APB2ENR_TIM16EN

#define   DELAY_TIME_ELAPSED               1
#define   DELAY_SYNC                       0
#define   DELAY_ASYNC                      1


void DelayPreInit();

void DelayInit(uint16_t psc, uint16_t arr, uint8_t Flag);

void Delay();

void DelayAsincStart();

void DelayAsincWait();

void TIM16_IRQHandler(void);

void DelayTimerEnable();

void DelayTimerDisable();


#endif//__DELAY_H