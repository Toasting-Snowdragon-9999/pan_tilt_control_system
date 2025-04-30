#include "common.h"

/* Global definitions */
QueueHandle_t xUartTxQueue;
QueueHandle_t xUartRxQueue;
/*
xQueueHandle xUartRxQueue = NULL;
xQueueHandle xUartTxQueue = NULL;

Controller_t Controller = { .CtrlState = CTRL_IDLE, .Feedback = 0,
                              .CtrlInput = NULL, .CtrlOutput = NULL };
*/

unsigned char ref = 100;
unsigned char fb = 0;
