/*
 * common.h
 *
 *  Created on: 7 Apr 2025
 *      Author: linax
 */


#ifndef COMMON_H #define COMMON_H

#define UART0_RX_INT_MASK   UART_IM_RXIM
#define UART0_TX_INT_MASK   UART_IM_TXIM

#include <stdint.h>    // for int8_t, int16_t, int32_t, etc.
#include <stddef.h>    // for size_t, ptrdiff_t, etc.
#include <stdarg.h>
#include <stdio.h>
//#include <sys/types.h> // sometimes needed for ssize_t on certain systems

#include "FreeRTOSConfig.h"

#include "FreeRTOS.h" // Must be first.
#include "task.h"
#include "queue.h"
#include "timers.h"

/* Project-specific types */
#include "emp_type.h"
//#include "glob_def.h"
#include "tmodel.h"
/* Hardware-specific headers */
#include "tm4c123gh6pm.h"
#include "gpio.h"
#include "systick_frt.h"
//#include "runtime_stats.h"
#include "led_state.h"

/* UART and other configuration */
#include "uart_config.h"
#include "uart_rx_task.h"
#include "uart_tx_task.h"

/* Application modules */
#include "led_task.h"
#include "sw_task.h"

#include "debugger.h"
#include "controller.h"

/* Other modules as needed */
#include "events.h"
#include "swtimers.h" // etc.


extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xCtrlRxQueue;

#endif /* COMMON_H */


