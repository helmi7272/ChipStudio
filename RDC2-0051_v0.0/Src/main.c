/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#include "Board.h"
#include "USBPort.h"
#include "SPI_Memory.h"
#include "MemoryMap.h"
#include "stdlib.h"
#include "LogicIOLines.h"
#include "I2C_DSP.h"
#include "Delay.h"
#include "string.h"
#include "ADC.h"
#include "KEYs.h"


static TransferType Transfer;
static uint8_t SystemStatus = 0;
static uint16_t ADCStatus = 0;
static uint16_t ButtonsStatus = 0;
static uint16_t SwitchesStatus = 0;
static POTType *POTs;
static ButtonType *Buttons;
static SwitchType *Switches;


int main()
{
  RDC2_0051_Init();
  
  for(;;)
  {
    __WFI();
    
    if ((*USBPort_GetStatus()) != USB_PORT_IDLE)
    {
      if (((*USBPort_GetStatus()) & USB_PORT_WRITE_CONFIG) == USB_PORT_WRITE_CONFIG)
      {
        USBPort_ClearStatus(USB_PORT_WRITE_CONFIG);
        SystemStatus |= STATUS_CONFIG_DOWNLOAD;
        
        uint8_t *NewData = (uint8_t *)USBPort_GetPacket();
        if ((*(NewData + USB_SUBCMD_INDEX)) == USB_SUBCMD_DATA_BLOCK_START)
        {        
          Transfer.Address = JoinBytesIntoValue(&NewData[USB_DATA_ADDRESS_OFFSET], MEMORY_ADDRESS_SIZE_USED);
          Transfer.Size = NewData[USB_DATA_SIZE_OFFSET];
          for (uint8_t i = 0; i < NewData[USB_DATA_SIZE_OFFSET]; i++)
            Transfer.Data[i] = NewData[USB_DATA_DATA_OFFSET + i];
        }
        else if ((*(NewData + USB_SUBCMD_INDEX)) == USB_SUBCMD_DATA_BLOCK_NEXT)
        {
          MemTransferUpdate(NewData);
        }
        else if ((*(NewData + USB_SUBCMD_INDEX)) == USB_SUBCMD_DATA_BLOCK_END)
        {
          USBPort_SetStatus(USB_PORT_BUSY_TO_RECEIVE);
          
          MemTransferUpdate(NewData);
          Memory_WhileNotReady();
          Memory_Write(Transfer.Size, Transfer.Address, Transfer.Data);
          
          USBPort_ClearStatus(USB_PORT_BUSY_TO_RECEIVE);
        }
        else if ((*(NewData + USB_SUBCMD_INDEX)) == USB_SUBCMD_DATA_BLOCK_START_END)
        {
          USBPort_SetStatus(USB_PORT_BUSY_TO_RECEIVE);
          
          uint16_t Address = (uint16_t)JoinBytesIntoValue(&NewData[USB_DATA_ADDRESS_OFFSET], MEMORY_ADDRESS_SIZE_USED);
          Memory_WhileNotReady();
          Memory_Write(NewData[USB_DATA_SIZE_OFFSET], Address, &NewData[USB_DATA_DATA_OFFSET]);
          
          USBPort_ClearStatus(USB_PORT_BUSY_TO_RECEIVE);
        }
      }
      
      else if (((*USBPort_GetStatus()) & USB_PORT_BOOT_CONFIG) == USB_PORT_BOOT_CONFIG)
      {
        USBPort_ClearStatus(USB_PORT_BOOT_CONFIG);
        SCB->AIRCR = 0x05FA0004;//soft reset
      }
      
      else if (((*USBPort_GetStatus()) & USB_PORT_MEMORY_ERASE) == USB_PORT_MEMORY_ERASE)
      {
        USBPort_ClearStatus(USB_PORT_MEMORY_ERASE);
        USBPort_SetStatus(USB_PORT_BUSY_TO_RECEIVE);
        
        uint8_t BootSize[BOOT_IMAGE_SIZE_SIZE];
        Memory_Read(BOOT_IMAGE_SIZE_SIZE, BOOT_IMAGE_SIZE_OFFSET, BootSize);
        uint32_t SizeValue = JoinBytesIntoValue(BootSize, BOOT_IMAGE_SIZE_SIZE);
        if (SizeValue != 0xFFFFFFFF)
        {
          uint16_t Erase64kBCount = 0;
          uint8_t Erase32kBCount = 0;
          while(SizeValue)
          {
            if (SizeValue > MEMORY_64KB_BLOCK_SIZE)
            {
              SizeValue -= MEMORY_64KB_BLOCK_SIZE;
              Erase64kBCount++;
            }
            else if (SizeValue > MEMORY_32KB_BLOCK_SIZE)
            {
              SizeValue = 0;
              Erase64kBCount++;
            }
            else
            {
              SizeValue = 0;
              Erase32kBCount = 1;
            }
          }
          
          for (uint16_t i = 0; i < Erase64kBCount; i++)
          {
            Memory_WhileNotReady();
            Memory_EraseBlock(SizeValue, MEMORY_64KB_BLOCK_ERASE);
            SizeValue += MEMORY_64KB_BLOCK_SIZE;
          }
          
          if (Erase32kBCount == 1)
          {
            Memory_WhileNotReady();
            Memory_EraseBlock(SizeValue, MEMORY_32KB_BLOCK_ERASE);
          }
        }
        
        USBPort_ClearStatus(USB_PORT_BUSY_TO_RECEIVE);
      }
    }
    
    if ((SystemStatus & STATUS_CONFIG_DOWNLOAD) != STATUS_CONFIG_DOWNLOAD)
    {
      if ((ADCStatus != 0) && (POTs != 0))
      {
        uint8_t ADCChnlCount = ADC_GetChnlCount();
      
        for (uint8_t chnl = 0; chnl < ADCChnlCount; chnl++)
        {
          if ((ADCStatus & POTs[chnl].Line) != 0)
          {
            ADCStatus &= ~POTs[chnl].Line;
            ADCLineHandler(ADC_GetValue(chnl), POTs[chnl].ConfigAdr);
          }
        }
      }
    
      if ((ButtonsStatus != 0) && (Buttons != 0))
      {
        uint8_t Count = Keys_GetButtonsCount();
      
        for (uint8_t i = 0; i < Count; i++)
        {
          if ((ButtonsStatus & Buttons[i].Line) != 0)
          {
            ButtonsStatus &= ~Buttons[i].Line;
            ButtonLineHandler(&Buttons[i]);
          }
        }
      }
    
      if ((SwitchesStatus != 0) && (Switches != 0))
      {
        uint8_t Count = Keys_GetSwitchesCount();
      
        for (uint8_t i = 0; i < Count; i++)
        {
          if ((SwitchesStatus & Switches[i].Line) != 0)
          {
            SwitchesStatus &= ~Switches[i].Line;
            SwitchLineHandler(Keys_GetSwitchLevel(i), Switches[i].ConfigAdr);
          }
        }
      }
    }
  }
}
//------------------------------------------------------------------------------
void RDC2_0051_Init()
{
  //HSI, PLL, 48 MHz
  FLASH->ACR = FLASH_ACR_PRFTBE | (uint32_t)FLASH_ACR_LATENCY;  
  //PLL frequency: (HSI / 2) * 12 = (8 / 2) * 12 = 48
  RCC->CFGR |= (uint32_t)(RCC_CFGR_PLLSRC_HSI_DIV2 | RCC_CFGR_PLLMUL12);
  RCC->CR |= RCC_CR_PLLON;
  while((RCC->CR & RCC_CR_PLLRDY) == 0);
 
  RCC->CFGR &= (uint32_t)((uint32_t)~(RCC_CFGR_SW));
  RCC->CFGR |= (uint32_t)RCC_CFGR_SW_PLL;
  while ((RCC->CFGR & (uint32_t)RCC_CFGR_SWS) != (uint32_t)RCC_CFGR_SWS_PLL);
  
  RCC->AHBENR |= RCC_AHBENR_GPIOAEN | RCC_AHBENR_GPIOBEN  | RCC_AHBENR_GPIOFEN;
  
  //DelayPreInit();
  DelayInit(DELAY_TIMER_BOOT_PSC, DELAY_TIMER_BOOT_ARR, DELAY_SYNC);
  Delay();
    
  Memory_Init();
  BootConfig();
  
  if (POTs != 0)
    ADC_Start();
  
  if ((Buttons != 0) || (Switches != 0))
    Keys_Enable();
    
  USBPort_Init();
}
//------------------------------------------------------------------------------
void ADCCallBack(uint16_t Status)
{
  ADCStatus |= Status;
}
//------------------------------------------------------------------------------
void ButtonsCallBack(uint16_t Status)
{
  ButtonsStatus |= Status;
}
//------------------------------------------------------------------------------
void SwitchesCallBack(uint16_t Status)
{
  SwitchesStatus |= Status;
}
//------------------------------------------------------------------------------
void ADCLineHandler(uint16_t ADCValue, uint32_t LineConfAdr)
{
  LineHandler(LINE_ADC, ADCValue, LineConfAdr);
}
//------------------------------------------------------------------------------
void ButtonLineHandler(ButtonType *ButtonPtr)
{
  LineHandler(LINE_BUTTON, ButtonPtr->Counter, ButtonPtr->ConfigAdr);
  
  ButtonPtr->Counter++;
  if (ButtonPtr->Counter == ButtonPtr->ValuesCount)
    ButtonPtr->Counter = 0;
}
//------------------------------------------------------------------------------
void SwitchLineHandler(uint8_t Value, uint32_t LineConfAdr)
{
  LineHandler(LINE_SWITCH, Value, LineConfAdr);
}
//------------------------------------------------------------------------------
void LineHandler(uint8_t LineType, uint16_t Value, uint32_t LineConfAdr)
{
  uint32_t MemoryAdr = LineConfAdr;
  Memory_Read(LINE_1DSP_CELL_CONF_SIZE_OFFSET, MemoryAdr, Transfer.Data);
  uint8_t DSPCellsCount = Transfer.Data[LINE_DSP_CELLS_COUNT_OFFEST];
  MemoryAdr += LINE_1DSP_CELL_CONF_SIZE_OFFSET;
  
  for (uint8_t cell = 0; cell < DSPCellsCount; cell++)
  {
    Memory_Read(LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_1PARAM_SIZE_OFFSET, MemoryAdr, Transfer.Data);
    uint32_t DSPCellConfSize = JoinBytesIntoValue(&Transfer.Data[0], LINE_DSP_CELL_CONF_SIZE_SIZE);
        
    DSPType DSP;
    DSPMethodsType DSPMethods;
    InitDSPStructs(&DSP, &DSPMethods, &Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE]);
    
    DSPMethods.InterfaceLinesEnable(DSP.InterfaceNum);
  
    if (DSPMethods.IsReady(&DSP) == DEVICE_READY)
    {
      DelayInit(DELAY_TIMER_DSP_PSC, DELAY_TIMER_DSP_ARR, DELAY_SYNC);
      
      uint16_t OneValueSize = (uint16_t)JoinBytesIntoValue(&Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_ONE_VALUE_SIZE_OFFSET], DSPCELL_ONE_VALUE_SIZE_SIZE);
      uint16_t ValueAddress = 0;
      
      switch(LineType)
      {
        case LINE_ADC:
          ValueAddress = OneValueSize * (Value / (ADC_MAX_VALUE / Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_VALUES_COUNT_OFFSET]));
        break;
        
        case LINE_BUTTON:
          {
            if (Value < Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_VALUES_COUNT_OFFSET])
              ValueAddress = OneValueSize * Value;
            else
              ValueAddress = (Value % Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_VALUES_COUNT_OFFSET]);
          }
        break;
        
        case LINE_SWITCH:
          ValueAddress = OneValueSize * Value;
        break;
          
        default:
        break;
      }
      
      uint16_t ParamCount = (uint16_t)JoinBytesIntoValue(&Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_PARAM_COUNT_OFFSET], DSPCELL_DSP_PARAM_COUNT_SIZE);
      
      if ((LineType == LINE_BUTTON)
       && (Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_BLOCK_ID1_OFFSET] == DSP_CELL_ANALOG_EN_ID)
       && (Value == 1))
      {
          ADCStatus = ADC_GetChnlMask();
      }
      else
      {
        if (Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_WRITE_TYPE_OFFSET] == DSP_SAFELOAD)
        {
          if (ParamCount > DSP.SafeLoadMax)
            Transfer.Size = DSP.SafeLoadMax;
          else
            Transfer.Size = ParamCount;
          
          Transfer.Address = JoinBytesIntoValue(&Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_1PARAM_ADR_OFFSET], DSPCELL_DSP_PARAM_ADR_SIZE);
          MemoryAdr += LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_1PARAM_ADR_OFFSET + \
                       ParamCount * DSPCELL_DSP_PARAM_CONF_MAP_SIZE + ValueAddress;
          
          while(ParamCount)
          {
            uint16_t SafeLoadBytes = Transfer.Size * DSP_PARAMETER_DATA_ADR_INCR;
            //Memory_Read(OneValueSize, MemoryAdr, Transfer.Data);
            Memory_Read(SafeLoadBytes, MemoryAdr, Transfer.Data);
        
            if (DSP.ID == DSP_IC_ADAU1701)
              ADAU1701_SafeLoad(&DSP, &DSPMethods, &Transfer);
            
            ParamCount -= Transfer.Size;
            if (ParamCount)
            {
              Transfer.Address += Transfer.Size;
              MemoryAdr += SafeLoadBytes;
              
              if (ParamCount > DSP.SafeLoadMax)
                Transfer.Size = DSP.SafeLoadMax;
              else
                Transfer.Size = ParamCount;
            }
          }
        }
        else
        {
          uint32_t ParamConfAdr = MemoryAdr + LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_1PARAM_ADR_OFFSET;
          uint32_t ParamDataAdr = MemoryAdr + LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_1PARAM_ADR_OFFSET + \
                       ParamCount * DSPCELL_DSP_PARAM_CONF_MAP_SIZE + ValueAddress;
          
          for (uint16_t param = 0; param < ParamCount; param++)
          {
            Memory_Read(DSPCELL_DSP_PARAM_CONF_MAP_SIZE, ParamConfAdr, Transfer.Data);
            
            Transfer.Address = JoinBytesIntoValue(&Transfer.Data[0], DSPCELL_DSP_PARAM_ADR_SIZE);
            Transfer.Size = Transfer.Data[DSPCELL_DSP_PARAM_ADR_SIZE];
            uint16_t DataSize = Transfer.Data[DSPCELL_DSP_PARAM_ADR_SIZE];
            Memory_Read(DataSize, ParamDataAdr, Transfer.Data);
                        
            DSPMethods.Write(&DSP, &Transfer);
            
            ParamConfAdr += DSPCELL_DSP_PARAM_CONF_MAP_SIZE;
            ParamDataAdr += DataSize;
          }
        }
      }
    }
    else
      ErrorHandler(DSP_DISCONNECTED);
  
    DSPMethods.InterfaceLinesDisable(DSP.InterfaceNum);
    
    MemoryAdr += LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCellConfSize;
  }
}
//------------------------------------------------------------------------------
void BootConfig()
{
  uint8_t BootSize[BOOT_IMAGE_SIZE_SIZE];
  Memory_Read(BOOT_IMAGE_SIZE_SIZE, BOOT_IMAGE_SIZE_OFFSET, BootSize);
  uint32_t SizeValue = JoinBytesIntoValue(BootSize, BOOT_IMAGE_SIZE_SIZE);
  if (SizeValue != 0xFFFFFFFF)
  {
    BootControllerConfig();
    Memory_Read(MEMORY_MAP_TABLE_SIZE_SIZE, MEMORY_MAP_TABLE_SIZE_OFFSET, BootSize);
    SizeValue = JoinBytesIntoValue(BootSize, MEMORY_MAP_TABLE_SIZE_SIZE);
    SizeValue += FIRST_BLOCK_CONF_MAP_OFFSET - CONTROLLER_CONF_ADR_SIZE - CONTROLLER_CONF_SIZE_SIZE;
    
    uint16_t BlockMapAdr = FIRST_BLOCK_CONF_MAP_OFFSET;
    while(BlockMapAdr < SizeValue)
    {
      uint8_t BlockConfigMap[BLOCK_CONF_MAP_SIZE];
      Memory_Read(BLOCK_CONF_MAP_SIZE, BlockMapAdr, BlockConfigMap);
     
      switch(BlockConfigMap[BLOCK_ID_OFFSET])
      {
        case REGULATION_LINE_BLOCK:
          BootLineConfig(BlockConfigMap);
        break;
        
        case DSP_BOOT_BLOCK:
          BootDSPConfig(BlockConfigMap);
        break;
        
        default:
        break;
      }
      
      BlockMapAdr += BLOCK_CONF_MAP_SIZE;
    }
  }
}
//------------------------------------------------------------------------------
void BootControllerConfig()
{
  uint8_t CtrlConfigMap[CONTROLLER_CONF_MAP_SIZE];
  Memory_Read(CONTROLLER_CONF_MAP_SIZE, CONTROLLER_CONF_ADR_OFFSET, CtrlConfigMap);
  uint16_t ConfigAddress = (uint16_t)JoinBytesIntoValue(CtrlConfigMap, CONTROLLER_CONF_ADR_SIZE);
  uint16_t ConfigSize = (uint16_t)JoinBytesIntoValue(&CtrlConfigMap[CONTROLLER_CONF_ADR_SIZE], CONTROLLER_CONF_SIZE_SIZE);
  
  uint8_t *CtrlConfig = malloc(ConfigSize);
  if (!CtrlConfig)
    ErrorHandler(MALLOC_ERROR);
  
  Memory_Read(ConfigSize, ConfigAddress, CtrlConfig);
  
  if (CtrlConfig[CONTROLLER_ID_OFFSET] != RDC2_0051_ID)
    ErrorHandler(CONTROLLER_ID_ERROR);
  
  uint16_t ADCLinesMask = 0;
  uint16_t ButtonLinesMask = 0;
  uint16_t SwitchLinesMask = 0;
  IOLines_Init(&CtrlConfig[CONTROLLER_GPIO_CONF_OFFSET], &ADCLinesMask, &ButtonLinesMask, &SwitchLinesMask);
  
  if ((CtrlConfig[CONTROLLER_GPIO_CONF_OFFSET + LINES_GPIO_INTERFACE_I2C_OFFSET] != LINE_NOT_ACTIVE)
   || (CtrlConfig[CONTROLLER_GPIO_CONF_OFFSET + LINES_DSP_INTERFACE_I2C_OFFSET] != LINE_NOT_ACTIVE))
    I2C_DSP_Init();
  
  free(CtrlConfig);
  
  if (ADCLinesMask != 0)
  {
    ADC_Init(ADCLinesMask, ADCCallBack);
    uint8_t ADCChnlCount = ADC_GetChnlCount();
    POTs = malloc(ADCChnlCount * sizeof(*POTs));
    if (!POTs)
      ErrorHandler(MALLOC_ERROR);
    
    for (uint8_t chnl = 0; chnl < ADCChnlCount; chnl++)
    {
      POTs[chnl].Line = ADC_GetChnlLine(chnl);
    }
  }
  
  if ((ButtonLinesMask != 0) || (SwitchLinesMask != 0))
  {
    Keys_Init(ButtonLinesMask, ButtonsCallBack, SwitchLinesMask, SwitchesCallBack);
    uint8_t Count = 0;
    
    if (ButtonLinesMask != 0)
    {
      Count = Keys_GetButtonsCount();
      Buttons = malloc(Count * sizeof(*Buttons));
      if (!Buttons)
        ErrorHandler(MALLOC_ERROR);
    
      for (uint8_t i = 0; i < Count; i++)
      {
        Buttons[i].Line = Keys_GetButtonLine(i);
        Buttons[i].Counter = 0;
      }
    }
    
    if (SwitchLinesMask != 0)
    {
      Count = Keys_GetSwitchesCount();
      Switches = malloc(Count * sizeof(*Switches));
      if (!Switches)
        ErrorHandler(MALLOC_ERROR);
      
      for (uint8_t i = 0; i < Count; i++)
        Switches[i].Line = Keys_GetSwitchLine(i);
    }
  }
}
//------------------------------------------------------------------------------
void BootDSPConfig(uint8_t *ConfigMap)
{
  uint32_t MemoryAdr = JoinBytesIntoValue(&ConfigMap[BLOCK_CONF_ADR_OFFSET], BLOCK_CONF_ADR_SIZE);
  //uint16_t ConfigSize = (uint16_t)JoinBytesIntoValue(&ConfigMap[BLOCK_CONF_SIZE_OFFSET], BLOCK_CONF_SIZE_SIZE);
  
  Memory_Read(DSP_FIRST_OPER_DESC_OFFSET, MemoryAdr, Transfer.Data);
  
  uint8_t BootOperCount = Transfer.Data[DSP_OPERATIONS_COUNT_OFFSET];
  DSPType DSP;
  DSPMethodsType DSPMethods;
  InitDSPStructs(&DSP, &DSPMethods, Transfer.Data);
  
  DSPMethods.InterfaceLinesEnable(DSP.InterfaceNum);
  
  if (DSPMethods.IsReady(&DSP) == DEVICE_READY)
  {
    DelayInit(DELAY_TIMER_DSP_PSC, DELAY_TIMER_DSP_ARR, DELAY_SYNC);
    
    MemoryAdr += DSP_FIRST_OPER_DESC_OFFSET;
    for (uint8_t i = 0; i < BootOperCount; i++)
    {
      uint8_t OperDescriptor[DSP_OPER_DATA_OFFSET];
      Memory_Read(DSP_OPER_DATA_OFFSET, MemoryAdr, OperDescriptor);
      Transfer.Address = JoinBytesIntoValue(&OperDescriptor[DSP_OPER_ADR_OFFSET], DSP_OPER_ADR_SIZE);
      uint16_t TxSize = (uint16_t)JoinBytesIntoValue(&OperDescriptor[DSP_OPER_DATA_SIZE_OFFSET], DSP_OPER_DATA_SIZE_SIZE);
      Transfer.Size = TxSize;
      
      if (OperDescriptor[DSP_OPER_ADR_INCR_OFFSET] == DSP_REGISTER_DATA_ADR_INCR)
      {
        MemoryAdr += DSP_OPER_DATA_OFFSET;
        
        if (OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_WRITE)
          Memory_Read(Transfer.Size, MemoryAdr, Transfer.Data);
        else if (OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_CLEAR)
          memset(Transfer.Data, 0, Transfer.Size);
        
        if ((OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_WRITE)
         || (OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_CLEAR))
        {
          DSPMethods.Write(&DSP, &Transfer);
          Delay();
        }
        
        MemoryAdr += TxSize;
      }
      else //if (OperDescriptor[DSP_OPER_ADR_INCR_OFFSET] == DSP_PARAMETER_DATA_ADR_INCR or DSP_PROGRAM_DATA_ADR_INCR)
      {
        uint16_t WriteCount = Transfer.Size / OperDescriptor[DSP_OPER_ADR_INCR_OFFSET];
        Transfer.Size = OperDescriptor[DSP_OPER_ADR_INCR_OFFSET];
        
        if (OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_CLEAR)
          memset(Transfer.Data, 0, Transfer.Size);
        
        MemoryAdr += DSP_OPER_DATA_OFFSET;
        
        for (uint16_t j = 0; j < WriteCount; j++)
        {
          if (OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_WRITE)
            Memory_Read(Transfer.Size, MemoryAdr, Transfer.Data);
          
          if ((OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_WRITE)
           || (OperDescriptor[DSP_OPER_ID_OFFSET] == DSP_CLEAR))
          {
            DSPMethods.Write(&DSP, &Transfer);
            Delay();
          }
          
          Transfer.Size = OperDescriptor[DSP_OPER_ADR_INCR_OFFSET];
          MemoryAdr += OperDescriptor[DSP_OPER_ADR_INCR_OFFSET];
          Transfer.Address++;
        }
      }
    }
  }
  else
    ErrorHandler(DSP_DISCONNECTED);
  
  DSPMethods.InterfaceLinesDisable(DSP.InterfaceNum);
}
//------------------------------------------------------------------------------
void BootLineConfig(uint8_t *ConfigMap)
{
  Transfer.Address = JoinBytesIntoValue(&ConfigMap[BLOCK_CONF_ADR_OFFSET], BLOCK_CONF_ADR_SIZE);
  Memory_Read(LINE_FUNC_BLOCK_ID1_OFFEST, Transfer.Address, Transfer.Data);
  
  uint8_t Count = ADC_GetChnlCount();
  for (uint8_t chnl = 0; chnl < Count; chnl++)
  {
    if (1 << (Transfer.Data[LINE_GPIO_NUM_OFFSET]) == POTs[chnl].Line)
    {
      POTs[chnl].ConfigAdr = Transfer.Address;
      return;
    }
  }
  
  Count = Keys_GetButtonsCount();
  for (uint8_t i = 0; i < Count; i++)
  {
    if (1 << (Transfer.Data[LINE_GPIO_NUM_OFFSET]) == Buttons[i].Line)
    {
      Buttons[i].ConfigAdr = Transfer.Address;
      uint32_t MemoryAdr = Transfer.Address;
      Memory_Read(LINE_1DSP_CELL_CONF_SIZE_OFFSET, MemoryAdr, Transfer.Data);
  
      uint8_t DSPCellsCount = Transfer.Data[LINE_DSP_CELLS_COUNT_OFFEST];
      
      MemoryAdr += LINE_1DSP_CELL_CONF_SIZE_OFFSET;
      Buttons[i].ValuesCount = 0;
      
      for (uint8_t cell = 0; cell < DSPCellsCount; cell++)
      {
        Memory_Read(LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_DSP_PARAM_COUNT_OFFSET, MemoryAdr, Transfer.Data);
        uint32_t DSPCellConfSize = JoinBytesIntoValue(&Transfer.Data[0], LINE_DSP_CELL_CONF_SIZE_SIZE);
        
        if (Buttons[i].ValuesCount < Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_VALUES_COUNT_OFFSET])
          Buttons[i].ValuesCount = Transfer.Data[LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCELL_VALUES_COUNT_OFFSET];
        
         MemoryAdr += LINE_DSP_CELL_CONF_SIZE_SIZE + DSPCellConfSize;
      }
            
      return;
    }
  }
  
  Count = Keys_GetSwitchesCount();
  for (uint8_t i = 0; i < Count; i++)
  {
    if (1 << (Transfer.Data[LINE_GPIO_NUM_OFFSET]) == Switches[i].Line)
    {
      Switches[i].ConfigAdr = Transfer.Address;
      return;
    }
  }
}
//------------------------------------------------------------------------------
uint32_t JoinBytesIntoValue(uint8_t *Data, uint8_t Size)
{
  uint32_t Result = 0;
  
  for (uint8_t i = 0; i < Size; i++)
    Result |= (*(Data + i)) << (i * 8);
  
  return Result;
}
//------------------------------------------------------------------------------
void MemTransferUpdate(uint8_t *Data)
{
  uint16_t CurSize = Transfer.Size;
  for (uint8_t i = 0; i < Data[USB_DATA_SIZE_OFFSET]; i++)
    Transfer.Data[CurSize + i] = Data[USB_DATA_DATA_OFFSET + i];
          
  Transfer.Size += Data[USB_DATA_SIZE_OFFSET];
}
//------------------------------------------------------------------------------
void ErrorHandler(uint8_t ErrorCode)
{
  for(;;);
}

