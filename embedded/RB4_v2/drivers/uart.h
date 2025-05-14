
/*
 * uart.h
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */

#ifndef DRIVERS_UART_H_
#define DRIVERS_UART_H_


#include <stdint.h>


#include <stdint.h>

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

const char *rx_binary_string16(uint16_t v);
const char *rx_binary_string8(INT8S v);

const char *rx_binary_string(INT8S v);
#endif /* DRIVERS_UART_H_ */
