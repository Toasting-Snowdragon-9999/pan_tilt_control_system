/*
 * common.h
 *
 *  Created on: 7 Apr 2025
 *      Author: linax
 */


#ifndef COMMON_H
#define COMMON_H

#include <stdint.h>
#include <stddef.h>
#include <stdarg.h>
#include <stdio.h>

/*FreeRTOS specific headers*/
#include "FreeRTOSConfig.h"
#include "FreeRTOS.h" // Must be first?
#include "task.h"
#include "queue.h"
#include "timers.h"

/* Hardware-specific and driver headers */
#include "tm4c123gh6pm.h"
#include "gpio.h"
#include "systick_frt.h"
#include "events.h"
#include "swtimers.h" // etc.
#include "emp_type.h"
#include "uart.h"
#include "spi.h"
#include "ssi.h"

/* Task headers */
#include "controller.h"
#include "map.h"
#include "spi_task.h"
#include "uart_task.h"
#include "status_led.h"

//priotity defines
#define TOP 4
#define HIGH 3
#define MEDIUM 2
#define LOW 1

//Queue Handles
//extern QueueHandle_t xUartRxQueue;
//extern QueueHandle_t xUartTxQueue;

//extern QueueHandle_t xSpiRxQueue;
//extern QueueHandle_t xSpiTxQueue;
//extern QueueHandle_t xSpiRxTempQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;

extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlInQueue;

extern QueueHandle_t xPanFbInQueue;
extern QueueHandle_t xTiltFbInQueue;

//QueueHandle_t xPanCtrlOutQueue;
//QueueHandle_t xTiltCtrlOutQueue;

// Task Handles

extern TaskHandle_t vSpiTaskHandle;
extern TaskHandle_t vSpiRxTaskHandle;
extern TaskHandle_t vSpiTxTaskHandle;
extern TaskHandle_t vUartTaskHandle;
extern TaskHandle_t vPIDControllerTaskHandle;
extern TaskHandle_t vLedTaskHandle;

extern volatile INT8U FSM_STATUS;
#define IDLE 0 //idle???
#define UART 1 //controller task
#define CTRL 2  //uart rx task
#define SPI 3 //uart tx task

// Initialize PID output limits
extern INT32S max_pid_output_pan;
extern INT32S max_pid_output_tilt;


// Increment values for mapping
extern INT32S pan_step_increment;
extern INT32S tilt_step_increment;

#endif /* COMMON_H */


