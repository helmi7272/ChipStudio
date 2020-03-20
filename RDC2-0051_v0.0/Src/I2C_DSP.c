/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#include "I2C_DSP.h"
#include "Delay.h"
#include "LogicIOLines.h"


void I2C_DSP_Init()
{
  RCC->CFGR3 |= RCC_CFGR3_I2C1SW_SYSCLK;
  RCC->APB1ENR |= RCC_APB1ENR_I2C1EN;
  //I2C_PORT->TIMINGR = (uint32_t)0x10420F13; //100 кГц @ 8 MHz
  //I2C_PORT->TIMINGR = (uint32_t)0x00310309; //400 кГц @ 8 MHz
  I2C_PORT->TIMINGR = (uint32_t)0x50330309; //400 кГц @ 48 MHz
  //I2C_PORT->TIMINGR = (uint32_t)0x50100103; //1 МГц @ 48 MHz
  I2C_PORT->CR1 = I2C_CR1_PE;
 }
//------------------------------------------------------------------------------
void I2C_DSP_Write(DSPType* DSP, TransferType* Transfer)
{    
  if (DSP->ChipSelect != NO_CHIP_SELECT_LINE)
    IOLines_SetOutputLevel(DSP->ChipSelect, OUT_LEVEL_LOW);
  
  I2C_PORT->CR2 &= ~(I2C_CR2_NBYTES | I2C_CR2_RD_WRN | I2C_CR2_SADD);  
  I2C_PORT->CR2 |= ((Transfer->Size + DSP->InternalAdrBytes) << 16) | (DSP->BusAddress << 1);
  
  I2C_PORT->TXDR = (uint8_t)((Transfer->Address) >> (8 * (DSP->InternalAdrBytes - 1)));
  I2C_PORT->CR2 |= I2C_CR2_START;
  while(!(I2C_PORT->ISR & I2C_ISR_TXE)); //для надежности добавить счетчик
                                         //и выход с ошибкой
  for (uint8_t i = 1; i < (DSP->InternalAdrBytes); i++)
  {
    I2C_PORT->TXDR = (uint8_t)((Transfer->Address) >> (8 * (DSP->InternalAdrBytes - 1 - i)));
    while(!(I2C_PORT->ISR & I2C_ISR_TXE));
  }
  
  uint8_t *DataArray = &(Transfer->Data[0]);
  while(Transfer->Size)
  {
    I2C_PORT->TXDR = *DataArray;
    while(!(I2C_PORT->ISR & I2C_ISR_TXE)); //для надежности добавить счетчик
                                           //и выход с ошибкой
    *DataArray++;
    (Transfer->Size)--;
  }
  
  I2C_PORT->CR2 |= I2C_CR2_STOP;
  
  if (DSP->ChipSelect != NO_CHIP_SELECT_LINE)
    IOLines_SetOutputLevel(DSP->ChipSelect, OUT_LEVEL_HIGH);
}
//------------------------------------------------------------------------------
void I2C_DSP_Read(DSPType* DSP, TransferType* Transfer)
{
  if (DSP->ChipSelect != NO_CHIP_SELECT_LINE)
    IOLines_SetOutputLevel(DSP->ChipSelect, OUT_LEVEL_LOW);
  
  I2C_PORT->CR2 &= ~(I2C_CR2_NBYTES | I2C_CR2_RD_WRN | I2C_CR2_SADD);  
  I2C_PORT->CR2 |= ((DSP->InternalAdrBytes) << 16) | (DSP->BusAddress << 1);
  
  I2C_PORT->TXDR = (uint8_t)((Transfer->Address) >> (8 * (DSP->InternalAdrBytes - 1)));
  I2C_PORT->CR2 |= I2C_CR2_START;
  while(!(I2C_PORT->ISR & I2C_ISR_TXE)); //для надежности добавить счетчик
                                         //и выход с ошибкой
  for (uint8_t i = 1; i < (DSP->InternalAdrBytes); i++)
  {
    I2C_PORT->TXDR = (uint8_t)((Transfer->Address) >> (8 * (DSP->InternalAdrBytes - 1 - i)));
    while(!(I2C_PORT->ISR & I2C_ISR_TXE));
  }
  
  I2C_PORT->CR2 |= I2C_CR2_RD_WRN;
  I2C_PORT->CR2 &= ~I2C_CR2_NBYTES;
  I2C_PORT->CR2 |= ((Transfer->Size) << 16);
  I2C_PORT->CR2 |= I2C_CR2_START;
  
  uint8_t *DataArray = &(Transfer->Data[0]);
  do
  {
    while(!(I2C_PORT->ISR & I2C_ISR_RXNE)); //для надежности добавить счетчик
                                            //и выход с ошибкой
    *DataArray = I2C_PORT->RXDR;
    *DataArray++;
    (Transfer->Size)--;
  }
  while(Transfer->Size);
  
  I2C_PORT->CR2 |= I2C_CR2_STOP;
  I2C_PORT->ICR |= I2C_ICR_STOPCF;
  
  if (DSP->ChipSelect != NO_CHIP_SELECT_LINE)
    IOLines_SetOutputLevel(DSP->ChipSelect, OUT_LEVEL_HIGH);
}
//------------------------------------------------------------------------------
uint8_t I2C_DSP_IsReady(DSPType* DSP)
{
  if (DSP->ChipSelect != NO_CHIP_SELECT_LINE)
    IOLines_SetOutputLevel(DSP->ChipSelect, OUT_LEVEL_LOW);
  
  uint8_t Status = DEVICE_READY;
  DelayInit(DELAY_TIMER_I2C_PSC, DELAY_TIMER_I2C_ARR, DELAY_SYNC);
  
  I2C_PORT->CR2 &= ~(I2C_CR2_NBYTES | I2C_CR2_RD_WRN | I2C_CR2_SADD);
  I2C_PORT->CR2 |= (DSP->BusAddress << 1);
  
  I2C_PORT->CR2 |= I2C_CR2_START;
  Delay();
  I2C_PORT->CR2 |= I2C_CR2_START;
  Delay();

  I2C_PORT->CR2 |= I2C_CR2_STOP;
  Delay();
  
  if ((I2C_PORT->ISR & (I2C_ISR_NACKF | I2C_ISR_BUSY)) != 0)
  {
    Status = 0;
    //I2C_PORT->ICR |= I2C_ICR_NACKCF;
    //I2C_PORT->ISR |= I2C_ISR_TXE;
  }
  
  //I2C_PORT->ICR |= I2C_ICR_STOPCF;
  I2C_PORT->CR1 = 0;
  while((I2C_PORT->CR1 & I2C_CR1_PE) == I2C_CR1_PE);
  Delay();
  
  I2C_PORT->CR1 = I2C_CR1_PE;
  while((I2C_PORT->CR1 & I2C_CR1_PE) == 0);
  
  
  if (DSP->ChipSelect != NO_CHIP_SELECT_LINE)
    IOLines_SetOutputLevel(DSP->ChipSelect, OUT_LEVEL_HIGH);
  
  return Status;
}



