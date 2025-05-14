/*
 * status_led.c
 *
 *  Created on: 8 May 2025
 *      Author: linax
 */


#include "common.h"

#define LED_RED    0x02   // PF1
#define LED_YELLOW  0x04  // PF2
#define LED_GREEN  0x08   // PF3

void LedDriver(){


    switch(FSM_STATUS)
       {
         case CTRL:
             GPIO_PORTF_DATA_R |= (0x0E);
             GPIO_PORTF_DATA_R ^=  LED_RED;
           break;
         case URTRX:
             GPIO_PORTF_DATA_R |= (0x0E);
             GPIO_PORTF_DATA_R ^=  LED_YELLOW;
           break;
         case URTTX:
             GPIO_PORTF_DATA_R |= (0x0E);
             GPIO_PORTF_DATA_R ^=  LED_GREEN;
           break;
       }


}


void vLedTask(void *pvParameters)
{
    //uart_putc('L');
    GPIO_PORTF_DATA_R |= (0x0E); //clear LEDS
    INT8U prev_state = FSM_STATUS; //save elevator state

    for(;;){

            if( prev_state != FSM_STATUS ) //on state change run driver
            {
                LedDriver();
                prev_state = FSM_STATUS;

            }

        vTaskDelay( pdMS_TO_TICKS( 10) ); //optimal?

    }
}



