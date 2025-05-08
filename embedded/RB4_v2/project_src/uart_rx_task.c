/*
 * uart_rx_task.c
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#include "common.h"
#include "uart_rx_task.h"

extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;


void vUartRxTask(void *pv) {

    TickType_t lastWake = xTaskGetTickCount();

        INT16U rx;
        INT16U tx;

        for (;;) {
            FSM_STATUS = RX;

            rx = uart_get_16int();
            tx = rx;

            xQueueSend(xUartRxQueue, &rx, pdMS_TO_TICKS(100));
                xQueueSend(xUartTxQueue, &tx, pdMS_TO_TICKS(100));


            vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(10));
        }
}


