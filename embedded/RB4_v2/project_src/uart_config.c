// uart_config.c
#include "common.h"
#include "uart_config.h"
#include "tm4c123gh6pm.h"
#include <stdarg.h>
#include <stdio.h>


void uart_init(uint32_t baud, uint8_t dbits, uint8_t sbits, uint8_t parity)
{
    // 1) Turn on UART0 & GPIOA clocks.  Use the RCGCUART/RCGCGPIO regs!
    SYSCTL_RCGCUART_R |= (1<<0);
    SYSCTL_RCGCGPIO_R |= (1<<0);
    __asm volatile("nop");

    // 2) Configure PA0->Rx, PA1->Tx
    GPIO_PORTA_LOCK_R = 0x4C4F434B;
    GPIO_PORTA_CR_R  |= 0x03;
    GPIO_PORTA_AFSEL_R |= 0x03;
    GPIO_PORTA_PCTL_R  = (GPIO_PORTA_PCTL_R & ~0xFF) | 0x11;
    GPIO_PORTA_DEN_R  |= 0x03;
    GPIO_PORTA_DIR_R  |= 0x02;  // PA1 out, PA0 in

    // 3) Baud divisor (16 MHz clock)
    uint32_t ibrd = 16000000 / (16 * baud);
    float    frac = (16000000/(16.0f*baud) - ibrd)*64 + 0.5f;
    UART0_IBRD_R = ibrd;
    UART0_FBRD_R = (uint32_t)frac;

    // 4) 8-N-1, FIFO on
    UART0_LCRH_R = (0x60) | (1<<4);

    // 5) Enable UART, Rx & Tx
    UART0_CTL_R |= (1<<0) | (1<<8) | (1<<9);

    // 6) Clear any pending, enable only the RX interrupt
    UART0_ICR_R = (1<<4);        // clear RX
    UART0_IM_R  = (1<<4);        // un-mask RX interrupt

    // 7) Enable in NVIC (irq #5)
    NVIC_EN0_R |= (1<<5);
}

//blocking TX
void uart_putc(uint8_t b)
{
    while( UART0_FR_R & (1<<5) ) {}   // wait TX FIFO not full
    UART0_DR_R = b;
}

// printf-style uart print
void uart_print(const char *fmt, ...)
{
    char buf[80];
    va_list ap;
    va_start(ap, fmt);
    vsnprintf(buf, sizeof(buf), fmt, ap);
    va_end(ap);
    char *p;
    for(p = buf; *p; ++p)
        uart_putc((uint8_t)*p);
}
/*
// ISR: read DR, push to queue, clear interrupt, yield if needed
void UART0_Handler(void)
{
    BaseType_t woken = pdFALSE;

    if( UART0_MIS_R & (1<<4) )          // RXMIS
    {
        UART0_ICR_R = (1<<4);           // clear RX interrupt
        uint8_t b = UART0_DR_R & 0xFF;  // read data
        xQueueSendFromISR(xUartRxQueue, &b, &woken);
    }

    portYIELD_FROM_ISR(woken);
}
*/
uint8_t uart_getc(void) {
    while (UART0_FR_R & UART_FR_RXFE) {
        vTaskDelay(pdMS_TO_TICKS(10));  //avoid blocking on uart poll by yielding (caller task) through delay
    }
    return (uint8_t)(UART0_DR_R & 0xFF);
}

