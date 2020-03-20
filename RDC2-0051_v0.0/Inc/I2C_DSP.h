/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#ifndef __I2C_DSP_H
#define __I2C_DSP_H


//#include "Board.h"
#include "DSP.h"

#define   DEVICE_READY                     1
#define   I2C_TRANSFER_SIZE_MAX            224



void I2C_DSP_Init();

void I2C_DSP_Write(DSPType* DSP, TransferType* Transfer);

void I2C_DSP_Read(DSPType* DSP, TransferType* Transfer);

uint8_t I2C_DSP_IsReady(DSPType* DSP);


#endif //__I2C_DSP_H


