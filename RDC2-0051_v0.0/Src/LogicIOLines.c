/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#include "LogicIOLines.h"



const uint8_t LINES_PINS[] = 
{
  LINE_0_GPIO_PIN, LINE_1_GPIO_PIN, LINE_2_GPIO_PIN, LINE_3_GPIO_PIN, LINE_4_GPIO_PIN,
  LINE_5_GPIO_PIN, LINE_6_GPIO_PIN, LINE_7_GPIO_PIN, LINE_8_GPIO_PIN, LINE_9_GPIO_PIN,
  LINE_10_RESISTOR_PIN, LINE_11_RESISTOR_PIN, LINE_12_KEY_PIN, LINE_13_KEY_PIN,
};

const uint8_t LINES_0_4_5_FUNC[] =
{
  LINE_NOT_ACTIVE, LINE_BUTTON, LINE_SWITCH, LINE_ADC, LINE_CS,
};

const uint8_t LINES_1_2_3_FUNC[] =
{
  LINE_NOT_ACTIVE, LINE_BUTTON, LINE_SWITCH, LINE_ADC, LINE_AF,
};

const uint8_t LINES_6_7_FUNC[] =
{
  LINE_NOT_ACTIVE, LINE_BUTTON, LINE_SWITCH, LINE_AF, LINE_CS,
};

const uint8_t LINES_8_9_FUNC[] =
{
  LINE_NOT_ACTIVE, LINE_BUTTON, LINE_SWITCH, LINE_CS,
};



