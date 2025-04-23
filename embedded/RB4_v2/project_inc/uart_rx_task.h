/*
 * uart_rx_task.h
 *
 *  Created on: 20 Mar 2025
 *      Author: linax
 */


#ifndef UART_RX_TASK_H_
#define UART_RX_TASK_H_
#include "FreeRTOS.h"    // Must be first – sets up configuration and core types
#include "task.h"        // Defines task-related types and functions
#include "queue.h"       // Defines queue-related types and functions
#include "emp_type.h"
#include "uart_config.h"
void vUartRxTask(void *pvParameters);


#endif /* UART_RX_TASK_H_ */
