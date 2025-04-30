/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: timer.h
*
* PROJECT....: ECP
*
* DESCRIPTION: Test.
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 090215  MoH    Module created.
*
*****************************************************************************/

#ifndef SWTIMERS_H_
#define SWTIMERS_H_

/***************************** Include files *******************************/
#include "emp_type.h"
#include "events.h"
#include "messages.h"
#include "tm4c123gh6pm.h"
/*****************************    Defines    *******************************/
#define TIM_100_MSEC   20
#define TIM_200_MSEC   40
#define TIM_500_MSEC  100
#define TIM_1_SEC     200
#define TIM_2_SEC     400

/*****************************   Constants   *******************************/

/*****************************   Functions   *******************************/
void start_swtimer(INT8U no, INT8U event_buffer, INT16U time );

/****************************** End Of Module *******************************/
#endif /*SWTIMERS_H_*/
