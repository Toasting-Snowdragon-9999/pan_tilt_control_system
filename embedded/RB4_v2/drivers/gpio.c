#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "gpio.h"

void init_gpio(void)
{
  uint32_t dummy;

  //––– 1) enable all the GPIO blocks we care about –––
  //    A, B, C, D, E, F
  SYSCTL_RCGC2_R = SYSCTL_RCGC2_GPIOA
                 | SYSCTL_RCGC2_GPIOB
                 | SYSCTL_RCGC2_GPIOC
                 | SYSCTL_RCGC2_GPIOD
                 | SYSCTL_RCGC2_GPIOE
                 | SYSCTL_RCGC2_GPIOF;
  // give ’em time to power up
  dummy = SYSCTL_RCGC2_R;

  //––– 2) preserve UART pins PA0/PA1, make PA2..PA4 outputs as before –––
  GPIO_PORTA_DIR_R |=  0x1C;    // PA2,PA3,PA4 as outputs
  GPIO_PORTA_DEN_R |=  0x1C;    // PA2,PA3,PA4 digital enable

  //––– 3) your other ports –––
  GPIO_PORTC_DIR_R =  0xF0;    // PC4–PC7 outputs (covers PC4,PC5)
  GPIO_PORTD_DIR_R =  0x4C;    // PD2,PD3,PD6 as outputs
  GPIO_PORTF_DIR_R =  0x0E;    // PF1,PF2,PF3 as outputs

  GPIO_PORTC_DEN_R  =  0xF0;
  GPIO_PORTD_DEN_R  =  0x4C;
  GPIO_PORTE_DEN_R  =  0x0F;
  GPIO_PORTF_DEN_R  =  0x1F;

  // enable pull-ups on PF0 & PF4 (buttons)
  GPIO_PORTF_PUR_R = 0x11;

  //––– 4) now specifically configure PB3, which wasn’t in your original set –––
  // PB3 = bit 3
  GPIO_PORTB_DIR_R    |= (1<<3);       // PB3 as output
  GPIO_PORTB_DEN_R    |= (1<<3);       // PB3 digital enable
  GPIO_PORTB_AFSEL_R  &= ~(1<<3);      // PB3 in GPIO (not alternate)
  GPIO_PORTB_PCTL_R   &= ~(0xF << 12); // clear PCTL[15:12] for PB3

  //––– 5) PC4 & PC5 were already set by the 0xF0 mask above, but if
  //       you ever need to re-explicitly reset AFSEL/PCTL you can do:
  //
  // GPIO_PORTC_AFSEL_R &= ~((1<<4)|(1<<5));
  // GPIO_PORTC_PCTL_R  &= ~((0xF<<16)|(0xF<<20));
  //
  //––– 6) PF3 is likewise already covered by your PF_DIR=0x0E + DEN=0x1F.
  //       If you want to be extra-safe you can:
  //
  // GPIO_PORTF_AFSEL_R &= ~(1<<3);
  // GPIO_PORTF_PCTL_R  &= ~(0xF<<12);

  //––– done –––
}
