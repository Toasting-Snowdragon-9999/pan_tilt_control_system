/*****************************************************************************
* University of Southern Denmark
* Embedded Programming (EMP)
*
* MODULENAME.: gpio.c
*
* PROJECT....: EMP
*
* DESCRIPTION: See module specification file (.h-file).
*
* Change Log:
*****************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 150215  MoH   Module created.
*
*****************************************************************************/

/***************************** Include files *******************************/
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "gpio.h"
/*****************************    Defines    *******************************/

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/

/*****************************   Functions   *******************************/
/*
void init_gpio(void)
{
    // 1) Enable clock to Port F
    SYSCTL_RCGCGPIO_R |= (1<<5);            // 0x20
    while((SYSCTL_PRGPIO_R & (1<<5)) == 0); // wait for Port F

    // 2) Unlock PF4 (and PF0) if you ever want to use them
    GPIO_PORTF_LOCK_R   = 0x4C4F434B;
    GPIO_PORTF_CR_R    |= (1<<4);          // allow commit on PF4

    // 3) Configure PF4 as digital output
    GPIO_PORTF_DIR_R   |= (1<<4);          // PF4 = output
    GPIO_PORTF_DEN_R   |= (1<<4);          // PF4 digital enable
    GPIO_PORTF_AFSEL_R &= ~(1<<4);         // PF4 regular GPIO
    GPIO_PORTF_PCTL_R  &= ~(0xF << (4*4));// clear PCTL for PF4
    GPIO_PORTF_AMSEL_R &= ~(1<<4);         // disable analog on PF4


    // 2) Unlock PF4 (and PF0) if you ever want to use them
    GPIO_PORTF_LOCK_R   = 0x4C4F434B;
    GPIO_PORTF_CR_R    |= (1<<2);          // allow commit on PF4

    // 3) Configure PF4 as digital output
    GPIO_PORTF_DIR_R   |= (1<<2);          // PF4 = output
    GPIO_PORTF_DEN_R   |= (1<<2);          // PF4 digital enable
    GPIO_PORTF_AFSEL_R &= ~(1<<2);         // PF4 regular GPIO
    GPIO_PORTF_PCTL_R  &= ~(0xF << (4*4));// clear PCTL for PF4
    GPIO_PORTF_AMSEL_R &= ~(1<<2);         // disable analog on PF4

    // (optional) if you also want PF0 as input/pullup:
    // GPIO_PORTF_PUR_R |= (1<<4); // pull-up on PF4 (if you actually want input)
}*/

void init_gpio(void)
{
  int dummy;

  // Enable the GPIO ports used for LEDs and other peripherals.
  SYSCTL_RCGC2_R  =  SYSCTL_RCGC2_GPIOA | SYSCTL_RCGC2_GPIOC |
                     SYSCTL_RCGC2_GPIOD | SYSCTL_RCGC2_GPIOE |
                     SYSCTL_RCGC2_GPIOF;
  SYSCTL_RCGC1_R |= SYSCTL_RCGC1_UART0;

  // Dummy read to allow clocks to settle.
  dummy = SYSCTL_RCGC2_R;

  //For Port A, do not override UART pins (PA0 and PA1).
    // Use OR-assignment to set additional pins if needed (e.g., for other functions on Port A). */
  GPIO_PORTA_DIR_R |= 0x1C;   // OR with 0x1C preserves PA0 and PA1.
  GPIO_PORTA_DEN_R |= 0x1C;   // Same for digital enable.

  // Setup other ports as before.
  GPIO_PORTC_DIR_R = 0xF0;
  GPIO_PORTD_DIR_R = 0x4C;
  GPIO_PORTF_DIR_R = 0x0E;

  GPIO_PORTC_DEN_R = 0xF0;
  GPIO_PORTD_DEN_R = 0x4C;
  GPIO_PORTE_DEN_R = 0x0F;
  GPIO_PORTF_DEN_R = 0x1F;

  // Enable internal pull-ups for PF0 and PF4.
  GPIO_PORTF_PUR_R = 0x11;

}


/****************************** End Of Module *******************************/
