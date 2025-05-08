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
#include "uart_rx_task.h"
#include "uart_tx_task.h"
#include "spi_tx_task.h"
#include "spi_rx_task.h"
#include "map.h"
#include "status_led.h"
#include "led_task.h"
#include "sw_task.h"
#include "debugger.h"

/* configuration and state headers? */
#include "led_state.h"
#include "uart_config.h"
#include "spi_config.h"


//timer defines
#define QWAIT 100;

//Priority Defines

#define Prio_Controller_Dummy 1
#define Prio_Pid_Controller 3

#define Prio_Uart_Rx 3
#define Prio_Uart_Tx 4
#define Prio_Spi_Rx 3
#define Prio_Spi_Tx 3

#define Prio_Led 1
#define Prio_Sw 1
#define Prio_Debug 1

//Queue Handles
extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xSpiRxQueue;
extern QueueHandle_t xSpiTxQueue;
extern QueueHandle_t xSpiRxQueue;
extern QueueHandle_t xSpiTxQueue;

extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlInQueue;

extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;


// Task Handles
extern TaskHandle_t vControllerDummyTaskHandle;
extern TaskHandle_t vPidControllerTaskHandle;

extern TaskHandle_t vUartRxTaskHandle;
extern TaskHandle_t vUartTxTaskHandle;

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



#define RX 0
#define TX 1
#define IDLE 2

extern volatile INT8U FSM_STATUS;

#endif /* COMMON_H */


