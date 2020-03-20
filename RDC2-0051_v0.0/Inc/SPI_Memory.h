/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2018
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#ifndef __SPI_MEMORY_H
#define __SPI_MEMORY_H


#include "Board.h"



#define       SPI1_DR_8BIT                 (*(__IO uint8_t *)((uint32_t)&(SPI1->DR)))

//команды
#define       MEMORY_WRITE_ENABLE          0x06
#define       MEMORY_WRITE_DISABLE         0x04
#define       MEMORY_WRITE_TO_ARRAY        0x02
#define       MEMORY_READ_FROM_ARRAY       0x03
#define       MEMORY_READ_STATUS           0x05
#define       MEMORY_32KB_BLOCK_ERASE      0x52
#define       MEMORY_64KB_BLOCK_ERASE      0xD8
#define       MEMORY_CHIP_ERASE            0xC7 //0x60

#define       MEMORY_STATUS_READY          (1 << 0)
#define       MEMORY_STATUS_WEL            (1 << 1)

#define       MEMORY_PRESENT               1

#define       MEMORY_32KB_BLOCK_SIZE       (32 * 1024)
#define       MEMORY_64KB_BLOCK_SIZE       (64 * 1024)



uint8_t Memory_Init();

void Memory_Write(uint16_t BytesNum, uint32_t StartAddress, uint8_t *DataArray);

void Memory_Read(uint16_t BytesNum, uint32_t StartAddress, uint8_t *DataArray);

void Memory_ReadStatus(uint8_t *Status);

void Memory_EraseBlock(uint32_t BlockAddress, uint8_t EraseCmd);

void Memory_Erase();

void Memory_WhileNotReady();

uint8_t Memory_IsPresent();

uint8_t SPI_Send(uint8_t DataToSend);


#endif //__SPI_MEMORY_H


