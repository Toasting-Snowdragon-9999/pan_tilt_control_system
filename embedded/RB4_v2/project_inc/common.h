/*
 * common.h
 *
 *  Created on: 7 Apr 2025
 *      Author: linax
 */


#ifndef COMMON_H #define COMMON_H

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
#include "uart_rx_task.h"
#include "uart_tx_task.h"
#include "led_task.h"
#include "sw_task.h"
#include "debugger.h"

/* configuration and state headers? */
#include "led_state.h"
#include "uart_config.h"

//Priority Defines
#define Prio_Uart_Tx 4 //HIGH PRIORITY
#define Prio_Controller 3
#define Prio_Uart_Rx 3

#define Prio_Led 1
#define Prio_Sw 1
#define Prio_Debug 1
//Queue Handles
extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xUartTxQueue;


// Task Handles
extern TaskHandle_t vControllerTaskHandle;
extern TaskHandle_t vLedTaskHandle;
extern TaskHandle_t vSwitchTaskHandle;
extern TaskHandle_t vUartRxTaskHandle;
extern TaskHandle_t vUartTxTaskHandle;
extern TaskHandle_t vDebugTaskHandle;

// Controller Variables
extern unsigned char ref;
extern unsigned char fb;

#endif /* COMMON_H */


