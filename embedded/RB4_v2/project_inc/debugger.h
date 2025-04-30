/*
 * debugger.h
 *
 *  Created on: 29 Mar 2025
 *      Author: linax
 */

#ifndef DEBUGGER_H_
#define DEBUGGER_H_
#include "FreeRTOS.h"    // Must be first – sets up configuration and core types
#include "task.h"        // Defines task-related types and functions
#include "queue.h"       // Defines queue-related types and functions
#include "emp_type.h"

void vDebugTask(void *pvParameters);

#endif /* DEBUGGER_H_ */
