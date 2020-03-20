/*
********************************************************************************
* COPYRIGHT(c) ��� ���� � ��ϻ, 2020
* 
* ����������� ����������� ��������������� �� �������� ���� ����� (as is).
* ��� ��������������� �������� ������ �����������.
********************************************************************************
*/


#ifndef __MEMORY_MAP_H
#define __MEMORY_MAP_H


#include "Board.h"


#define   BLOCK_CONFIGURATION_SIZE         2
#define   ID_SIZE                          1
#define   ADDRESS_IN_DSP_SIZE              4

//MEMORY_MAP_TABLE
#define   BOOT_START_ADDRESS               0
#define   BOOT_IMAGE_SIZE_OFFSET           BOOT_START_ADDRESS
#define   BOOT_IMAGE_SIZE_SIZE             4
#define   BOOT_IMAGE_MAKER_VER_OFFSET      (BOOT_IMAGE_SIZE_OFFSET + BOOT_IMAGE_SIZE_SIZE)
#define   BOOT_IMAGE_MAKER_VER_SIZE        2
#define   MEMORY_MAP_TABLE_SIZE_OFFSET     (BOOT_IMAGE_MAKER_VER_OFFSET + BOOT_IMAGE_MAKER_VER_SIZE)
#define   MEMORY_MAP_TABLE_SIZE_SIZE       2
#define   CONTROLLER_CONF_ADR_OFFSET       (MEMORY_MAP_TABLE_SIZE_OFFSET + MEMORY_MAP_TABLE_SIZE_SIZE)
#define   CONTROLLER_CONF_ADR_SIZE         2
#define   CONTROLLER_CONF_SIZE_OFFSET      (CONTROLLER_CONF_ADR_OFFSET + CONTROLLER_CONF_ADR_SIZE)
#define   CONTROLLER_CONF_SIZE_SIZE        BLOCK_CONFIGURATION_SIZE
#define   FIRST_BLOCK_CONF_MAP_OFFSET      (CONTROLLER_CONF_SIZE_OFFSET + CONTROLLER_CONF_SIZE_SIZE)
#define   CONTROLLER_CONF_MAP_SIZE         (CONTROLLER_CONF_ADR_SIZE + CONTROLLER_CONF_SIZE_SIZE)

//BLOCK_CONFIGURATION_MAP
#define   BLOCK_ID_OFFSET                  0
#define   BLOCK_ID_SIZE                    ID_SIZE
#define   BLOCK_CONF_ADR_OFFSET            (BLOCK_ID_OFFSET + BLOCK_ID_SIZE)
#define   BLOCK_CONF_ADR_SIZE              4
#define   BLOCK_CONF_SIZE_OFFSET           (BLOCK_CONF_ADR_OFFSET + BLOCK_CONF_ADR_SIZE)
#define   BLOCK_CONF_SIZE_SIZE             BLOCK_CONFIGURATION_SIZE
#define   BLOCK_CONF_MAP_SIZE              (BLOCK_ID_SIZE + BLOCK_CONF_ADR_SIZE + BLOCK_CONF_SIZE_SIZE)

//CONTROLLER_CONFIGURATION
#define   CONTROLLER_ID_OFFSET             0
#define   CONTROLLER_ID_SIZE               ID_SIZE
#define   CONTROLLER_GPIO_CONF_OFFSET      (CONTROLLER_ID_OFFSET + CONTROLLER_ID_SIZE)

//DSP_BOOT_CONFIGURATION
#define   DSP_ID_OFFSET                    0
#define   DSP_ID_SIZE                      ID_SIZE
#define   DSP_BUS_ADR_OFFSET               (DSP_ID_OFFSET + DSP_ID_SIZE)
#define   DSP_BUS_ADR_SIZE                 1
#define   DSP_CS_GPIO_NUM_OFFSET           (DSP_BUS_ADR_OFFSET + DSP_BUS_ADR_SIZE)
#define   DSP_CS_GPIO_NUM_SIZE             1
#define   DSP_INTERFACE_TYPE_OFFSET        (DSP_CS_GPIO_NUM_OFFSET + DSP_CS_GPIO_NUM_SIZE)
#define   DSP_INTERFACE_TYPE_SIZE          1
#define   DSP_INTERFACE_NUM_OFFSET         (DSP_INTERFACE_TYPE_OFFSET + DSP_INTERFACE_TYPE_SIZE)
#define   DSP_INTERFACE_NUM_SIZE           1
#define   DSP_OPERATIONS_COUNT_OFFSET      (DSP_INTERFACE_NUM_OFFSET + DSP_INTERFACE_NUM_SIZE)
#define   DSP_OPERATIONS_COUNT_SIZE        1
#define   DSP_FIRST_OPER_DESC_OFFSET       (DSP_OPERATIONS_COUNT_OFFSET + DSP_OPERATIONS_COUNT_SIZE)
#define   DSP_DESCRIPTOR_SIZE              DSP_OPERATIONS_COUNT_OFFSET