void IOLines_Init(uint8_t *Config, uint16_t *ADCLines, uint16_t *KeyLines, uint16_t *SwitchLines)
{
  for (uint8_t line = 0; line < LINES_GPIO_INTERFACE_OFFSET; line++)
  {
    //DEbug!!!!!!!!!!!!!!!!!!!!!
    //IOLines_DeInitLine(line);
    
    if (Config[line] != LINE_NOT_ACTIVE)
    {
      uint8_t function = IOLines_GetLineFunction(line, Config[line]);
      IOLines_InitLine(line, function);
      
      switch(function)
      {
        case LINE_BUTTON:
          *KeyLines |= 1 << line;
        break;
        
        case LINE_SWITCH:
          *SwitchLines |= 1 << line;
        break;
        
        case LINE_ADC:
          *ADCLines |= 1 << line;
        break;
        
        default:
        break;
      }
    }
  }
  
  if (Config[LINES_DSP_INTERFACE_I2C_OFFSET] != LINE_NOT_ACTIVE) //DSP I2C Interface
  {
    DSP_I2C_GPIO->OTYPER |= (1 << DSP_I2C_SCL_PIN) | (1 << DSP_I2C_SDA_PIN);
    DSP_I2C_GPIO->AFR[0] |= (DSP_I2C_AF << (4 * DSP_I2C_SCL_PIN)) | (DSP_I2C_AF << (4 * DSP_I2C_SDA_PIN));
  }
  
  if (Config[LINES_DSP_INTERFACE_CS_OFFSET] != LINE_NOT_ACTIVE) //DSP CS line
    SPI_DSP_NSS_GPIO->MODER |= (1 << (2 * SPI_DSP_NSS_PIN));
}
//------------------------------------------------------------------------------
void IOLines_SetOutputLevel(uint8_t Line, uint8_t Level)
{
  if ((Line < LINES_GPIO_COUNT) || (Line == LINES_DSP_INTERFACE_CS_OFFSET))
  {
    GPIO_TypeDef *LineGPIO = IOLines_GetLineGPIO(Line);
    uint8_t LinePin = SPI_DSP_NSS_PIN;
    
    if (Line < LINES_GPIO_COUNT)
      LinePin = LINES_PINS[Line];
    
    if (Level == OUT_LEVEL_LOW)
      LineGPIO->ODR &= ~(1 << LinePin);
    else if (Level == OUT_LEVEL_HIGH)
      LineGPIO->ODR |=  (1 << LinePin);
  }
}
//------------------------------------------------------------------------------
void ActivateI2CLines(uint8_t InterfaceNum)
{
  if (InterfaceNum == DSP_I2C_INTERFACE)
    DSP_I2C_GPIO->MODER |= (2 << (2 * DSP_I2C_SCL_PIN)) | (2 << (2 * DSP_I2C_SDA_PIN));
  else if (InterfaceNum == GPIO_I2C_INTERFACE)
    GPIO_I2C_GPIO->MODER |= (2 << (2 * GPIO_I2C_SCL_PIN)) | (2 << (2 * GPIO_I2C_SDA_PIN));
}
//------------------------------------------------------------------------------
void DeActivateI2CLines(uint8_t InterfaceNum)
{
  if (InterfaceNum == DSP_I2C_INTERFACE)
    DSP_I2C_GPIO->MODER &= ~((3 << (2 * DSP_I2C_SCL_PIN)) | (3 << (2 * DSP_I2C_SDA_PIN)));
  else if (InterfaceNum == GPIO_I2C_INTERFACE)
    GPIO_I2C_GPIO->MODER &= ~((3 << (2 * GPIO_I2C_SCL_PIN)) | (3 << (2 * GPIO_I2C_SDA_PIN)));
}
//------------------------------------------------------------------------------
void IOLines_InitLine(uint8_t Line, uint8_t Function)
{
  GPIO_TypeDef *LineGPIO = IOLines_GetLineGPIO(Line);
  
  switch(Function)
  {
    case LINE_ADC:
      LineGPIO->MODER |= (3 << (2 * LINES_PINS[Line]));
    break;
    
    case LINE_CS:
      LineGPIO->MODER |= (1 << (2 * LINES_PINS[Line]));
      LineGPIO->ODR |= (1 << LINES_PINS[Line]);
    break;
    
    case LINE_AF:
      if ((Line == 1) || (Line == 2) || (Line == 3)) //SPI
        LineGPIO->OSPEEDR |= (1 << (2 * LINES_PINS[Line])); //SPI AF = 0
      else if ((Line == 6) || (Line == 7)) //I2C
      {
        LineGPIO->OTYPER |= (1 << LINES_PINS[Line]);
        LineGPIO->AFR[1] |= (GPIO_I2C_AF << (4 * (LINES_PINS[Line] - 8)));
      }
    break;
    
    default:
    break;
  }
}
//------------------------------------------------------------------------------
uint8_t IOLines_GetLineFunction(uint8_t Line, uint8_t LineConfig)
{
  if ((Line == 0) || (Line == 4) || (Line == 5))
    return LINES_0_4_5_FUNC[LineConfig];
  else if ((Line == 1) || (Line == 2) || (Line == 3))
    return LINES_1_2_3_FUNC[LineConfig];
  else if ((Line == 6) || (Line == 7))
    return LINES_6_7_FUNC[LineConfig];
  else if ((Line == 8) || (Line == 9))
    return LINES_8_9_FUNC[LineConfig];
  else if (LineConfig != LINE_NOT_ACTIVE)
  {
    if ((Line == 10) || (Line == 11))
      return LINE_ADC;
    else if ((Line == 12) || (Line == 13))
      return LINE_BUTTON;
  }
  
  return LINE_NOT_ACTIVE;
}
//------------------------------------------------------------------------------
void IOLines_DeInitLine(uint8_t Line)
{
  GPIO_TypeDef *LineGPIO = IOLines_GetLineGPIO(Line);
  
  LineGPIO->MODER &= ~(3 << (2 * LINES_PINS[Line]));
  LineGPIO->PUPDR &= ~(3 << (2 * LINES_PINS[Line]));
}
//------------------------------------------------------------------------------
GPIO_TypeDef* IOLines_GetLineGPIO(uint8_t Line)
{
  GPIO_TypeDef *LineGPIO = GPIOA;
  
  if ((Line == 4) || (Line == 5))
    LineGPIO = GPIOB;
  
  return LineGPIO;
}


