/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/



#include "USBPort.h"

#include "usbd_custom_hid_core.h"
#include "usbd_usr.h"


USB_CORE_HANDLE  USB_Device_dev;
uint8_t PrevXferDone = 1;
static volatile uint8_t USBStatus = USB_PORT_IDLE;
static volatile uint8_t USBDataBuf[USB_MESSAGE_LENGTH];



void USBPort_Init()
{
  RCC->APB2ENR |= RCC_APB2ENR_SYSCFGCOMPEN;
  SYSCFG->CFGR1 |= 1 << 4;
  USBD_Init(&USB_Device_dev, &USR_desc, &USBD_HID_cb, &USR_cb);  
}
//------------------------------------------------------------------------------
void USBPort_RecPacket(uint8_t *Packet)
{
  for (uint8_t i = 0; i < USB_MESSAGE_LENGTH; i++)
    USBDataBuf[i] = *(Packet + i);
  
  switch(*(USBDataBuf + USB_CMD_INDEX))
  {
    case USB_CMD_GET_STATUS:
      {
        USBDataBuf[USB_DATA_INDEX] = USBStatus;
        USBPort_WhileNotReadyToSend();
        USBPort_SendData((uint8_t *)USBDataBuf);
      }
    break;
    
    case USB_CMD_MEMORY_WRITE:
      USBStatus |= USB_PORT_WRITE_CONFIG;
    break;
    
    case USB_CMD_BOOT_CONFIG:
      USBStatus |= USB_PORT_BOOT_CONFIG;
    break;
    
    case USB_CMD_MEMORY_ERASE:
      USBStatus |= USB_PORT_MEMORY_ERASE;
    break;
    
    case USB_CMD_GET_ID:
      {
        USBDataBuf[USB_DATA_CONTROLLER_ID_INDEX] = RDC2_0051_ID;
        USBDataBuf[USB_DATA_FIRMWARE_INDEX] = FIRMWARE_VERSION_BYTE_1;
        USBDataBuf[USB_DATA_FIRMWARE_INDEX + 1] = FIRMWARE_VERSION_BYTE_2;
        USBDataBuf[USB_DATA_FIRMWARE_INDEX + 2] = FIRMWARE_VERSION_BYTE_3;
        USBDataBuf[USB_DATA_FIRMWARE_INDEX + 3] = FIRMWARE_VERSION_BYTE_4;
        USBDataBuf[USB_DATA_MEMORY_SIZE_INDEX] = MEMORY_SIZE;
        USBDataBuf[USB_DATA_MEMORY_SIZE_INDEX + 1] = MEMORY_SIZE_UINTS;
        USBDataBuf[USB_DATA_HARDWARE_INDEX] = HARDWARE_VERSION;
        USBPort_WhileNotReadyToSend();
        USBPort_SendData((uint8_t *)USBDataBuf);
      }
    break;
    
    default:
    break;
  }  
}
//------------------------------------------------------------------------------
void USBPort_SendData(uint8_t *Data)
{  
  if (PrevXferDone)
  {    
    USBD_HID_SendReport(&USB_Device_dev, Data, USB_MESSAGE_LENGTH);
    PrevXferDone = 0;
  } 
}
//------------------------------------------------------------------------------
volatile uint8_t* USBPort_GetStatus()
{
  return &USBStatus;
}
//------------------------------------------------------------------------------
void USBPort_ClearStatus(uint8_t StatusFlag)
{
  USBStatus &= ~StatusFlag;
}
//------------------------------------------------------------------------------
void USBPort_SetStatus(uint8_t StatusFlag)
{
  USBStatus |= StatusFlag;
}
//------------------------------------------------------------------------------
volatile uint8_t* USBPort_GetPacket()
{
  return USBDataBuf;
}
//------------------------------------------------------------------------------
void USBPort_WhileNotReadyToSend()
{
  while(PrevXferDone != 1);
}
