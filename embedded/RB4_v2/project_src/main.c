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
//  uart1_init(115200); //debugger
  SPI_init();
  //init_PID???

}


void QueueSetup(){

          xSpiRxQueue = xQueueCreate(1, sizeof(INT16U)); //from fpga encoders
          xSpiTxQueue = xQueueCreate(1, sizeof(INT16U)); //to fpa motors

          xPanCtrlOutQueue = xQueueCreate(2, sizeof(INT8U)); //from controller task to map task
          xTiltCtrlOutQueue = xQueueCreate(2, sizeof(INT8U)); //from controller task to map task

          xPanCtrlInQueue = xQueueCreate(2, sizeof(INT16U)); //from map task to controller task
          xTiltCtrlInQueue = xQueueCreate(2, sizeof(INT16U)); //from map task to controller task

          xUartRxQueue = xQueueCreate(1, sizeof(INT16U)); //from vision
          xUartTxQueue = xQueueCreate(1, sizeof(INT16U)); //to pc

          //xUart16DebugQueue = xQueueCreate(1, sizeof(INT16U));
          //xUart8DebugQueue = xQueueCreate(1, sizeof(INT8U));

}

void vTestTask(void *pvParameters)
{
    for( ;; )
    {
   ;
       vTaskDelay(pdMS_TO_TICKS(500));

        //vTaskDelay(pdMS_TO_TICKS(500));
    }
}

int main(void)

{
        FSM_STATUS = IDLE;
        initilization();
        QueueSetup();
      //xTaskCreate(vDebugTask, "DEBUG", 200, NULL, 4, &vDebugTaskHandle);
      //xTaskCreate(vTestTask, "TEST", 200, NULL, 4, NULL);

       // xTaskCreate( vLedTask, "LED_TASK", 128, NULL, 3, &vLedTaskHandle);
       // xTaskCreate( vUartRxTask, "UART_RX",  512, NULL,4, &vUartRxTaskHandle);

//        xTaskCreate( vPanControllerTask, "PAN_CONTROLLER", 512, xUartRxQueue, 4, &vPanControllerTaskHandle);
       // xTaskCreate( vUartTxTask,"UART_TX", 512, NULL, 4, &vUartTxTaskHandle);

//        xTaskCreate( vUartSendFrameTask,"UART_SEND_FRAME", 512, NULL, 4, &vUartSendFrameTaskHandle);

//        xTaskCreate( vUartGetFrameTask, "UART_GET_FRAME",  200, NULL, 4, &vUartGetFrameTaskHandle);

//        xTaskCreate( vMapTestTask, "MAP_TEST_TASK", 128, NULL, 4, &vMapTestTaskHandle);


//       xTaskCreate( vSpiSendFrameTask,"SEND_FRAME", 200, NULL, 4, &vSpiSendFrameTaskHandle);
       //xTaskCreate( vSpiGetFrameTask, "GET_FRAME",  200, NULL, 4, &vSpiGetFrameTaskHandle);
       xTaskCreate( vSpiTxTask,"SPI_TX", 512, NULL, 4, &vSpiTxTaskHandle);
       xTaskCreate( vSpiRxTask, "SPI_RX",  200, xSpiRxQueue, 4, &vSpiRxTaskHandle);

        vTaskStartScheduler();

        for(;;);

}


//xTaskCreate(vTestTask, "TEST", 200, NULL, 4, NULL);

/*
void vTestTask(void *pvParameters)
{
    for( ;; )
    {
        FSM_STATUS = IDLE;

        //uart_print("EncoderFrame: \n");
       INT16U EncoderFrame; //= 0b1101001010100010;
       xQueueReceive(xUartRxQueue, &EncoderFrame, pdMS_TO_TICKS(500));
           //xQueueSend(xUartTxQueue, &EncoderFrame, pdMS_TO_TICKS(500));
           xQueueSend(xSpiRxQueue, &EncoderFrame, pdMS_TO_TICKS(500));


       //uart_print("MotorPanError: ");
       //INT16U PanError = 0b1101101100000000;
       xQueueSend(xUartTxQueue, &PanError, pdMS_TO_TICKS(500));
       //INT8U panError = 0b11011011;
       xQueueSend(xPanCtrlOutQueue, &panError, pdMS_TO_TICKS(500));



       //uart_print("MotorTiltError: ");
       //INT16U TiltError = 0b110100100000000;
       xQueueSend(xUartTxQueue, &TiltError, pdMS_TO_TICKS(500));
       //INT8U tiltError = 0b1101001;
       xQueueSend(xTiltCtrlOutQueue, &tiltError, pdMS_TO_TICKS(500));


       vTaskDelay(pdMS_TO_TICKS(500));
    }
}

*/



