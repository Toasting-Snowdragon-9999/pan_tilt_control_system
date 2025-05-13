/*
 * debugger.h
 *
 *  Created on: 29 Mar 2025
 *      Author: linax
 */

#ifndef DEBUGGER_H_
#define DEBUGGER_H_

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "emp_type.h"

void printState();
void vDebugTask(void *pvParameters);

#endif /* DEBUGGER_H_ */
