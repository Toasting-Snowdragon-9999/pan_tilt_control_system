#include "common.h"

/* Global definitions */

//Queue Handles
QueueHandle_t xUartTxQueue;
QueueHandle_t xUartRxQueue;

QueueHandle_t xSpiRxQueue;
QueueHandle_t xSpiTxQueue;

// Task Handles
TaskHandle_t vControllerDummyTaskHandle;
TaskHandle_t vPidControllerTaskHandle;

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
