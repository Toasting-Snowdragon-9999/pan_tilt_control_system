/*
 * uart.h
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */

#ifndef DRIVERS_UART_H_
#define DRIVERS_UART_H_
#include <stdint.h>

static char _binbuf[17];  // 16 bits + NUL

// UART 0: receiver no mutex
void uart0_init(INT32U baud);
BOOLEAN uart0_ready(void);
INT8S uart0_getc(void);
INT16S uart0_get16(void);


// UART 1: with mutex-protected prints
void uart1_init(INT32U baud);
void uart1_putc(INT8U b);
void uart1_send16(INT16U v);
void uart1_print(const char *fmt, ...);

const char *rx_binary_string(INT16U v);
//uint8_t uart1_getc(void);
//INT16U uart1_get16(void);
//void    uart0_send16(uint16_t v);
//void    uart0_putc(uint8_t b);
#endif /* DRIVERS_UART_H_ */
