/*
 * uart.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */


#include "common.h"
#include "uart.h"
#include "tm4c123gh6pm.h"
#include <stdarg.h>
#include <stdio.h>
#include "FreeRTOS.h"
#include "semphr.h"
#include "task.h"
#include "common.h"
static SemaphoreHandle_t xUart1Mutex;

// Helpers: enable clocks for UART0 (PA) and UART1 (PB)
static void _enable_uart0(void) {
    SYSCTL_RCGCGPIO_R |= (1 << 0);
    SYSCTL_RCGCUART_R |= (1 << 0);
    while (!(SYSCTL_PRGPIO_R & (1 << 0)));
    while (!(SYSCTL_PRUART_R & (1 << 0)));
}
static void _enable_uart1(void) {
    SYSCTL_RCGCGPIO_R |= (1 << 1);
    SYSCTL_RCGCUART_R |= (1 << 1);
    while (!(SYSCTL_PRGPIO_R & (1 << 1)));
    while (!(SYSCTL_PRUART_R & (1 << 1)));
}

// UART0 init + I/O (no mutex)
void uart0_init(uint32_t baud) {
    _enable_uart0();
    // PA0=RX, PA1=TX
    GPIO_PORTA_LOCK_R   = 0x4C4F434B;
    GPIO_PORTA_CR_R    |= 0x03;
    GPIO_PORTA_AFSEL_R |= 0x03;
    GPIO_PORTA_PCTL_R   = (GPIO_PORTA_PCTL_R & ~0xFF) | 0x11;
    GPIO_PORTA_DEN_R   |= 0x03;
    GPIO_PORTA_DIR_R    = (GPIO_PORTA_DIR_R & ~0x01) | 0x02;

    UART0_CTL_R &= ~UART_CTL_UARTEN;
    uint32_t ibrd = 16000000 / (16 * baud);
    uint32_t fbrd = (uint32_t)((((16000000.0f/(16.0f*baud)) - ibrd) * 64) + 0.5f);
    UART0_IBRD_R = ibrd;
    UART0_FBRD_R = fbrd;
    UART0_LCRH_R = UART_LCRH_WLEN_8 | UART_LCRH_FEN;
    UART0_CTL_R  = UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE;
}
uint8_t uart0_getc(void) {
    while (UART0_FR_R & UART_FR_RXFE) taskYIELD();
    return (uint8_t)(UART0_DR_R & 0xFF);
}
void uart0_putc(uint8_t b) {
    while (UART0_FR_R & UART_FR_TXFF);
    UART0_DR_R = b;
}
uint16_t uart0_get16(void) {
    taskENTER_CRITICAL();
    uint8_t hi = uart0_getc(); //mayeb change??/ test
    uint8_t lo = uart0_getc();

    taskEXIT_CRITICAL();
    return (uint16_t)((hi << 8) | lo);
}
void uart0_send16(uint16_t v) {
    uart0_putc((uint8_t)(v & 0xFF));
    uart0_putc((uint8_t)(v >> 8));
}
void uart0_print(const char *fmt, ...) {
    char buf[80];
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, sizeof(buf), fmt, ap);
    va_end(ap);
    char *p = buf;
    for (; *p; ++p)
        uart0_putc((uint8_t)*p);
}

// UART1 init + I/O + mutex-protected print
void uart1_init(uint32_t baud) {
    _enable_uart1();
    // PB0=RX, PB1=TX
    GPIO_PORTB_LOCK_R   = 0x4C4F434B;
    GPIO_PORTB_CR_R    |= 0x03;
    GPIO_PORTB_AFSEL_R |= 0x03;
    GPIO_PORTB_PCTL_R   = (GPIO_PORTB_PCTL_R & ~0xFF) | 0x11;
    GPIO_PORTB_DEN_R   |= 0x03;
    GPIO_PORTB_DIR_R    = (GPIO_PORTB_DIR_R & ~0x01) | 0x02;

    UART1_CTL_R &= ~UART_CTL_UARTEN;
    uint32_t ibrd1 = 16000000 / (16 * baud);
    uint32_t fbrd1 = (uint32_t)((((16000000.0f/(16.0f*baud)) - ibrd1) * 64) + 0.5f);
    UART1_IBRD_R = ibrd1;
    UART1_FBRD_R = fbrd1;
    UART1_LCRH_R = UART_LCRH_WLEN_8 | UART_LCRH_FEN;
    UART1_CTL_R  = UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE;

    xUart1Mutex = xSemaphoreCreateMutex();
}
uint8_t uart1_getc(void) {
    while (UART1_FR_R & UART_FR_RXFE) taskYIELD();
    return (uint8_t)(UART1_DR_R & 0xFF);
}
void uart1_putc(uint8_t b) {
    while (UART1_FR_R & UART_FR_TXFF);
    UART1_DR_R = b;
}
uint16_t uart1_get16(void) {
    taskENTER_CRITICAL();
    uint8_t lo = uart1_getc();
    uint8_t hi = uart1_getc();
    taskEXIT_CRITICAL();
    return (uint16_t)((hi << 8) | lo);
}
void uart1_send16(uint16_t v) {
    uart1_putc((uint8_t)(v & 0xFF));
    uart1_putc((uint8_t)(v >> 8));
}
void uart1_print(const char *fmt, ...) {
    if (xSemaphoreTake(xUart1Mutex, portMAX_DELAY) == pdTRUE) {
        char buf[80];
        va_list ap;
        va_start(ap, fmt);
        vsnprintf(buf, sizeof(buf), fmt, ap);
        va_end(ap);
        char *p = buf;
        for (; *p; ++p)
            uart1_putc((uint8_t)*p);
        xSemaphoreGive(xUart1Mutex);
    }
}

// Put this in uart.c (or a shared utils.c) at file‐scope:
static char _binbuf[17];  // 16 bits + NUL

const char *rx_binary_string(uint16_t v) {
   int i;
    for (i = 0; i < 16; i++) {
        // Extract bit 15 down to 0 in order
        _binbuf[i] = (v & (1 << (15 - i))) ? '1' : '0';
    }
    _binbuf[16] = '\0';
    return _binbuf;
}
