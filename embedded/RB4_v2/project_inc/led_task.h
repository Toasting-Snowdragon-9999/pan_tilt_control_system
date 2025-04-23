/*
 * led_task.h
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#ifndef LED_TASK_H_
#define LED_TASK_H_

#include "FreeRTOS.h"    // Must be first – sets up configuration and core types
#include "task.h"        // Defines task-related types and functions
#include "queue.h"       // Defines queue-related types and functions
#include "emp_type.h"
#include "led_state.h"



void vLedTask(void *pvParameters);


#endif /* SLED_TASK_H_ */
