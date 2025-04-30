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
  uart_init(115200, 8, 1, 'n');
  //init_PID???

  GPIO_PORTF_DATA_R &= ~(0x0E);   //Debug led

}

int main(void)

{
        initilization();

        //adjust queue size & add mutexes?
        xUartRxQueue = xQueueCreate(16, sizeof(char));
        xUartTxQueue = xQueueCreate(16, sizeof(char));

        uart_print("=== MAIN===\n");

        //if (xTaskCreate( vControllerDummyTask,"CONTROLLERDUMMY", 200, xUartRxQueue, Prio_Controller_Dummy, &vControllerDummyTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate CONTROLLER failed\n"); }

        if (xTaskCreate( vUartTxTask,"UART_TX", 200, xUartTxQueue, Prio_Uart_Tx, &vUartTxTaskHandle) != pdPASS)
        { uart_print("TaskCreate UART_TX failed\n"); }

        if (xTaskCreate( vUartRxTask, "UART_RX",  200, xUartRxQueue, Prio_Uart_Rx, &vUartRxTaskHandle) != pdPASS)
        { uart_print("TaskCreate UART_RX failed\n"); }

       if (xTaskCreate( vPidControllerTask, "PID_CONTROLLER",  200, xUartRxQueue, Prio_Pid_Controller, &vPidControllerTaskHandle) != pdPASS)
       { uart_print("TaskCreate PID_CONTROLLER failed\n"); }


        //if (xTaskCreate( vLedTask, "LED_TASK", 200, NULL, Prio_Led, &vLedTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate LED_TASK failed\n"); }

        //if (xTaskCreate( vSwitchTask, "SW_TASK", 200, NULL, Prio_Sw, &vSwitchTaskHandle) != pdPASS)
        //{ uart_print("TaskCreate SW_TASK failed\n"); }

        //xTaskCreate(vTestTask, "TEST", 200, NULL, 4, NULL);
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


