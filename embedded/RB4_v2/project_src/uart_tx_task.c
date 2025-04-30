#include "common.h"
#include "uart_tx_task.h"
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
    uint8_t txChar;

    for (;;) {

          //uart_putc('T'); //indicate TX task is running through uart (debugging)

          //uart_print("\r\n<<<UART_TRANSMITTER>>>\r\n");
          //wait for byte from controller
          xQueueReceive(xUartTxQueue, &txChar, pdMS_TO_TICKS(1000)); //define portmax delay or specific macro?
          //uart_print("\r\n<<<controller output: >>>\r\n");
          uart_putc(txChar);  //transmit byte over uart

          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(300)); //necessary?
    }
}
