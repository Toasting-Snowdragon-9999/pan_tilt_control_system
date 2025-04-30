#include "common.h"
#include "uart_config.h"
/*
 * uart_tx_task.c
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */



extern QueueHandle_t xUartTxQueue;

void vUartTxTask(void *pvParameters)
{
    TickType_t lastWake = xTaskGetTickCount();
    uint8_t b;
      for (;;) {
          uart_putc('T');
          // wait for controller to hand us a byte
          xQueueReceive(xUartTxQueue, &b, portMAX_DELAY);
          // send it out on the wire
          uart_putc(b);

        vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(300));
    }
}
