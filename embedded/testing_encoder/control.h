/*
 * control.h
 *
 *  Created on: 16 May 2025
 *      Author: chris
 */

#ifndef CONTROL_H_
#define CONTROL_H_


#include "spi.h"
#include "uart.h"
#include "semphr.h"

struct control_info {
    struct spi_info *spi_info;
    struct uart_info *uart_info;
    BOOLEAN stop_flag;
};

void control_info_init(struct control_info *control_info, struct spi_info *spi_info, struct uart_info *uart_info);

void control_task(void *pvParameter);

#endif /* CONTROL_H_ */
