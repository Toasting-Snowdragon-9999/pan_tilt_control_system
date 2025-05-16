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

//void vSpiRxTask(void *pv) { //receive from fpga to tiva
//
//        INT16U rxChar;
//        TickType_t lastWake = xTaskGetTickCount();
//        for (;;) {
//
//            //uart_print("\r\n<<<SPI_RECIEVER>>>\r\n");
//            rxChar = SPI_read();
//
//            xQueueSend(xSpiRxQueue, &rxChar, pdMS_TO_TICKS(10)); //find appropriate delay and create macro?
//                xQueueSend(xUartTxQueue, &rxChar, pdMS_TO_TICKS(10));
//            //uart_send_16int(rxChar);
//
//            vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(100)); //necessary?
//            //task delay to yield?
//        }
//}
//
//
//void vSpiTxTask(void *pvParameters)
//{
//    TickType_t lastWake = xTaskGetTickCount();
//    INT16U txChar;
//
//    for (;;) {
//
//
//          //uart_print("\r\n<<<SPI_TRANSMITTER>>>\r\n");
//
//          if(xQueueReceive(xSpiTxQueue, &txChar, portMAX_DELAY) == pdPASS){ //define portmax delay or specific macro?
//              SPI_write(txChar);
//
//          }
//              //uart_send_16int('T');
//              //uart_send_double(txChar);  //transmit byte over uart
//
//          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(100)); //necessary?
//    }
//}

//SPI DEBUGGING WITH UART

void vSpiRxTask(void *pv) { //receive from fpga to tiva

        INT16U rxChar;
        TickType_t lastWake = xTaskGetTickCount();
        for (;;) {

            //uart_print("\r\n<<<SPI_RECIEVER>>>\r\n");
            rxChar = SPI_read();

            //xQueueSend(xSpiRxQueue, &rxChar, pdMS_TO_TICKS(10)); //find appropriate delay and create macro?
              //xQueueSend(xUartTxQueue, &rxChar, pdMS_TO_TICKS(10));
            uart0_send16(rxChar);

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
        txChar =   uart0_get16();
         // xQueueReceive(xSpiTxQueue, &txChar, pdMS_TO_TICKS(20)); //define portmax delay or specific macro?
              SPI_write(txChar);
            //uart0_send16(txChar);
//             GPIO_PORTF_DATA_R ^= 0x04;
             //xQueueSend(xUartTxQueue, &txChar, 0);
              //xQueueSend(xUartTxQueue, &txChar, pdMS_TO_TICKS(1000));
              //uart_send_16int('T');
              //uart_send_double(txChar);  //transmit byte over uart

          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(100)); //necessary?
    }
}
