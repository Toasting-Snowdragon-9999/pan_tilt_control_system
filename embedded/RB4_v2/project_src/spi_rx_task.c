/*
 * spi_rx_task.c
 *
 *  Created on: 30 Apr 2025
 *      Author: linax
 */

#include "common.h"
#include "spi_rx_task.h"

extern QueueHandle_t SpiTxQueue;

void vSpiRxTask(void *pv) { //receive from fpga to tiva

        INT16U rxChar;
        TickType_t lastWake = xTaskGetTickCount();
        for (;;) {

            uart_print("\r\n<<<SPI_RECIEVER>>>\r\n");
            rxChar = SPI_read();

            xQueueSend(xSpiRxQueue, &rxChar, pdMS_TO_TICKS(100)); //find appropriate delay and create macro?

            uart_send_16int(rxChar);

            vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(300)); //necessary?
            //task delay to yield?
        }
}
