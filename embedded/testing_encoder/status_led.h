/*
 * status_led.h
 *
 *  Created on: 8 May 2025
 *      Author: linax
 */


#ifndef STATUS_LED_H_
#define STATUS_LED_H_

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "emp_type.h"
#include "tm4c123gh6pm.h"

void status_led(void *pvParameters);

#endif /*STATUS_LED_H_ */
