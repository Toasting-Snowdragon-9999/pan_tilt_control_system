/*
 * uart_rx_task.c
 *
 *  Created on: 24 Mar 2025
 *      Author: linax
 */

#include "common.h"

extern TaskHandle_t vLedTaskHandle;
extern TaskHandle_t vSwitchTaskHandle;
extern TaskHandle_t vUartRxTaskHandle;
extern TaskHandle_t vUartTxTaskHandle;

const char* getTaskStateString(eTaskState state) {
    switch (state) {
        case eRunning:   return "Running";
        case eReady:     return "Ready";
        case eBlocked:   return "Blocked";
        case eSuspended: return "Suspended";
        case eDeleted:   return "Deleted";
        default:         return "Unknown";
    }
}

void vDebugTask(void *pvParameters) {
    //uart_putc('D');
    TickType_t lastWake = xTaskGetTickCount();
    for (;;) {
        uart_putc('d');

        uart_print("=== Debug: System State ===\n");
        TaskStatus_t taskStats[10];
        UBaseType_t total = uxTaskGetSystemState(taskStats, 10, NULL);



        uart_print("Number of tasks:  %u\n", total);
        uint8_t i;
        for (i = 0; i < total; i++) {
            uart_print("Task: %s | Num: %u | Prio: %u | State: %s | Stack: %u\n",
                taskStats[i].pcTaskName,
                taskStats[i].xTaskNumber,
                taskStats[i].uxCurrentPriority,
                getTaskStateString(taskStats[i].eCurrentState),
                taskStats[i].usStackHighWaterMark);
        }

        vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(1000));
    }


}
