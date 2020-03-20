/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/




#include "DSP.h"
#include "MemoryMap.h"
#include "I2C_DSP.h"
#include "LogicIOLines.h"
#include "Delay.h"


void InitDSPStructs(DSPType *DSP, DSPMethodsType *DSPMethods, uint8_t *DSPConf)
{
  DSP->ID = DSPConf[DSP_ID_OFFSET];
  DSP->BusAddress = DSPConf[DSP_BUS_ADR_OFFSET];
  DSP->ChipSelect = DSPConf[DSP_CS_GPIO_NUM_OFFSET];
  DSP->InterfaceNum = DSPConf[DSP_INTERFACE_NUM_OFFSET];
  DSP->InternalAdrBytes = 2;
  DSP->SafeLoadMax = ADAU_SAFELOAD_PARAM_MAX_COUNT;
  if (DSP->ID == DSP_IC_TAS3251)
    DSP->InternalAdrBytes = 1;
  
  if (DSPConf[DSP_INTERFACE_TYPE_OFFSET] == I2C_INTERFACE)
  {
    DSPMethods->InterfaceLinesEnable = ActivateI2CLines;
    DSPMethods->InterfaceLinesDisable = DeActivateI2CLines;
    DSPMethods->IsReady = I2C_DSP_IsReady;
    DSPMethods->Write = I2C_DSP_Write;
    DSPMethods->Read = I2C_DSP_Read;
  }
}
//------------------------------------------------------------------------------
void ADAU1701_SafeLoad(DSPType* DSP, DSPMethodsType *DSPMethods, TransferType* Transfer)
{
  TransferType SafeLoad;
  
  for (uint8_t i = 0; i < Transfer->Size; i++)
  {
    uint16_t ParamAdr = (uint16_t)(Transfer->Address + i);
    
    SafeLoad.Address = ADAU1701_SAFELOAD_ADR_0 + i;
    SafeLoad.Size = 2;
    SafeLoad.Data[0] = ParamAdr >> 8;
    SafeLoad.Data[1] = ParamAdr;
    DSPMethods->Write(DSP, &SafeLoad);
    Delay();
    
    SafeLoad.Address = ADAU1701_SAFELOAD_DATA_0 + i;
    SafeLoad.Size = 5;
    SafeLoad.Data[0] = 0;
    SafeLoad.Data[1] = Transfer->Data[i * DSP_PARAMETER_DATA_ADR_INCR];
    SafeLoad.Data[2] = Transfer->Data[i * DSP_PARAMETER_DATA_ADR_INCR + 1];
    SafeLoad.Data[3] = Transfer->Data[i * DSP_PARAMETER_DATA_ADR_INCR + 2];
    SafeLoad.Data[4] = Transfer->Data[i * DSP_PARAMETER_DATA_ADR_INCR + 3];
    DSPMethods->Write(DSP, &SafeLoad);
    Delay();
  }
  
  SafeLoad.Address = ADAU1701_DSP_CORE_CTRL;
  SafeLoad.Size = 2;
  SafeLoad.Data[0] = 0;
  DSPMethods->Read(DSP, &SafeLoad);
  Delay();
  
  SafeLoad.Size = 2;
  SafeLoad.Data[1] |= ADAU1701_DSP_CORE_IST;
  DSPMethods->Write(DSP, &SafeLoad);
  Delay();
}
