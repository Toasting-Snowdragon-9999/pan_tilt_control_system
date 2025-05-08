#include "common.h"

/* Global definitions */

//Queue Handles
QueueHandle_t xUartTxQueue;
QueueHandle_t xUartRxQueue;

QueueHandle_t xSpiRxQueue;
QueueHandle_t xSpiTxQueue;

//QueueHandle_t xErrorOutQueue;
//QueueHandle_t xErrorInQueue;


QueueHandle_t xPanCtrlInQueue;
QueueHandle_t xTiltCtrlInQueue;
QueueHandle_t xPanCtrlOutQueue;
QueueHandle_t xTiltCtrlOutQueue;



// Task Handles
TaskHandle_t vControllerDummyTaskHandle;
TaskHandle_t vPidControllerTaskHandle;

TaskHandle_t vSpiSendFrameTaskHandle;
TaskHandle_t vSpiGetFrameTaskHandle;

TaskHandle_t vUartRxTaskHandle;
TaskHandle_t vUartTxTaskHandle;

TaskHandle_t vSpiRxTaskHandle;
TaskHandle_t vSpiTxTaskHandle;

TaskHandle_t vDebugTaskHandle;
TaskHandle_t vLedTaskHandle;
TaskHandle_t vSwitchTaskHandle;

// Controller Variables
unsigned char ref = 100;
unsigned char fb = 0;

INT16U MotorFrame;
//state machines
extern volatile INT8U FSM_STATUS = IDLE;
