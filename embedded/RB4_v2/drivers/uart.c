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
//#define UART_IFLS_RX_2B   (0x0 << 3)      /* 1/8 */
//  #define UART_IFLS_TX_2B   (0x0 << 0)
#define UART_IFLS_RX1_8  (0x0 << 3)
#define UART_IFLS_TX1_8  (0x0 << 0)


static SemaphoreHandle_t xUart1Mutex; //for uart1_print
char buf[80]; //for uart1_print

// enable clocks for UART0 (PA)
static void _enable_uart0(void) {
    SYSCTL_RCGCGPIO_R |= (1 << 0);
    SYSCTL_RCGCUART_R |= (1 << 0);
    while (!(SYSCTL_PRGPIO_R & (1 << 0)));
    while (!(SYSCTL_PRUART_R & (1 << 0)));
}
// enable clocks for UART1 (PB)
static void _enable_uart1(void) {
    SYSCTL_RCGCGPIO_R |= (1 << 1);
    SYSCTL_RCGCUART_R |= (1 << 1);
    while (!(SYSCTL_PRGPIO_R & (1 << 1)));
    while (!(SYSCTL_PRUART_R & (1 << 1)));
}
/*
// UART0 init + I/O (no mutex)
void uart0_init(INT32U baud) {
    _enable_uart0();
    // PA0=RX, PA1=TX
    GPIO_PORTA_LOCK_R   = 0x4C4F434B;
    GPIO_PORTA_CR_R    |= 0x03;
    GPIO_PORTA_AFSEL_R |= 0x03;
    GPIO_PORTA_PCTL_R   = (GPIO_PORTA_PCTL_R & ~0xFF) | 0x11;
    GPIO_PORTA_DEN_R   |= 0x03;
    GPIO_PORTA_DIR_R    = (GPIO_PORTA_DIR_R & ~0x01) | 0x02;

    UART0_CTL_R &= ~UART_CTL_UARTEN | UART_LCRH_FEN;
    INT32U ibrd = 16000000 / (16 * baud);
    INT32U fbrd = (INT32U)((((16000000.0f/(16.0f*baud)) - ibrd) * 64) + 0.5f);
    UART0_IBRD_R = ibrd;
    UART0_FBRD_R = fbrd;
    UART0_LCRH_R = UART_LCRH_WLEN_8;
    UART0_CTL_R  = UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE;
}*/

/* RX  = 1/8-full  (≈ 2 bytes)
   TX  = 1/8-empty (default) */


void uart0_init(INT32U baud)
{
    _enable_uart0();                      /* clocks ON */

    /* ---------- PA0 = U0RX  |  PA1 = U0TX ---------- */
    GPIO_PORTA_LOCK_R   = 0x4C4F434B;     /* unlock CR register           */
    GPIO_PORTA_CR_R    |= 0x03;           /* allow changes to PA1-0       */
    GPIO_PORTA_AFSEL_R |= 0x03;           /* turn on alt-func for PA1-0   */
    GPIO_PORTA_PCTL_R   = (GPIO_PORTA_PCTL_R & ~0xFF) | 0x11; /* mux = UART */
    GPIO_PORTA_DEN_R   |= 0x03;           /* digital enable               */
    GPIO_PORTA_DIR_R    = (GPIO_PORTA_DIR_R & ~0x01) | 0x02;  /* PA0 in, PA1 out */

    /* ---------- normal UART setup (unchanged) ---------- */
    UART0_CTL_R &= ~UART_CTL_UARTEN;          /* disable while configuring */

    INT32U ibrd = 16000000 / (16 * baud);
    INT32U fbrd = (INT32U)((((16000000.0f / (16.0f * baud)) - ibrd) * 64)+0.5f);

    UART0_IBRD_R = ibrd;
    UART0_FBRD_R = fbrd;

    UART0_LCRH_R = UART_LCRH_WLEN_8 | UART_LCRH_FEN;   /* 8-N-1, FIFO on  */
    UART0_IFLS_R = UART_IFLS_RX1_8 | UART_IFLS_TX1_8;  /* RX trig ≈ 2 B   */

    /* leave UART0_IM_R.RXIM = 0 → no interrupt, but RXRIS still works    */

    UART0_CTL_R  = UART_CTL_UARTEN | UART_CTL_RXE | UART_CTL_TXE;
}

BOOLEAN uart0_ready(void){
    //return !(UART0_MIS_R & UART_MIS_RXMIS);
    return (UART0_RIS_R & UART_RIS_RXRIS) != 0; /* raw, _unmasked_ flag */
}

/*
BOOLEAN uart0_ready(void){
    return !(UART0_FR_R & UART_FR_RXFE);
}*/

