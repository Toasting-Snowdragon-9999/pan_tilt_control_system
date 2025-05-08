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


          //uart_print("\r\n<<<SPI_TRANSMITTER>>>\r\n");

          xQueueReceive(xSpiTxQueue, &txChar, pdMS_TO_TICKS(10)); //define portmax delay or specific macro?
              SPI_write(txChar);
              //xQueueSend(xUartTxQueue, &txChar, pdMS_TO_TICKS(1000));
              //uart_send_16int('T');
              //uart_send_double(txChar);  //transmit byte over uart

          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(100)); //necessary?
    }
}
