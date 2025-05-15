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

/* Project-specific types */
#include "emp_type.h"
#include "tmodel.h"

/* Hardware-specific and setup headers */
#include "tm4c123gh6pm.h"
#include "gpio.h"
#include "systick_frt.h"
#include "events.h"
#include "swtimers.h" // etc.

/* Task headers */
#include "controller.h"
#include "controller_dummy.h"
//#include "uart_rx_task.h"
//#include "uart_tx_task.h"
#include "spi_tx_task.h"
#include "spi_rx_task.h"
#include "map.h"
#include "status_led.h"
#include "led_task.h"
#include "sw_task.h"
#include "debugger.h"

/* configuration and state headers? */
#include "led_state.h"
//#include "uart_config.h"
#include "spi_config.h"

#include "uart.h"
#include "uart_task.h"

//priotity defines
#define TOP 4
#define HIGH 3
#define MEDIUM 2
#define LOW 1

//Priority Defines



//Queue Handles
extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xUartTxQueue;

extern QueueHandle_t xSpiRxQueue;
extern QueueHandle_t xSpiTxQueue;
extern QueueHandle_t xSpiRxTempQueue;

extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;

extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlInQueue;

extern QueueHandle_t xPanFbInQueue;
extern QueueHandle_t xTiltFbInQueue;

//QueueHandle_t xPanCtrlOutQueue;
//QueueHandle_t xTiltCtrlOutQueue;

// Task Handles

extern TaskHandle_t vPanControllerTaskHandle;
extern TaskHandle_t vTiltControllerTaskHandle;

extern TaskHandle_t vUartRxTaskHandle;
extern TaskHandle_t vUartTxTaskHandle;

extern TaskHandle_t vUartSendFrameTaskHandle;
extern TaskHandle_t vUartGetFrameTaskHandle;

extern TaskHandle_t vSpiRxTaskHandle;
extern TaskHandle_t vSpiTxTaskHandle;

extern TaskHandle_t vSpiSendFrameTaskHandle;
extern TaskHandle_t vSpiGetFrameTaskHandle;

extern TaskHandle_t vDebugTaskHandle;
extern TaskHandle_t vLedTaskHandle;
extern TaskHandle_t vSwitchTaskHandle;

// Controller Variables
extern unsigned char ref;
extern unsigned char fb;

extern INT16U MotorFrame;
extern INT16U EncoderFrame;
//from encoder
extern INT8U panAng;
extern INT8U tiltAng;

extern INT16U MotorFrame;
//to motor
extern INT8U panSpeed;
extern INT8U tiltSpeed;
extern INT8U panDir;
extern INT8U tiltDir;

extern volatile INT8U FSM_STATUS;
#define IDLE 0 //idle???
#define CTRL 1 //controller task
#define URTRX 2  //uart rx task
#define URTTX 3 //uart tx task
#define SPIRX 4 //spi rx task
#define SPITX 5 //spi tx task
#define GFPC 6 //get frame/unpack from pc
#define GFFPGA 7 //get frame/unpack from fpga
#define CFPC 8  //create frame/unpack from pc
#define CFFPGA 9 //create frame/unpack from fpga



#endif /* COMMON_H */


