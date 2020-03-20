/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/



#ifndef __DSP_H
#define __DSP_H


#include "Board.h"


#define   DSP_REGISTER_DATA_ADR_INCR       0
#define   DSP_PARAMETER_DATA_ADR_INCR      4
#define   DSP_PROGRAM_DATA_ADR_INCR        5

#define   ADAU1701_DSP_CORE_CTRL           0x081C
#define   ADAU1701_SAFELOAD_ADR_0          0x0815
#define   ADAU1701_SAFELOAD_DATA_0         0x0810
#define   ADAU1701_DSP_CORE_IST            (1 << 5)


#define   ADAU_SAFELOAD_PARAM_MAX_COUNT    5


enum DSP_IC
{ 
  DSP_IC_ADAU1701 = 1,
  DSP_IC_ADAU1761,
  DSP_IC_TAS3251,
};

enum DSP_OPERATION
{ 
  DSP_WRITE,
  DSP_READ,
  DSP_CLEAR,
};

enum DSP_WRITE_TYPE
{ 
  DSP_SAFELOAD,
  DSP_REGULAR_WRITE,
};


typedef struct
{
  uint8_t ID;
  uint8_t BusAddress;
  uint8_t ChipSelect;
  uint8_t InternalAdrBytes;
  uint8_t InterfaceNum;
  uint8_t SafeLoadMax;
  
} DSPType;


typedef struct
{
  void (*InterfaceLinesEnable)(uint8_t InterfaceNum);
  void (*InterfaceLinesDisable)(uint8_t InterfaceNum);
  uint8_t (*IsReady)(DSPType* DSP);
  void (*Write)(DSPType* DSP, TransferType* Transfer);
  void (*Read)(DSPType* DSP, TransferType* Transfer);
  
} DSPMethodsType;


void InitDSPStructs(DSPType *DSP, DSPMethodsType *DSPMethods, uint8_t *DSPConf);

void ADAU1701_SafeLoad(DSPType* DSP, DSPMethodsType *DSPMethods, TransferType* Transfer);


#endif //__DSP_H



