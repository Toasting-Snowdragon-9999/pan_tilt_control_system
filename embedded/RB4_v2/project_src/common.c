#include "common.h"

/* Global definitions */

//Queue Handles
QueueHandle_t xUartTxQueue;
QueueHandle_t xUartRxQueue;

// Task Handles
TaskHandle_t vControllerDummyTaskHandle;
TaskHandle_t vPidControllerTaskHandle;
TaskHandle_t vLedTaskHandle;
TaskHandle_t vSwitchTaskHandle;
TaskHandle_t vUartRxTaskHandle;
TaskHandle_t vUartTxTaskHandle;
TaskHandle_t vDebugTaskHandle;

// Controller Variables
unsigned char ref = 100;
unsigned char fb = 0;
