/*
 * uart_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */
#include "common.h"
#include "uart.h"
#include "map.h"

extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xSpiRxTempQueue;
extern QueueHandle_t xUartTxQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlOutQueue;


void vUartTask(void *pv) {
  //TickType_t xLastWakeTime;
    //  const TickType_t xFrequency = 1;
      //xLastWakeTime = xTaskGetTickCount();

    INT16S VisionFrame;
               INT8S panVal, tiltVal;



        for (EVER) {

            if(uart0_ready()){
                FSM_STATUS = UART;

               uart0_get16(&VisionFrame);

                //uart1_send16(VisionFrame);
               // uart1_print ("\r\nVisionFrame: 0x%04x, 0b%s, d:%d \r\n", VisionFrame, rx_binary_string(VisionFrame), VisionFrame);
               UnpackVisionFrame(VisionFrame, &panVal, &tiltVal);





                xQueueSend(xPanCtrlInQueue, &panVal, 0);
                xQueueSend(xTiltCtrlInQueue, &tiltVal, 0);

            }

           vTaskDelay(pdMS_TO_TICKS(1));
           //  vTaskDelayUntil( &xLastWakeTime, xFrequency );
        }
}

//   uart1_print("\r\n<<<UART_TASK>>>\r\n");
       //  uart1_send16(VisionFrame);

       //  uart1_print ("\r\nVisionFrame: 0x%04x, 0b%s, d:%d \r\n", VisionFrame, rx_binary_string(VisionFrame), VisionFrame);

         //uart1_print ("\r\panVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string(panVal), panVal);
         //uart1_print ("\r\tiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string(tiltVal), tiltVal);


/*
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
*/


