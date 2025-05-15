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

           xQueueSend(xSpiTxQueue, &rx, pdMS_TO_TICKS(100)); //test om delay kan være mindre
//           xQueueSend(xUartTxQueue, &rx, 0);
            vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(20));
        }
}



void vUartTxTask(void *pvParameters)
{
    TickType_t lastWake = xTaskGetTickCount();
    INT16U tx;
    INT16U fail = 0x0101;
      for (;;) {
          FSM_STATUS = URTTX;

          if(xQueueReceive(xUartTxQueue, &tx, pdMS_TO_TICKS(500))){
              uart0_send16(tx);
              //uart1_print("uart tx task received motorFrame \r\n"); //debugger
          }
          else{
          uart0_send16(fail);
          }
          vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(20));
    }
}


//xQueueReceive(xUartTxQueue, &rx, pdMS_TO_TICKS(500));

