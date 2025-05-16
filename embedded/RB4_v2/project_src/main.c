/*
 * main.c
 *
 *  Created on: 18 Mar 2025
 *      Author: linax
 */
#include "FreeRTOSConfig.h"
#include "common.h"

static void initilization(void)
{

  init_systick(); //freeRTOS default systick handler
  init_gpio();
  uart0_init(115200); //task uart
  uart1_init(115200); //debugger
  SPI_init();

}


void queueSetup(){

         // xSpiRxQueue = xQueueCreate(1, sizeof(INT32S)); //from fpga encoders

        //  xSpiTxQueue = xQueueCreate(1, sizeof(INT32S)); //to fpa motors
       //   xUartRxQueue = xQueueCreate(1, sizeof(INT32S)); //from vision


          xPanCtrlOutQueue = xQueueCreate(1, sizeof(FP32)); //from controller task to map task
          xTiltCtrlOutQueue = xQueueCreate(1, sizeof(FP32)); //from controller task to map task

          xPanCtrlInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task
          xTiltCtrlInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task

         xPanFbInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task
         xTiltFbInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task


        // xUartTxQueue = xQueueCreate(1, sizeof(INT16S)); //to pc

          // xSpiRxTempQueue = xQueueCreate(1, sizeof(INT16S)); //from fpga encoders
}


int main(void)

{
        FSM_STATUS = IDLE;
        initilization();
        queueSetup();
       // xTaskCreate( vSpiTask,"SPI", 512, NULL, 4, &vSpiTaskHandle);
        xTaskCreate( vSpiRxTask,"SPI_RX", 512, NULL, 4, &vSpiRxTaskHandle);
        xTaskCreate( vSpiTxTask,"SPI_TX", 512, NULL, 4, &vSpiTxTaskHandle);
        xTaskCreate( vPIDControllerTask, "PID_CONTROLLER", 512, NULL, 3, &vPIDControllerTaskHandle);
        xTaskCreate( vUartTask, "UART_RX",  512, NULL,2, &vUartTaskHandle);
        //xTaskCreate( vLedTask, "LED_TASK", 128, NULL, 1, &vLedTaskHandle);


      //  xTaskCreate( vUartTxTask,"UART_TX", 512, NULL, 3, &vUartTxTaskHandle);

     //   xTaskCreate( vSpiTxTask,"SPI_TX", 512, xSpiTxQueue, 3, &vSpiTxTaskHandle);
      //  xTaskCreate( vSpiRxTask, "SPI_RX",  512, xSpiRxQueue, 2, &vSpiRxTaskHandle);

        //xTaskCreate( vUartGetFrameTask, "UART_GET_FRAME",  512, NULL, 2, &vUartGetFrameTaskHandle);
        //xTaskCreate( vSpiSendFrameTask,"SEND_FRAME", 512, NULL, 3, &vSpiSendFrameTaskHandle);
        //xTaskCreate( vSpiGetFrameTask, "GET_FRAME",  512, NULL, 2, &vSpiGetFrameTaskHandle);

        //xTaskCreate( vPanControllerTask, "PAN_CONTROLLER", 512, NULL, 4, &vPanControllerTaskHandle);
       // xTaskCreate( vTiltControllerTask, "TILT_CONTROLLER", 512, NULL, 4, &vTiltControllerTaskHandle);


        // xTaskCreate( vUartSendFrameTask,"UART_SEND_FRAME", 512, NULL, 4, &vUartSendFrameTaskHandle);
        //xTaskCreate(vDebugTask, "DEBUG", 200, NULL, 4, &vDebugTaskHandle);
       //xTaskCreate(vTestTask, "TEST", 200, NULL, 4, NULL);

        vTaskStartScheduler();

        for(;;);

}


