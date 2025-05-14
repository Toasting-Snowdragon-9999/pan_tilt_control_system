/*
 * uart_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */
#include "common.h"
#include "uart.h"

extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlOutQueue;
//extern QueueHandle_t xUart16DebugQueue;
//extern QueueHandle_t xUart8DebugQueue;

void vUartRxTask(void *pv) {

    TickType_t lastWake = xTaskGetTickCount();

        INT16U rx;

        for (;;) {
            FSM_STATUS = URTRX;

            rx = uart0_get16();
            //xQueueSend(xUartRxQueue, &rx, 0);

            //uart0_print("UartRxTask received: 0x%04x, 0b%s, d:%u \r\n", rx, rx_binary_string(rx), (unsigned)rx); //debugger

           xQueueSend(xUartRxQueue, &rx, 0); //test om delay kan være mindre

            vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(10));
        }
}



void vUartTxTask(void *pvParameters)
{
    TickType_t lastWake = xTaskGetTickCount();
    INT16U tx;
      for (;;) {
          FSM_STATUS = URTTX;

          if(xQueueReceive(xUartTxQueue, &tx, portMAX_DELAY)){
              uart0_send16(tx);
              //uart1_print("uart tx task received motorFrame \r\n"); //debugger
          }
          //vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(20));
    }
}


//xQueueReceive(xUartTxQueue, &rx, pdMS_TO_TICKS(500));

