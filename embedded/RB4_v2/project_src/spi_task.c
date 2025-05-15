/*
 * spi_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */


#include "common.h"
#include "spi_task.h"
#include "spi.h"

extern QueueHandle_t SpiTxQueue;
extern QueueHandle_t xSpiRxQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xSpiRxTempQueue;


void vSpiRxTask(void *pv) { //receive from fpga to tiva

        INT16S spirx;
        for (;;) {

            //spirx = SPI_read();
            //spirx = uart0_get16();

            if(xQueueReceive(xSpiRxTempQueue, &spirx, portMAX_DELAY) == pdTRUE){ //find appropriate delay and create macro?
                uart1_print("\r\n<<<SPI_RECIEVER>>>\r\n");
                xQueueSend(xSpiRxQueue, &spirx, 0);
                uart1_print("\r\nSpiRxTask received: 0x%04x, 0b%s, d:%d \r\n", spirx, rx_binary_string(spirx), spirx); //debugger
            }


      }
}


void vSpiTxTask(void *pvParameters)
{
    INT16S spitx;
    INT16S uarttx;
    for (;;) {

          if(xQueueReceive(xSpiTxQueue, &spitx, portMAX_DELAY) == pdTRUE){
              uart1_print("\r\n<<<SPI_TRANSMITTER>>>\r\n");
              uart1_print("\r\nSpiTxTask received: 0x%04x, 0b%s, d:%d \r\n", spitx, rx_binary_string(spitx), spitx); //debugger
              uarttx = spitx;
              xQueueSend(xUartTxQueue, &uarttx, 0);
              //SPI_write(spitx);
          }

    }
}


//SPI DEBUGGING WITH UART

/*void vSpiRxTask(void *pv) { //receive from fpga to tiva

        INT16U rxChar;
        TickType_t lastWake = xTaskGetTickCount();
        for (;;) {

            //uart_print("\r\n<<<SPI_RECIEVER>>>\r\n");
            rxChar = SPI_read();

            xQueueSend(xSpiRxQueue, &rxChar, pdMS_TO_TICKS(10)); //find appropriate delay and create macro?
                xQueueSend(xUartTxQueue, &rxChar, pdMS_TO_TICKS(10));
            //uart_send_16int(rxChar);

            vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(100)); //necessary?
            //task delay to yield?
        }
}


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
*/
