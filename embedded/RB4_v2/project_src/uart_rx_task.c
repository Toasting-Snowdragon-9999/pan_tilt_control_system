/*
 * uart_rx_task.c
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#include "common.h"
#include "uart_rx_task.h"

extern QueueHandle_t xUartRxQueue;

void vUartRxTask(void *pv) {

        char rxChar;

        for (;;) {
            //uart_putc('R'); //indicates rx task is running
            uart_print("\r\n<<<UART_RECIEVER>>>\r\n");
            rxChar = uart_getc();

            xQueueSend(xUartRxQueue, &rxChar, pdMS_TO_TICKS(100)); //find appropriate delay and create macro?
            uart_print("\r\n output:%u \r\n", rxChar); //output received from controller

            //task delay to yield?
        }
}
