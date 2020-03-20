/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2019, 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/




#include "ADC.h"


const uint32_t ADC_CHSEL[] = { ADC_0_CHNL, ADC_1_CHNL, ADC_2_CHNL, ADC_3_CHNL,
                               ADC_4_CHNL, ADC_5_CHNL, ADC_6_CHNL, ADC_7_CHNL, };

const uint16_t ADC_LINES[] = { ADC_0_LINE_MASK, ADC_1_LINE_MASK, ADC_2_LINE_MASK, ADC_3_LINE_MASK, 
                               ADC_4_LINE_MASK, ADC_5_LINE_MASK, ADC_6_LINE_MASK, ADC_7_LINE_MASK, };


static void (*ADCValuesChanged)(uint16_t);
static ADCType *ADCs;//ADCs[ADC_CHANNELS];
static uint16_t *ADCRawValues;
static uint16_t *ADCRawShadows;
static uint8_t ADCChannels = 0;
static uint16_t ADCChnlMask = 0;


void ADC_Init(uint16_t ADCMask, void (*ADCValuesChangedCallback)(uint16_t))
{
  ADCValuesChanged = ADCValuesChangedCallback;
  ADCChnlMask = ADCMask;
    
  RCC->ADC_ENR |= ADC_CLK_EN;
  
  ADC_USED->CR = ADC_CR_ADCAL;
  while(((ADC_USED->CR) & ADC_CR_ADCAL) == ADC_CR_ADCAL);
  
  ADC_USED->CFGR2 = ADC_CFGR2_CKMODE_1;
  ADC_USED->SMPR = ADC_SMPR_SMP_2 | ADC_SMPR_SMP_1 | ADC_SMPR_SMP_0;

  uint32_t ADCSelection = 0;
  for (uint8_t i = 0; i < ADC_CHANNELS_MAX; i++)
  {
    if ((ADCMask & ADC_LINES[i]) != 0)
    {
      ADCChannels++;
      ADCSelection |= ADC_CHSEL[i];
    }
  }
  
  ADCRawValues = malloc(ADCChannels * sizeof(*ADCRawValues));
  if (!ADCRawValues)
    ErrorHandler(MALLOC_ERROR);
  
  ADCRawShadows = malloc(ADCChannels * sizeof(*ADCRawShadows));
  if (!ADCRawShadows)
    ErrorHandler(MALLOC_ERROR);
  
  ADCs = malloc(ADCChannels * sizeof(*ADCs));
  if (!ADCs)
    ErrorHandler(MALLOC_ERROR);
  
  ADC_USED->CHSELR = ADCSelection;
  ADC_USED->CFGR1 = ADC_CFGR1_DMAEN | ADC_CFGR1_DMACFG | ADC_CFGR1_CONT;
  ADC_USED->CR |= ADC_CR_ADEN;
  while(((ADC_USED->ISR) & ADC_ISR_ADRDY) != ADC_ISR_ADRDY);
  
  RCC->DMA_FOR_ADC_ENR |= DMA_FOR_ADC_CLK_EN;
  DMA_CNL_FOR_ADC->CPAR = (uint32_t)(&(ADC_USED->DR));
  DMA_CNL_FOR_ADC->CMAR = (uint32_t)(ADCRawValues);
  DMA_CNL_FOR_ADC->CNDTR = ADCChannels;
  DMA_CNL_FOR_ADC->CCR |= DMA_CCR_MINC | DMA_CCR_MSIZE_0 | DMA_CCR_PSIZE_0 | DMA_CCR_CIRC;
  DMA_CNL_FOR_ADC->CCR |= DMA_CCR_EN;
  
  for (uint8_t chnl = 0; chnl < ADCChannels; chnl++)
  {
    ADCRawValues[chnl] = 0;
        
    ADCs[chnl].CurValue = ADC_MAX_VALUE;
    
    ADCs[chnl].Filter.Result = 0;
        
    for (uint8_t i = 0; i < SMA_SAMPLES; i++)
      ADCs[chnl].Filter.Data[i] = 0;
  }
  
  for (uint8_t chnl = 0; chnl < ADCChannels; chnl++)
  {
    uint8_t Offset = 0;
    while((ADCMask & (1 << Offset)) == 0)
      Offset++;
        
    ADCs[chnl].Line = 1 << Offset;
    ADCMask &= ~ADCs[chnl].Line;
  }
  
  RCC->ADC_TIMER_ENR |= ADC_TIMER_CLK_EN;
  ADC_TIMER->PSC = ADC_TIMER_PSC;
  ADC_TIMER->ARR = ADC_TIMER_ARR;
  ADC_TIMER->EGR = TIM_EGR_UG;
  NVIC_EnableIRQ(ADC_TIMER_IRQ);
  NVIC_SetPriority(ADC_TIMER_IRQ, 1);
  ADC_TIMER->SR = 0;
  ADC_TIMER->DIER = TIM_DIER_UIE;
}
//------------------------------------------------------------------------------
void ADC_Start()
{
  ADC_USED->CR |= ADC_CR_ADSTART;
  ADC_TIMER->CR1 |= TIM_CR1_CEN;
}
//------------------------------------------------------------------------------
void TIM14_IRQHandler(void)
{
  ADC_TIMER->SR = 0;
  
  for (uint8_t chnl = 0; chnl < ADCChannels; chnl++)
    ADCRawShadows[chnl] = ADCRawValues[chnl];
  
  //распределение каналов АЦП в модуле не совпадает с распределением в МК
  //поэтому нужно значения в ADCRawValues поментяь местами
  //резисторы на плате перевернуты, поэтому показания тоже надо перевернуть
  for (uint8_t i = 0; i < LINES_RESISTORS_COUNT; i++)
  {
    if ((ADCChnlMask & (1 << (LINES_RESISTORS_OFFSET + i))) != 0)
    {
      uint16_t RawValue = ADC_MAX_VALUE - ADCRawShadows[0];
      for (uint8_t j = 1; j < ADCChannels; j++)
        ADCRawShadows[j - 1] = ADCRawShadows[j];
      
      ADCRawShadows[ADCChannels - 1] = RawValue;
    }
  }
  
  uint16_t ADCStatus = 0;
    
  for (uint8_t chnl = 0; chnl < ADCChannels; chnl++)
  {
    SMAFilter(ADCRawShadows[chnl], &ADCs[chnl].Filter);
    
    if (((ADCs[chnl].CurValue > ADCs[chnl].Filter.Result) && ((ADCs[chnl].CurValue - ADCs[chnl].Filter.Result) >= ADC_THRESHOLD))
     || ((ADCs[chnl].CurValue < ADCs[chnl].Filter.Result) && ((ADCs[chnl].Filter.Result - ADCs[chnl].CurValue) >= ADC_THRESHOLD)))
    {
      ADCs[chnl].CurValue = ADCs[chnl].Filter.Result;
      ADCStatus |= ADCs[chnl].Line;
    }
  }
  
  if (ADCStatus != 0)
    ADCValuesChanged(ADCStatus);
}
//------------------------------------------------------------------------------
uint16_t ADC_GetValue(uint8_t ADCChnl)
{
  return ADCs[ADCChnl].CurValue;
}
//------------------------------------------------------------------------------
uint8_t ADC_GetChnlCount()
{
  return ADCChannels;
}
//------------------------------------------------------------------------------
uint16_t ADC_GetChnlLine(uint8_t ADCChnl)
{
  return ADCs[ADCChnl].Line;
}
//------------------------------------------------------------------------------
uint16_t ADC_GetChnlMask()
{
  return ADCChnlMask;
}
