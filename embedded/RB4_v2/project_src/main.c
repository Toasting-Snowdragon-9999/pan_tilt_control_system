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
  //init_ssi();
}


void queueSetup(){



          xPanCtrlOutQueue = xQueueCreate(1, sizeof(INT32S)); //from controller task to map task
          xTiltCtrlOutQueue = xQueueCreate(1, sizeof(INT32S)); //from controller task to map task

          xPanCtrlInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task
          xTiltCtrlInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task

         xPanFbInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task
         xTiltFbInQueue = xQueueCreate(1, sizeof(INT8S)); //from map task to controller task


}


int main(void)

{
        FSM_STATUS = IDLE;
        initilization();
        queueSetup();
      // uart1_putc('c');
        //uart0_putc('c');
        xTaskCreate( vSpiRxTask,"SPI_RX", 1024, NULL, 4, &vSpiRxTaskHandle);
        xTaskCreate( vSpiTxTask,"SPI_TX", 1024, NULL, 4, &vSpiTxTaskHandle);
        xTaskCreate( vPIDControllerTask, "PID_CONTROLLER", 1024, NULL, 3, &vPIDControllerTaskHandle);
        xTaskCreate( vUartTask, "UART_RX", 1024, NULL, 2, &vUartTaskHandle);
      // xTaskCreate( vLedTask, "LED_TASK", 128, NULL, 4, &vLedTaskHandle);



        vTaskStartScheduler();

        for(EVER);

}


