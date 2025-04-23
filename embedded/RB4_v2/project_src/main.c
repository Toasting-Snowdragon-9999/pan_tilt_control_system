/*
 * main.c
 *
 *  Created on: 18 Mar 2025
 *      Author: linax
 */
#include "FreeRTOSConfig.h"
#include "common.h"


static void initilization(void)
/*****************************************************************************
*   Input    :  -
*   Output   :  -
*   Function :
*****************************************************************************/
{

  init_systick(); //freeRTOS default systick handler
  init_gpio();
  uart_init(9600, 8, 1, 'n');


  GPIO_PORTF_DATA_R &= ~(0x0E);   //Debug led

}

int main(void)
{
        initilization();

        //adjust queue size & add mutexes?
        xUartRxQueue = xQueueCreate(16, sizeof(char));
        xUartTxQueue = xQueueCreate(16, sizeof(char));

        uart_print("=== MAIN===\n");

        if (xTaskCreate( vControllerTask,"CONTROLLER", 200, xUartRxQueue, Prio_Controller, &vControllerTaskHandle) != pdPASS)
        { uart_print("TaskCreate CONTROLLER failed\n"); }

        if (xTaskCreate( vUartTxTask,"UART_TX", 200, xUartTxQueue, Prio_Uart_Tx, &vUartTxTaskHandle) != pdPASS)
        { uart_print("TaskCreate UART_TX failed\n"); }

        if (xTaskCreate( vUartRxTask, "UART_RX",  200, xUartRxQueue, Prio_Uart_Rx, &vUartRxTaskHandle) != pdPASS)
        { uart_print("TaskCreate UART_RX failed\n"); }

        //if (xTaskCreate( vLedTask, "LED_TASK", 200, NULL, Prio_Led, &vLedTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate LED_TASK failed\n"); }

        //if (xTaskCreate( vSwitchTask, "SW_TASK", 200, NULL, Prio_Sw, &vSwitchTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate SW_TASK failed\n"); }


        vTaskStartScheduler();

        for(;;);

}

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


