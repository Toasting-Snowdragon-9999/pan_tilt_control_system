/***************** Header ********************/
/*********************************************
 * University of Southern Denmark
* Embedded C Programming (ECP)
 *
 * MODULENAME: init_spi.h
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
/***************** Functions ******************/

#ifndef INIT_SPI_H_
#define INIT_SPI_H_

void SPI_init(void);

void SPI_write(INT16U);

INT16U SPI_read(void);

#endif /* INIT_SPI_H_ */
/****************************** End Of Module *******************************/
