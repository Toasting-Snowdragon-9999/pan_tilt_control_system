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
extern QueueHandle_t xUartTxPanQueue;
extern QueueHandle_t xUartTxTiltQueue;

void vUartTask(void *pv) {
  //TickType_t xLastWakeTime;
    //  const TickType_t xFrequency = 1;
      //xLastWakeTime = xTaskGetTickCount();

    INT16S VisionFrame;
               INT8S panVal, tiltVal;



        for (EVER) {
            GPIO_PORTF_DATA_R ^= (1<<3);
            if(uart0_ready()){

                FSM_STATUS = UART;

               uart0_get16(&VisionFrame);
               UnpackVisionFrame(VisionFrame, &panVal, &tiltVal);





                xQueueSend(xPanCtrlInQueue, &panVal, 0);
                xQueueSend(xTiltCtrlInQueue, &tiltVal, 0);
                GPIO_PORTF_DATA_R ^= (1<<3);
            }
            //GPIO_PORTF_DATA_R ^= (1<<3);
           vTaskDelay(pdMS_TO_TICKS(1));
           //  vTaskDelayUntil( &xLastWakeTime, xFrequency );
        }
}

//   uart1_print("\r\n<<<UART_TASK>>>\r\n");
       //  uart1_send16(VisionFrame);

       //  uart1_print ("\r\nVisionFrame: 0x%04x, 0b%s, d:%d \r\n", VisionFrame, rx_binary_string(VisionFrame), VisionFrame);

         //uart1_print ("\r\panVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string(panVal), panVal);
         //uart1_print ("\r\tiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string(tiltVal), tiltVal);



void vUartTxTask(void *pvParameters)
{
    INT8S pantx;
    INT8S tilttx;
    INT16S pan;
    INT16S tilt;
    INT16S collectiveError; //eller collective encoder
    //INT8U sample = 0;
      for (;;) {

        //  FSM_STATUS = URTTX;

          if((xQueueReceive(xUartTxPanQueue, &pantx, 0) == pdTRUE) && (xQueueReceive(xUartTxTiltQueue, &tilttx, 0) == pdTRUE)){

             pan = pantx & 0xFF;
             tilt = tilttx & 0xFF;
             collectiveError = ((INT16S)pan << 8) | tilt;

              uart1_print ("\r\n: 0x%04x, 0b%s \r\n", collectiveError, rx_binary_string(collectiveError));
          }

       vTaskDelay(pdMS_TO_TICKS(1));
    }
}



