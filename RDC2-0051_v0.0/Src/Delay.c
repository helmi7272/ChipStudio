/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/



#include "Delay.h"


static uint8_t Status = 0;


void DelayPreInit()
{
  NVIC_EnableIRQ(TIM16_IRQn);
  NVIC_SetPriority(TIM16_IRQn, 0);
}
//------------------------------------------------------------------------------
void DelayInit(uint16_t psc, uint16_t arr, uint8_t Flag)
{
  RCC->DELAY_TIMER_ENR |= DELAY_TIMER_CLK_EN;
  DELAY_TIMER->PSC = psc;
  DELAY_TIMER->ARR = arr;
  DELAY_TIMER->EGR = TIM_EGR_UG;  
  DELAY_TIMER->SR = 0;
  DELAY_TIMER->CR1 = TIM_CR1_OPM;
  
  if (Flag == DELAY_ASYNC)
    DELAY_TIMER->DIER = TIM_DIER_UIE;
  
  RCC->DELAY_TIMER_ENR &= ~DELAY_TIMER_CLK_EN;
}
//------------------------------------------------------------------------------
void Delay()
{
  DelayTimerEnable();
  while((DELAY_TIMER->SR & TIM_SR_UIF) != TIM_SR_UIF);
  DelayTimerDisable();
}
//------------------------------------------------------------------------------
void DelayAsincStart()
{
  Status = 0;
  DelayTimerEnable();
}
//------------------------------------------------------------------------------
void DelayAsincWait()
{
  while(Status != DELAY_TIME_ELAPSED);
}
//------------------------------------------------------------------------------
void TIM16_IRQHandler(void)
{
  DELAY_TIMER->SR = 0;
  DELAY_TIMER->DIER = 0;
  Status = DELAY_TIME_ELAPSED;
  DelayTimerDisable();
}
//------------------------------------------------------------------------------
void DelayTimerEnable()
{
  RCC->DELAY_TIMER_ENR |= DELAY_TIMER_CLK_EN;
  DELAY_TIMER->CR1 |= TIM_CR1_CEN;
}
//------------------------------------------------------------------------------
void DelayTimerDisable()
{
  DELAY_TIMER->SR = 0;
  RCC->DELAY_TIMER_ENR &= ~DELAY_TIMER_CLK_EN;
}





