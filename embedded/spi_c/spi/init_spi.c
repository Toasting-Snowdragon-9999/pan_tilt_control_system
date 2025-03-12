/***************** Header ********************/
/*********************************************
 * University of Southern Denmark
 * Embedded C Programming (ECP)
 *
 * MODULENAME: init_spi.c
 * PROJECT: Control of a pan-tilt system
 * DESCRIPTION: ---
 * Change Log:
***********************************************
* Date    Id    Change
* YYMMDD: 2025/12/03
* --------------------
 *********************************************/

/***************** Include files ******************/
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
/***************** Defines ********************/
/***************** Constants ******************/
/***************** Variables ******************/
/*******************************************************************
To enable and initialize the SSI, the following steps are necessary:
Enable the SSI module using the RCGCSSI register (see page 345).
**********************************************************************/

SYSCTL_RCGCSSI_R = (1<<2); //Enable and provide a clock to SSI module 2 in Run mode

/****************************************************************************************
Enable the clock to the appropriate GPIO module via the RCGCGPIO register (see page 339).
To find out which GPIO port to enable, refer to Table 23-5 on page 1346.
******************************************************************************************/

SYSCTL_RCGCGPIO_R1 = 1; //Due to the use of module 2: enable and provide a clock to the GPIO Port B in Run mode

/*******************************************************************************************
Set the GPIO AFSEL bits for the appropriate pins (see page 669). To determine which GPIOs to
configure, see Table 23-4 on page 1339
*********************************************************************************************/

GPIO_PORTB_AFSEL_R |= (1 << 4) | (1 << 5) | (1 << 6) | (1 << 7); // The associated pin functions as a peripheral signal and is controlled by the alternate hardware function

/**********************************************************************************************
Configure the PMCn fields in the GPIOPCTL register to assign the SSI signals to the appropriate
pins. See page 686 and Table 23-5 on page 1346.
***********************************************************************************************/

GPIO_PORTB_PCTL_R |= (2 << 16) | (2 << 20) | (2 << 24) | (2 << 28); //Controls the configurations for the GPIO pins 4, 5, 6, 7

/**************************************************************************************************
Program the GPIODEN register to enable the pin's digital function. In addition, the drive strength,
drain select and pull-up/pull-down functions must be configured. Refer to “General-Purpose
Input/Outputs (GPIOs)” on page 648 for more information.
Note: Pull-ups can be used to avoid unnecessary toggles on the SSI pins which can take the
slave to a wrong state.
****************************************************************************************************/



/****************************** End Of Module *******************************/
