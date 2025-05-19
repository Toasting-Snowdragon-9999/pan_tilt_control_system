/*****************************************************************************
* University of Southern Denmark
* Embedded Programming (EMP)
*
* MODULENAME.: ssi.h
*
* PROJECT....: semester_project
*
* DESCRIPTION: Initialize the ssi, and ssi communication.
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 250305  MoH    Module created.
*
*****************************************************************************/
#ifndef SSI_H_
#define SSI_H_
/***************************** Include files *******************************/
#include <stdint.h>
#include <stdbool.h>
#include "tm4c123gh6pm.h"
#include "common.h"
//#include "gpio.h"
#include "FreeRTOS.h"
#include "Task.h"
#include "queue.h"
#include "semphr.h"
#include "emp_type.h"
#include <stdlib.h>

#include <math.h>
#include "uart.h"


/*****************************    Defines    *******************************/
// Define SPI configuration parameters
// #define SPI_BAUD_RATE   115200     // 1 MHz baud rate (adjust as needed) ?? wtf
//#define SPI_CLK_SPEED   0xF42400    // Clock speed 16 MHz // 0x4C4B400 // Clock speed 80 MHz
#define SYSCLK 16000000UL  // Change this to match your system clock
/*****************************   Constants   *******************************/
/*****************************   Functions   *******************************/
void configure_ssi_clock(INT32U desired_freq_hz);

void ssi_handler(void);
/*****************************************************************************
*   Input    : -
*   Output   : -
*   Function : Initialize the ssi handler.
******************************************************************************/

void init_ssi(/*INT32U desired_freq_hz*/);
/*****************************************************************************
*   Input    : -
*   Output   : -
*   Function : -
******************************************************************************/

void spi_transmit(INT16U data);
/*****************************************************************************
*   Input    : -
*   Output   : -
*   Function : -
******************************************************************************/

INT16U spi_receive(void);

extern BOOLEAN spi_rx_rdy();

extern BOOLEAN spi_tx_rdy();

void spi_task_transmit(void *pvParameters);
void spi_task_receive(void *pvParameters);

#endif /* SSI_H_ */
/****************************** End Of Module *******************************/