INT8S uart0_getc(void) {
     return (INT8S)(UART0_DR_R & 0xFF);
}

/*INT16S uart0_get16(void)
{
    INT8S hi, lo;

    taskENTER_CRITICAL();          // protect the HW register access
    hi = uart0_getc();             // first byte is already there
    taskEXIT_CRITICAL();           // done with the register

     Now wait for the second byte – no critical section!
    while (!uart0_ready())         // or xSemaphoreTake(), etc.
        //vTaskDelay(pdMS_TO_TICKS(1));

    taskENTER_CRITICAL();          // quick, fetch the byte
    lo = uart0_getc();
    taskEXIT_CRITICAL();

    return ((INT16S)lo << 8) | hi;
}*/
/*INT16S uart0_get16(void) {
    taskENTER_CRITICAL();
    INT8S lo  = uart0_getc(); // wait for next byte
    INT8S hi = uart0_getc(); //mayeb change??/ test
       taskEXIT_CRITICAL();
    return (INT16S)((lo << 8) | hi);
}*/
BOOLEAN uart0_get16(INT16S *value){
    if (!uart0_ready())             /* nothing yet?  →  false    */
           return 0;

    INT16S hi = UART0_DR_R & 0xFF;
    INT16S lo = UART0_DR_R & 0xFF;
       *value = ((INT16S)hi << 8) | lo;
       return 1;
}
/*
void uart0_send16(uint16_t v) {
    uart0_putc((uint8_t)(v & 0xFF));
    uart0_putc((uint8_t)(v >> 8));
}*/
/*void uart0_putc(INT8U b) {
    while (UART0_FR_R & UART_FR_TXFF);
    UART0_DR_R = b;
}*/

// UART1 init + I/O + mutex-protected print
void uart1_init(INT32U baud) {
    _enable_uart1();
    // PB0=RX, PB1=TX
    GPIO_PORTB_LOCK_R   = 0x4C4F434B;
    GPIO_PORTB_CR_R    |= 0x03;
    GPIO_PORTB_AFSEL_R |= 0x03;
    GPIO_PORTB_PCTL_R   = (GPIO_PORTB_PCTL_R & ~0xFF) | 0x11;
    GPIO_PORTB_DEN_R   |= 0x03;
    GPIO_PORTB_DIR_R    = (GPIO_PORTB_DIR_R & ~0x01) | 0x02;

    UART1_CTL_R &= ~UART_CTL_UARTEN;
    INT32U ibrd1 = 16000000 / (16 * baud);
    INT32U fbrd1 = (INT32U)((((16000000.0f/(16.0f*baud)) - ibrd1) * 64) + 0.5f);
    UART1_IBRD_R = ibrd1;
    UART1_FBRD_R = fbrd1;
    UART1_LCRH_R = UART_LCRH_WLEN_8 | UART_LCRH_FEN; //fifo needed?
    UART1_CTL_R  = UART_CTL_UARTEN | UART_CTL_TXE | UART_CTL_RXE;

    xUart1Mutex = xSemaphoreCreateMutex();
}
/*INT8U uart1_getc(void) {
  // no ready func yet  while (!(UART1_FR_R & UART_FR_RXFE));
    return (INT8U)(UART1_DR_R & 0xFF);
}*/
/*
INT16U uart1_get16(void) {
    taskENTER_CRITICAL();
    INT8U hi = uart1_getc(); //maybe test/change?
    INT8U lo = uart1_getc();
    taskEXIT_CRITICAL();
    return (INT16U)((hi << 8) | lo);
}
*/
void uart1_putc(INT8U b) {
    while (UART1_FR_R & UART_FR_TXFF); //needed?
    UART1_DR_R = b;
}

void uart1_send16(INT16U v) {
    uart1_putc((INT8U)(v & 0xFF));
    uart1_putc((INT8U)(v >> 8));
}
void uart1_print(const char *fmt, ...) {
    if (xSemaphoreTake(xUart1Mutex, portMAX_DELAY) == pdTRUE) {
        va_list ap;
        va_start(ap, fmt);
        vsnprintf(buf, sizeof(buf), fmt, ap);
        va_end(ap);
        char *p = buf;
        for (; *p; ++p)
            uart1_putc((INT8U)*p);
        xSemaphoreGive(xUart1Mutex);
    }
}

static char _binbuf[17];  // 16 bits + NUL
const char *rx_binary_string(INT16U v) {
   int i;
    for (i = 0; i < 16; i++) {
        // Extract bit 15 down to 0 in order
        _binbuf[i] = (v & (1 << (15 - i))) ? '1' : '0';
    }
    _binbuf[16] = '\0';
    return _binbuf;
}
