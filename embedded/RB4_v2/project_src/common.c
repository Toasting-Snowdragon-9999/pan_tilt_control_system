#include "common.h"

/* Global definitions */

//Queue Handles
QueueHandle_t xUartTxQueue;
QueueHandle_t xUartRxQueue;

QueueHandle_t xSpiRxQueue;
QueueHandle_t xSpiTxQueue;
QueueHandle_t xSpiRxTempQueue;

QueueHandle_t xPanCtrlInQueue;
QueueHandle_t xTiltCtrlInQueue;

QueueHandle_t xPanCtrlOutQueue;
QueueHandle_t xTiltCtrlOutQueue;

QueueHandle_t xPanFbInQueue;
QueueHandle_t xTiltFbInQueue;

// Task Handles

TaskHandle_t vPanControllerTaskHandle;
TaskHandle_t vTiltControllerTaskHandle;

TaskHandle_t vSpiSendFrameTaskHandle;
TaskHandle_t vSpiGetFrameTaskHandle;

TaskHandle_t vUartSendFrameTaskHandle;
TaskHandle_t vUartGetFrameTaskHandle;

TaskHandle_t vUartRxTaskHandle;
TaskHandle_t vUartTxTaskHandle;

TaskHandle_t vSpiRxTaskHandle;
TaskHandle_t vSpiTxTaskHandle;

TaskHandle_t vDebugTaskHandle;
TaskHandle_t vLedTaskHandle;
TaskHandle_t vSwitchTaskHandle;

//state machines
extern volatile INT8U FSM_STATUS = IDLE;
