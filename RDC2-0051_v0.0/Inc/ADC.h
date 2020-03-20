/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2019, 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#ifndef __ADC_H
#define __ADC_H


#include "Board.h"
#include "SMA_filter.h"
#include "stdlib.h"


#define   ADC_MAX_VALUE                    4095

#define   ADC_USED                         ADC1
#define   ADC_ENR                          APB2ENR
#define   ADC_CLK_EN                       RCC_APB2ENR_ADCEN

#define   ADC_TIMER                        TIM14
#define   ADC_TIMER_ENR                    APB1ENR
#define   ADC_TIMER_CLK_EN                 RCC_APB1ENR_TIM14EN
#define   ADC_TIMER_IRQ                    TIM14_IRQn
//10 ms
#define   ADC_TIMER_PSC                    799
#define   ADC_TIMER_ARR                    599

//DMA
#define   DMA_FOR_ADC                      DMA1
#define   DMA_FOR_ADC_ENR                  AHBENR
#define   DMA_FOR_ADC_CLK_EN               RCC_AHBENR_DMAEN
#define   DMA_CNL_FOR_ADC                  DMA1_Channel1
#define   DMA_CNL_FOR_ADC_IRQ              DMA1_Channel1_IRQn

#define   ADC_THRESHOLD                    50



typedef struct
{
  uint16_t          Line;
  volatile uint16_t CurValue;
  SMAType           Filter;  
  
} ADCType;


void ADC_Init(uint16_t ADCMask, void (*ADCValuesChangedCallback)(uint16_t));

void ADC_Start();

void TIM14_IRQHandler(void);

uint16_t ADC_GetValue(uint8_t ADCChnl);

uint8_t ADC_GetChnlCount();

uint16_t ADC_GetChnlLine(uint8_t ADCChnl);

uint16_t ADC_GetChnlMask();


#endif //__ADC_H

