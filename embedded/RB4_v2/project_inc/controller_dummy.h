#ifndef CONTROLLER_H_
#define CONTROLLER_H_

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "emp_type.h"

//controller specific variables?
unsigned char Feedback;

//create controller struct? add controller states?

void vControllerDummyTask(void *pvParameters);

#endif /* CONTROLLER_H_ */
