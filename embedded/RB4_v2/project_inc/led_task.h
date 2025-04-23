/*
 * led_task.h
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#ifndef LED_TASK_H_
#define LED_TASK_H_

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "emp_type.h"
#include "led_state.h"


void vLedTask(void *pvParameters);


#endif /*LED_TASK_H_ */
