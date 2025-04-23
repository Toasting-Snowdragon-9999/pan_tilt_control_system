/*
 * uart_rx_task.c
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#include "common.h"
#include "uart_config.h"


extern QueueHandle_t xUartRxQueue;
void vUartRxTask(void *pv) {

        char rxChar;
        for (;;) {
                uart_putc('R');

            // blocking poll:
            rxChar = uart_getc();

            xQueueSend(xUartRxQueue, &rxChar, pdMS_TO_TICKS(300));
            uart_print("\r\n output:%u \r\n", rxChar);

        }
}
