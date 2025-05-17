/*
 * spi_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */


#include "common.h"
#include "spi_task.h"
#include "spi.h"
#include "map.h"
//extern QueueHandle_t SpiTxQueue;
//extern QueueHandle_t xSpiRxQueue;
//extern QueueHandle_t xUartTxQueue;

//extern QueueHandle_t xUartRxQueue;
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;

extern QueueHandle_t xPanFbOutQueue;
extern QueueHandle_t xTiltFbOutQueue;

void vSpiTxTask(void *pv) { //receive from fpga to tiva

    INT32S panError, tiltError;
    INT8U panSpeed, tiltSpeed;
    INT8U  panDir,   tiltDir;
    INT16U MotorFrame;

     TickType_t xLastWakeTime;
      const TickType_t xFrequency = 2;
      xLastWakeTime = xTaskGetTickCount();

        for (;;) {

            if((xQueueReceive(xPanCtrlOutQueue, &panError, 0) == pdTRUE)
            && (xQueueReceive(xTiltCtrlOutQueue, &tiltError, 0) == pdTRUE)){
                FSM_STATUS = SPI;

                //uart1_print("\r\n<<<SPI_TX_TASK>>>\r\n");
                tiva_fpga_map_pan(&panError, &panSpeed, &panDir);
                tiva_fpga_map_tilt(&tiltError, &tiltSpeed, &tiltDir);

                CreateFrame(&MotorFrame, &panDir, &panSpeed, &tiltDir, &tiltSpeed);

                //DEBUGGER PRINTS

               //uart1_print("\r\panSpeed: 0x%04x, 0b%s, d:%u \r\n", panSpeed, rx_binary_string(panSpeed), (unsigned)panSpeed);
              // uart1_print("\r\tiltSpeed: 0x%04x, 0b%s, d:%u \r\n", tiltSpeed, rx_binary_string(tiltSpeed), (unsigned)tiltSpeed);
               //uart1_print("\r\npanDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
               //uart1_print("\r\ntiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);

                SPI_write(MotorFrame);  //MOSI
                //uart1_print("\r\nMotorFrame: 0x%04x, 0b%s, d:%u \r\n", MotorFrame, rx_binary_string(MotorFrame), (unsigned)MotorFrame);

            }

            vTaskDelay(pdMS_TO_TICKS(4));
            // vTaskDelayUntil( &xLastWakeTime, xFrequency );


      }

}

void vSpiRxTask(void *pvParameters)
{
    INT16S EncoderFrame;
    INT8S panTicks, tiltTicks;
    INT8S panAng, tiltAng;

    TickType_t xLastWakeTime;
    const TickType_t xFrequency = 2;
    xLastWakeTime = xTaskGetTickCount();

    for(;;){
    //   uart1_print("\r\n<<<SPI_RX_TASK>>>\r\n");
       EncoderFrame = SPI_read(); //MISO

        UnpackFrame(&EncoderFrame, &panTicks, &tiltTicks);

        panAng = ticks_to_degrees(panTicks);
        tiltAng = ticks_to_degrees(tiltTicks);

        if((xQueueSend(xPanFbInQueue, &panAng, 0) == pdTRUE) && (xQueueSend(xTiltFbInQueue, &tiltAng, 0) == pdTRUE)){
          //  uart1_print("\r\nEncoderFrame: 0x%04x, 0b%s, d:%d \r\n", EncoderFrame, rx_binary_string(EncoderFrame), EncoderFrame);
           // uart1_print("\r\npanAng: 0x%04x, 0b%s, d:%d \r\n", panAng, rx_binary_string(panAng), panAng);
           // uart1_print("\r\ntiltAng: 0x%04x, 0b%s, d:%d \r\n", tiltAng, rx_binary_string(tiltAng), tiltAng);

        }


        vTaskDelay(pdMS_TO_TICKS(4));

       //vTaskDelayUntil( &xLastWakeTime, xFrequency );
    }
}


