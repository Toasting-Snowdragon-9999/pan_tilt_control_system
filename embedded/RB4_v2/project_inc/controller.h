#ifndef CONTROLLER_H_
#define CONTROLLER_H_

#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "emp_type.h"

//#define CTRL_IDLE    0
//#define CTRL_RUNNING 1


//extern xQueueHandle xUartRxQueue;
//extern xQueueHandle xUartTxQueue;
/*
typedef struct {
    BaseType_t       CtrlState;
    unsigned char    Feedback;
    xQueueHandle     CtrlInput;
    xQueueHandle     CtrlOutput;
} Controller_t;
*/

//extern Controller_t Controller;
unsigned char Feedback;
char CtrlOutPut;
void vControllerTask(void *pvParameters);

#endif /* CONTROLLER_H_ */