/*DEBUGGNING TASKS*/
/*
void vApplicationStackOverflowHook( TaskHandle_t xTask, char *pcTaskName )
{
    // If this hits, a task has overflowed its stack
    for( ;; );
}
void vApplicationMallocFailedHook(void)
{
    // If this hits, a memory allocation failed
    for( ;; );
}


void vTestTask(void *pvParameters)
{
    uart_putc('Y');
    for( ;; )
    {
        uart_print("Hello from Test Task\n");
        vTaskDelay(pdMS_TO_TICKS(2000));
    }
}
*/

// xTaskCreate(vTestTask, "TEST", 200, NULL, 4, NULL);


//if (xTaskCreate(vDebugTask, "DEBUG", 256, NULL, Prio_Debug, &vDebugTaskHandle) != pdPASS) { uart_print("TaskCreate DEBUG failed\n"); }

//if (xTaskCreate( vLedTask, "LED_TASK", 200, NULL, Prio_Led, &vLedTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate LED_TASK failed\n"); }

        //if (xTaskCreate( vSwitchTask, "SW_TASK", 200, NULL, Prio_Sw, &vSwitchTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate SW_TASK failed\n"); }

//if (xTaskCreate( vControllerDummyTask,"CONTROLLERDUMMY", 200, xUartRxQueue, Prio_Controller_Dummy, &vControllerDummyTaskHandle) != pdPASS)
       //{ uart_print("TaskCreate CONTROLLER failed\n"); }


/*

if (xTaskCreate( vUartTxTask,"UART_TX", 200, xUartTxQueue, TOP, &vUartTxTaskHandle) != pdPASS)
{ uart_print(1, "TaskCreate UART_TX failed\n"); }

if (xTaskCreate( vUartRxTask, "UART_RX",  200, xUartRxQueue, HIGH, &vUartRxTaskHandle) != pdPASS)
{ uart_print(1, "TaskCreate UART_RX failed\n"); }

if (xTaskCreate( vLedTask, "LED_TASK", 200, NULL, MEDIUM, &vLedTaskHandle) != pdPASS)
{ uart_print(1,"TaskCreate LED_TASK failed\n"); }
*/
//if (xTaskCreate( vSpiSendFrameTask,"SEND_FRAME", 200, NULL, 4, &vSpiSendFrameTaskHandle) != pdPASS)
//{ uart_print("TaskCreate UART_TX failed\n"); }

//if (xTaskCreate( vSpiGetFrameTask, "GET_FRAME",  200, NULL, 3, &vSpiGetFrameTaskHandle) != pdPASS)
//{ uart_print("TaskCreate UART_RX failed\n"); }


/*
if (xTaskCreate( vSpiTxTask,"SPI_TX", 200, xSpiTxQueue, 3, &vSpiTxTaskHandle) != pdPASS)
{ uart_print("TaskCreate SPI_TX failed\n"); }

if (xTaskCreate( vSpiRxTask, "SPI_RX",  200, xSpiRxQueue, 2, &vSpiRxTaskHandle) != pdPASS)
{ uart_print("TaskCreate SPI_RX failed\n"); }
*/
// if (xTaskCreate( vPidControllerTask, "PID_CONTROLLER",  200, xUartRxQueue, Prio_Pid_Controller, &vPidControllerTaskHandle) != pdPASS)
//{ uart_print("TaskCreate PID_CONTROLLER failed\n"); }

