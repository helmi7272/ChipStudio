/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/



#ifndef __USB_PORT_H
#define __USB_PORT_H


#include "Board.h"


#define   USB_MESSAGE_LENGTH               0x40 

#define   USB_REPORT_ID_INDEX              0
#define   USB_CMD_INDEX                    0x01 
#define   USB_SUBCMD_INDEX                 0x02
#define   USB_DATA_INDEX                   0x03


#define   USB_CMD_GET_STATUS               0
#define   USB_CMD_MEMORY_WRITE             1
#define   USB_CMD_BOOT_CONFIG              2
#define   USB_CMD_MEMORY_ERASE             3
#define   USB_CMD_GET_ID                   4

#define   USB_SUBCMD_DATA_BLOCK_START      0
#define   USB_SUBCMD_DATA_BLOCK_NEXT       1
#define   USB_SUBCMD_DATA_BLOCK_END        2
#define   USB_SUBCMD_DATA_BLOCK_START_END  3

#define   USB_DATA_ADDRESS_OFFSET          USB_DATA_INDEX//0
#define   USB_DATA_ADDRESS_SIZE            4
#define   USB_DATA_SIZE_OFFSET             (USB_DATA_ADDRESS_OFFSET + USB_DATA_ADDRESS_SIZE)
#define   USB_DATA_SIZE_SIZE               1
#define   USB_DATA_DATA_OFFSET             (USB_DATA_SIZE_OFFSET + USB_DATA_SIZE_SIZE)

#define   USB_DATA_CONTROLLER_ID_INDEX     USB_DATA_INDEX
#define   USB_DATA_FIRMWARE_INDEX          (USB_DATA_CONTROLLER_ID_INDEX + 1)
#define   USB_DATA_MEMORY_SIZE_INDEX       (USB_DATA_FIRMWARE_INDEX + 4)
#define   USB_DATA_HARDWARE_INDEX          (USB_DATA_MEMORY_SIZE_INDEX + 2)

//Status
#define   USB_PORT_IDLE                    0
#define   USB_PORT_WRITE_CONFIG            (1 << 1)
#define   USB_PORT_BOOT_CONFIG             (1 << 2)
#define   USB_PORT_MEMORY_ERASE            (1 << 3)
#define   USB_PORT_BUSY_TO_RECEIVE         (1 << 7)


void USBPort_Init();

void USBPort_RecPacket(uint8_t *Packet);

void USBPort_SendData(uint8_t *Data);

volatile uint8_t* USBPort_GetStatus();

void USBPort_ClearStatus(uint8_t StatusFlag);

void USBPort_SetStatus(uint8_t StatusFlag);

volatile uint8_t* USBPort_GetPacket();

void USBPort_WhileNotReadyToSend();



#endif //__USB_PORT_H

