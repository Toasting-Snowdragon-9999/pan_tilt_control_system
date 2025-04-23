/*
 * led_task.c
 *
 *  Created on: 19 Mar 2025
 *      Author: linax
 */

#include "common.h"
#include "led_task.h"

void vLedTask(void *pvParameters)
{

    char ch;
    for(;;){
        uart_print("\r\n<<<LED_TASK>>>\r\n");

        // Block until there is a byte in the TX queue
        if( xQueueReceive( xUartRxQueue, &ch, portMAX_DELAY ) == pdTRUE ){
            GPIO_PORTF_DATA_R &= ~(0x0E);   // reset LEDs
            switch(ch){
            case 'I':
                //SET STATE OFF
                LED_State = OFF;
            break;
            case 'R':
                //SET STATE RED
                LED_State = RED;
            break;
            case 'G':
                //SET STATE GREEN
                LED_State = GREEN;
            break;
            case 'B':
                //SET STATE BLUE
                LED_State = BLUE;
            break;

            }

            UpdateLEDState();

        }

                vTaskDelay( pdMS_TO_TICKS( 300) ); //optimal?


    }
}