//DSP_OPERATION_DESCRIPTOR
#define   DSP_OPER_ID_OFFSET               0
#define   DSP_OPER_ID_SIZE                 ID_SIZE
#define   DSP_OPER_ADR_OFFSET              (DSP_OPER_ID_OFFSET + DSP_OPER_ID_SIZE)
#define   DSP_OPER_ADR_SIZE                ADDRESS_IN_DSP_SIZE
#define   DSP_OPER_ADR_INCR_OFFSET         (DSP_OPER_ADR_OFFSET + DSP_OPER_ADR_SIZE)
#define   DSP_OPER_ADR_INCR_SIZE           1
#define   DSP_OPER_DATA_SIZE_OFFSET        (DSP_OPER_ADR_INCR_OFFSET + DSP_OPER_ADR_INCR_SIZE)
#define   DSP_OPER_DATA_SIZE_SIZE          2
#define   DSP_OPER_DATA_OFFSET             (DSP_OPER_DATA_SIZE_OFFSET + DSP_OPER_DATA_SIZE_SIZE)

//REGULATION_LINE_CONFIGURATION
#define   LINE_ID_OFFSET                   0
#define   LINE_ID_SIZE                     ID_SIZE
#define   LINE_GPIO_NUM_OFFSET             (LINE_ID_OFFSET + LINE_ID_SIZE)
#define   LINE_GPIO_NUM_SIZE               1
#define   LINE_FUNC_BLOCK_ID1_OFFEST       (LINE_GPIO_NUM_OFFSET + LINE_GPIO_NUM_SIZE)
#define   LINE_FUNC_BLOCK_ID1_SIZE         ID_SIZE
#define   LINE_FUNC_BLOCK_ID2_OFFEST       (LINE_FUNC_BLOCK_ID1_OFFEST + LINE_FUNC_BLOCK_ID1_SIZE)
#define   LINE_FUNC_BLOCK_ID2_SIZE         ID_SIZE
#define   LINE_DSP_CELLS_COUNT_OFFEST      (LINE_FUNC_BLOCK_ID2_OFFEST + LINE_FUNC_BLOCK_ID2_SIZE)
#define   LINE_DSP_CELLS_COUNT_SIZE        1
#define   LINE_1DSP_CELL_CONF_SIZE_OFFSET  (LINE_DSP_CELLS_COUNT_OFFEST + LINE_DSP_CELLS_COUNT_SIZE)
#define   LINE_DSP_CELL_CONF_SIZE_SIZE     3
#define   LINE_1DSP_CELL_CONF_OFFSET       (LINE_1DSP_CELL_CONF_SIZE_OFFSET + LINE_DSP_CELL_CONF_SIZE_SIZE)

//DSP_CELL_CONFIGURATION
#define   DSPCELL_DSP_DESCRIPTOR_OFFSET    0
#define   DSPCELL_DSP_DESCRIPTOR_SIZE      DSP_DESCRIPTOR_SIZE
#define   DSPCELL_BLOCK_ID1_OFFSET         (DSPCELL_DSP_DESCRIPTOR_OFFSET + DSPCELL_DSP_DESCRIPTOR_SIZE)
#define   DSPCELL_BLOCK_ID1_SIZE           ID_SIZE
#define   DSPCELL_BLOCK_ID2_OFFSET         (DSPCELL_BLOCK_ID1_OFFSET + DSPCELL_BLOCK_ID1_SIZE)
#define   DSPCELL_BLOCK_ID2_SIZE           ID_SIZE
#define   DSPCELL_RESERVE_OFFSET           (DSPCELL_BLOCK_ID2_OFFSET + DSPCELL_BLOCK_ID2_SIZE)
#define   DSPCELL_RESERVE_SIZE             8
#define   DSPCELL_WRITE_TYPE_OFFSET        (DSPCELL_RESERVE_OFFSET + DSPCELL_RESERVE_SIZE)
#define   DSPCELL_WRITE_TYPE_SIZE          1
#define   DSPCELL_ONE_VALUE_SIZE_OFFSET    (DSPCELL_WRITE_TYPE_OFFSET + DSPCELL_WRITE_TYPE_SIZE)
#define   DSPCELL_ONE_VALUE_SIZE_SIZE      2
#define   DSPCELL_VALUES_COUNT_OFFSET      (DSPCELL_ONE_VALUE_SIZE_OFFSET + DSPCELL_ONE_VALUE_SIZE_SIZE)
#define   DSPCELL_VALUES_COUNT_SIZE        1
#define   DSPCELL_DSP_PARAM_COUNT_OFFSET   (DSPCELL_VALUES_COUNT_OFFSET + DSPCELL_VALUES_COUNT_SIZE)
#define   DSPCELL_DSP_PARAM_COUNT_SIZE     2
#define   DSPCELL_DSP_1PARAM_ADR_OFFSET    (DSPCELL_DSP_PARAM_COUNT_OFFSET + DSPCELL_DSP_PARAM_COUNT_SIZE)
#define   DSPCELL_DSP_PARAM_ADR_SIZE       4
#define   DSPCELL_DSP_1PARAM_SIZE_OFFSET   (DSPCELL_DSP_1PARAM_ADR_OFFSET + DSPCELL_DSP_PARAM_ADR_SIZE)
#define   DSPCELL_DSP_PARAM_SIZE_SIZE      1
#define   DSPCELL_DSP_PARAM_CONF_MAP_SIZE  (DSPCELL_DSP_PARAM_ADR_SIZE + DSPCELL_DSP_PARAM_SIZE_SIZE)


#define   DSP_CELL_ANALOG_EN_ID            0x01



enum ConfigurationBlocks
{ 
  DSP_BOOT_BLOCK = 0,
  REGULATION_LINE_BLOCK,
};





#endif //__MEMORY_MAP_H
