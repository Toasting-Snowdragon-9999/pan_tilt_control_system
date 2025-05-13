/*
 * spi.h
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */

#ifndef DRIVERS_SPI_H_
#define DRIVERS_SPI_H_

#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"

void SPI_init(void);

void SPI_write(INT16U);

INT16U SPI_read(void);

#endif /* DRIVERS_SPI_H_ */
