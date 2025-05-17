/*
 * uart.h
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */

#ifndef DRIVERS_UART_H_
#define DRIVERS_UART_H_


#include <stdint.h>
#include "glob_def.h"
#include "FreeRTOS.h"
#include "semphr.h"

struct uart_info {
    uint16_t tx;
    uint16_t rx;
    SemaphoreHandle_t semaphore;
};

// Put this in uart.c (or a shared utils.c) at file‐scope:
static char _binbuf[17];  // 16 bits + NUL

// UART 0: no mutex
void    uart0_init(uint32_t baud);
uint8_t uart0_getc(void);
void    uart0_putc(uint8_t b);
uint16_t uart0_get16(void);
void    uart0_send16(uint16_t v);
void    uart0_print(const char *fmt, ...);

// UART 1: with mutex-protected prints
void    uart1_init(uint32_t baud);
uint8_t uart1_getc(void);
void    uart1_putc(uint8_t b);
uint16_t uart1_get16(void);
void    uart1_send16(uint16_t v);
void    uart1_print(const char *fmt, ...);

const char *rx_binary_string(uint16_t v);

uint16_t uart0_get16_nonblocking(void);
int uart0_getc_nonblocking(uint8_t* byte_out);

void uart_info_init(struct uart_info* uart_info);
void uart_task(void *pvParameter);

#endif /* DRIVERS_UART_H_ */
