/*
 * led_state.h
 *
 *  Created on: 26 Mar 2025
 *      Author: linax
 */
#include "tm4c123gh6pm.h"
#include "emp_type.h"



#ifndef LED_STATE_H_
#define LED_STATE_H_

#define OFF 0
#define RED 1
#define GREEN 2
#define BLUE 3


extern volatile INT8U LED_State;

void UpdateLEDState();

#endif /* LED_STATE_H_ */
