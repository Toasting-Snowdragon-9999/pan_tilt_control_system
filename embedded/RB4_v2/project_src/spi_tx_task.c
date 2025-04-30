/*
 * spi_tx_task.c
 *
 *  Created on: 30 Apr 2025
 *      Author: linax
 */


#include "common.h"
#include "spi_tx_task.h"



extern QueueHandle_t xSpiTxQueue;

void vSpiTxTask(void *pvParameters)
{
    TickType_t lastWake = xTaskGetTickCount();
    INT16U txChar;

    for (;;) {


          uart_print("\r\n<<<SPI_TRANSMITTER>>>\r\n");

          xQueueReceive(xSpiTxQueue, &txChar, pdMS_TO_TICKS(1000)); //define portmax delay or specific macro?
              SPI_write(txChar);

              uart_send_16int(txChar);
              //uart_send_double(txChar);  //transmit byte over uart

          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(300)); //necessary?
    }
}
