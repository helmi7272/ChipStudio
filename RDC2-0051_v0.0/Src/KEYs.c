/*
********************************************************************************
* COPYRIGHT(c) ЗАО «ЧИП и ДИП», 2019, 2020
* 
* Программное обеспечение предоставляется на условиях «как есть» (as is).
* При распространении указание автора обязательно.
********************************************************************************
*/


#include "KEYs.h"



static void (*ButtonsPressed)(uint16_t);
static void (*SwitchesLevelChanged)(uint16_t);
static uint16_t SwitchesLevels = 0;
static uint8_t ButtonsCount = 0;
static uint8_t KeysCount = 0;
static KeyType *Keys;


void TIM17_IRQHandler(void)
{
  KEY_SCAN_TIMER->SR = 0;
  
  uint16_t ButtonsStatus = 0;
  uint16_t SwitchesStatus = 0;
  
  for(uint8_t i = 0; i < KeysCount; i++)
  {
    if (Keys[i].State == KEY_LEVEL_CHANGE_PENDING)     
    {
      Keys[i].Counter++;
      
      if (Keys[i].Counter == KEYS_DEBOUNCE_TIME)
      {
        uint8_t NewLevel = GetKeyLevel(i);
        
        if (Keys[i].Level != NewLevel)
        {
          if (i < ButtonsCount)
          {
            if (NewLevel == KEY_PRESSED_LEVEL)
              ButtonsStatus |= Keys[i].Line;
          }
          else
          {
            SwitchesStatus |= Keys[i].Line;
            if (NewLevel == 0)
              SwitchesLevels &= ~Keys[i].Line;
            else
              SwitchesLevels |= Keys[i].Line;
          }
        }
        
        Keys[i].State = 0;
        Keys[i].Counter = 0;
        Keys[i].Level = NewLevel;
      }
    }
    
    else if (Keys[i].Level != GetKeyLevel(i))
      Keys[i].State = KEY_LEVEL_CHANGE_PENDING;
  }
  
  if (ButtonsStatus != 0)
    ButtonsPressed(ButtonsStatus);
  
  if (SwitchesStatus != 0)
    SwitchesLevelChanged(SwitchesStatus);
}
//------------------------------------------------------------------------------
void Keys_Init(uint16_t ButtonMask, void (*ButtonsPressedCallback)(uint16_t),
               uint16_t SwitchesMask, void (*SwitchesLevelChangedCallback)(uint16_t))
{ 
  uint16_t SwitchesCount = 0;
  for (uint8_t line = 0; line < LINES_GPIO_INTERFACE_OFFSET; line++)
  {
    if ((ButtonMask & (1 << line)) != 0)
      ButtonsCount++;
    else if ((SwitchesMask & (1 << line)) != 0)
      SwitchesCount++;
  }
  
  KeysCount = ButtonsCount + SwitchesCount;
  Keys = malloc(KeysCount * sizeof(*Keys));
  if (!Keys)
    ErrorHandler(MALLOC_ERROR);
  
  //в Keys сначала расположены кнопки в количестве ButtonsCount,
  //затем переключатели в количестве SwitchesCount
  for (uint8_t i = 0; i < ButtonsCount; i++)
  {
    uint8_t Offset = 0;
    while((ButtonMask & (1 << Offset)) == 0)
      Offset++;
        
    Keys[i].Line = 1 << Offset;
    Keys[i].Pin = LINES_PINS[Offset];
    Keys[i].GPIO = IOLines_GetLineGPIO(Offset);
    Keys[i].State = 0;
    Keys[i].Counter = 0;
    Keys[i].Level = GetKeyLevel(i);
    ButtonMask &= ~Keys[i].Line;
  }
  
  for (uint8_t i = 0; i < SwitchesCount; i++)
  {
    uint8_t Offset = 0;
    while((SwitchesMask & (1 << Offset)) == 0)
      Offset++;
    
    uint8_t index = ButtonsCount + i;
    
    Keys[index].Line = 1 << Offset;
    Keys[index].Pin = LINES_PINS[Offset];
    Keys[index].GPIO = IOLines_GetLineGPIO(Offset);
    Keys[index].State = KEY_LEVEL_CHANGE_PENDING;
    Keys[index].Counter = KEYS_DEBOUNCE_TIME - 1;
    Keys[index].Level = SWITCH_THIRD_LEVEL;
    SwitchesMask &= ~Keys[index].Line;
  }
  
  //таймер, период 1 мс
  RCC->KEY_SCAN_TIMER_ENR |= KEY_SCAN_TIMER_CLK_EN;
  KEY_SCAN_TIMER->PSC = KEY_SCAN_TIMER_PSC;
  KEY_SCAN_TIMER->ARR = KEY_SCAN_TIMER_ARR;
  KEY_SCAN_TIMER->DIER = TIM_DIER_UIE;  
  NVIC_EnableIRQ(KEY_SCAN_TIMER_IRQ);
  NVIC_SetPriority(KEY_SCAN_TIMER_IRQ, 2);
  
  ButtonsPressed = ButtonsPressedCallback;
  SwitchesLevelChanged = SwitchesLevelChangedCallback;
}
//------------------------------------------------------------------------------
uint8_t GetKeyLevel(uint8_t KeyNum)
{
  return ((Keys[KeyNum].GPIO->IDR & (1 << Keys[KeyNum].Pin)) >> Keys[KeyNum].Pin);
}
//------------------------------------------------------------------------------
void Keys_Enable()
{
  KEY_SCAN_TIMER->CR1 |= TIM_CR1_CEN;
}
//------------------------------------------------------------------------------
uint8_t Keys_GetButtonsCount()
{
  return ButtonsCount;
}
//------------------------------------------------------------------------------
uint8_t Keys_GetSwitchesCount()
{
  return (KeysCount - ButtonsCount);
}
//------------------------------------------------------------------------------
uint16_t Keys_GetButtonLine(uint8_t ButtonNum)
{
  return Keys[ButtonNum].Line;
}
//------------------------------------------------------------------------------
uint16_t Keys_GetSwitchLine(uint8_t SwitchNum)
{
  return Keys[ButtonsCount + SwitchNum].Line;
}
//------------------------------------------------------------------------------
uint8_t Keys_GetSwitchLevel(uint8_t SwitchNum)
{
  if ((SwitchesLevels & Keys[ButtonsCount + SwitchNum].Line) == 0)
    return 0;
  else
    return 1;
}
