/*
 * status_led.c
 *
 *  Created on: 8 May 2025
 *      Author: linax
 */


#include "status_led.h"

#define LED_RED    0x02   // PF1
#define LED_YELLOW  0x04  // PF2
#define LED_GREEN  0x08   // PF3

void status_led(void *pvParameters){
    GPIO_PORTF_DATA_R |= ~(0x0E); //clear LEDS
    for(;;){
      GPIO_PORTF_DATA_R ^= LED_RED;
      vTaskDelay( pdMS_TO_TICKS(500) ); //optimal?
    }

}
