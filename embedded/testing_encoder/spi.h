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
#include "glob_def.h"
#include "FreeRTOS.h"
#include "semphr.h"

struct spi_info{
    uint16_t tx;
    uint16_t rx;
    SemaphoreHandle_t semaphore;
};

void SPI_init(void);

void SPI_write(INT16U);

INT16U SPI_read(void);

void spi_info_init(struct spi_info *spi_info);

void spi_task(void *pvParameter);

#endif /* DRIVERS_SPI_H_ */
