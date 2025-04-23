/*
 * sw_task.h
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#ifndef SW_TASK_H_
#define SW_TASK_H_
#include "FreeRTOS.h"    // Must be first – sets up configuration and core types
#include "task.h"        // Defines task-related types and functions
#include "queue.h"       // Defines queue-related types and functions
#include "emp_type.h"


#include "tm4c123gh6pm.h"
#include "gpio.h"
#include "led_state.h"



void vSwitchTask(void *pvParameters);


#endif /* SW_TASK_H_ */
