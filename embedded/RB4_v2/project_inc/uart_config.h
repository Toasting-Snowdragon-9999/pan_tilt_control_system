#ifndef UART_CONFIG_H_
#define UART_CONFIG_H_

#include <stdint.h>

void    uart_init (uint32_t baud_rate, uint8_t databits, uint8_t stopbits, uint8_t parity);
void    uart_putc (uint8_t ch);
uint8_t uart_getc (void);
void    uart_print(const char *format, ...);

#endif
