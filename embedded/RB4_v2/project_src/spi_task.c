/*
 * spi_task.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */


#include "common.h"
#include "spi_task.h"
//#include "spi.h"
#include "ssi.h"
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
    INT16U MotorFrame;


   // INT16U mframe = 0b0000000000000001;
    INT8U frameCreated = 0;
     TickType_t xLastWakeTime;
      const TickType_t xFrequency = 2;
      xLastWakeTime = xTaskGetTickCount();

        for (EVER) {

            //spi_transmit(MotorFrame);
            if((xQueueReceive(xPanCtrlOutQueue, &panError, portMAX_DELAY) == pdTRUE)
            && (xQueueReceive(xTiltCtrlOutQueue, &tiltError, portMAX_DELAY) == pdTRUE)){
             //  MotorFrame = 0b0000000000000001;
                FSM_STATUS = SPI;
                INT8U  panDir;
                INT8U tiltDir;
                INT8U panSpeed;
                INT8U tiltSpeed;

               //uart1_print("\r\n<<<SPI_TX_TASK>>>\r\n");
                tiva_fpga_map_pan(panError, &panSpeed, &panDir);
               tiva_fpga_map_tilt(tiltError, &tiltSpeed, &tiltDir);

               MotorFrame = CreateFrame(panDir, (INT8U)panSpeed, tiltDir, (INT8U)tiltSpeed);
              // uart1_send16(MotorFrame);
               // mframe =  MotorFrame;

                //DEBUGGER PRINTS

           // uart1_print("\r\panSpeed: 0x%04x, 0b%s, d:%u \r\n", panSpeed, rx_binary_string(panSpeed), (unsigned)panSpeed);
           //  uart1_print("\r\tiltSpeed: 0x%04x, 0b%s, d:%u \r\n", tiltSpeed, rx_binary_string(tiltSpeed), (unsigned)tiltSpeed);
            //uart1_print("\r\npanDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
           //uart1_print("\r\ntiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);
           //uart1_print("\r\nMotorFrame: 0x%04x, 0b%s, d:%u \r\n", MotorFrame, rx_binary_string(MotorFrame), (unsigned)MotorFrame);




            }
            SPI_write(MotorFrame);
            vTaskDelay(pdMS_TO_TICKS(5));
            /*if(frameCreated == 1){

            frameCreated = 0;
            }//MOSI*/

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

    for(EVER){
     //  uart1_print("\r\n<<<SPI_RX_TASK>>>\r\n");
        EncoderFrame = SPI_read(); //MISO
        //uart1_print("here");

//        EncoderFrame = spi_receive();

        //EncoderFrame = 0b011010000000100;
        UnpackFrame(EncoderFrame, &panTicks, &tiltTicks);
        //uart1_send16(EncoderFrame);

        //uart1_print("\r\panTicks: 0x%04x, 0b%s, d:%d \r\n", panTicks, rx_binary_string(panTicks), panTicks);
      // uart1_print("\r\nEncoderFrame: 0x%04x, 0b%s, d:%d \r\n", EncoderFrame, rx_binary_string(EncoderFrame), EncoderFrame);

        //panAng = ticks_to_degrees(panTicks);
        //tiltAng = ticks_to_degrees(tiltTicks);

        xQueueSend(xPanFbInQueue, &panTicks, 0);

        xQueueSend(xTiltFbInQueue, &tiltTicks, 0);

        //uart1_print("\r\panTicks: 0x%04x, 0b%s, d:%d \r\n", panTicks, rx_binary_string(panTicks), panTicks);
        // uart1_print("\r\tiltTicks: 0x%04x, 0b%s, d:%d \r\n", tiltTicks, rx_binary_string(tiltTicks), tiltTicks);




        vTaskDelay(pdMS_TO_TICKS(5));

       //vTaskDelayUntil( &xLastWakeTime, xFrequency );
    }
}


