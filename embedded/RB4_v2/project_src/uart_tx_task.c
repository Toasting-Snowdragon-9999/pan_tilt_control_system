#include "common.h"
#include "uart_tx_task.h"
/*
 * uart_tx_task.c
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */



extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xUartRxQueue;
void vUartTxTask(void *pvParameters)
{
    TickType_t lastWake = xTaskGetTickCount();
    INT16U tx;

      for (;;) {
          FSM_STATUS = TX;

          // wait for controller to hand us a byte
          xQueueReceive(xUartTxQueue, &tx, pdMS_TO_TICKS(10) );
              uart_send_16int(tx);
              uart_print("\n");

          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(500));
    }
}

