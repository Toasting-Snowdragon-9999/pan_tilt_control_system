/*
 * uart_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */
#include "common.h"
#include "uart.h"

extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xSpiRxQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlOutQueue;
//extern QueueHandle_t xUart16DebugQueue;
//extern QueueHandle_t xUart8DebugQueue;

void vUartRxTask(void *pv) {

    TickType_t lastWake = xTaskGetTickCount();

        INT16U uartrx;
        INT16U spirx;

        for (;;) {
            uart1_print("<<<UartRxTask>>>\r\n");
            FSM_STATUS = URTRX;

            uartrx = uart0_get16();
            spirx = uart0_get16();

            if((xQueueSend(xUartRxQueue, &uartrx, portMAX_DELAY) == pdTRUE)){
                uart1_print("UartRxTask received: 0x%04x, 0b%s, d:%u \r\n", uartrx, rx_binary_string(uartrx), (unsigned)uartrx); //debugger
               //taskYIELD();
                //xQueueSend(xPanCtrlInQueue, &rx, 0); //test om delay kan være mindre
           }

           if( (xQueueSend(xSpiRxQueue, &uartrx, portMAX_DELAY) == pdTRUE)){
                 uart1_print("SpiRxTask received: 0x%04x, 0b%s, d:%u \r\n", spirx, rx_binary_string(spirx), (unsigned)spirx); //debugger

           }


              // vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(50));
        }
}


void vUartTxTask(void *pvParameters)
{
    TickType_t lastWake = xTaskGetTickCount();
    INT16U tx;

      for (;;) {
          uart1_print("<<<UartTxTask>>>\r\n");
          FSM_STATUS = URTTX;

          if(xQueueReceive(xUartTxQueue, &tx, portMAX_DELAY) == pdTRUE){
             // uart1_print("uart tx task received motorFrame \r\n"); //debugger
              uart0_send16(tx);
              uart1_print("UartTxTask received: 0x%04x, 0b%s, d:%u \r\n", tx, rx_binary_string(tx), (unsigned)tx); //debugger
              //taskYIELD();

      }
        // vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(500));
    }
}


//xQueueReceive(xUartTxQueue, &rx, pdMS_TO_TICKS(500));

