/*
 * uart_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */
#include "common.h"
#include "uart.h"

extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xSpiRxTempQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlOutQueue;


void vUartRxTask(void *pv) {

        INT16S uartrx;
        INT16S spirx;
        for (;;) {

            FSM_STATUS = URTRX;

            uartrx = uart0_get16();
            spirx = uart0_get16();

            if((xQueueSend(xUartRxQueue, &uartrx, portMAX_DELAY) == pdTRUE)){
                uart1_print("\r\n<<<UartRxTask>>>\r\n");
                uart1_print("\r\nUartRxTask received: 0x%04x, 0b%s, d:%d \r\n", uartrx, rx_binary_string(uartrx), uartrx); //debugger
                xQueueSend(xSpiRxTempQueue, &spirx, 0);
            }

            xQueueSend(xSpiRxQueue, &spirx, portMAX_DELAY);

        }
}


void vUartTxTask(void *pvParameters)
{
    INT16S tx;

      for (;;) {

          FSM_STATUS = URTTX;

          if(xQueueReceive(xUartTxQueue, &tx, portMAX_DELAY) == pdTRUE){
              uart1_print("\r\n<<<UartTxTask>>>\r\n");
              uart0_send16(tx);
          }
    }
}



