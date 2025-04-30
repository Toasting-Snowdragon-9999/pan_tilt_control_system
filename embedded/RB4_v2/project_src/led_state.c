/*
 * led_state.c
 *
 *  Created on: 26 Mar 2025
 *      Author: linax
 */
#include "common.h"
#include "led_state.h"
volatile INT8U LED_State = OFF;
INT8U colors[] = {0x00, 0x02, 0x08, 0x04};
void UpdateLEDState(){
    GPIO_PORTF_DATA_R &= ~(0x0E);   // reset LEDs
    GPIO_PORTF_DATA_R |= colors[LED_State];

}


