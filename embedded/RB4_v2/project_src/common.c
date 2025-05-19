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
TaskHandle_t vSpiRxTaskHandle;
TaskHandle_t vSpiTxTaskHandle;
TaskHandle_t vUartTaskHandle;
TaskHandle_t vPIDControllerTaskHandle;
TaskHandle_t vLedTaskHandle;
TaskHandle_t vSpiTaskHandle;

//state machines
extern volatile INT8U FSM_STATUS = IDLE;

// Initialize PID output limits
INT32S max_pid_output_pan;
INT32S max_pid_output_tilt;



// Increment values for mapping
INT32S pan_step_increment;
INT32S tilt_step_increment;
