#include "common.h"
#include "uart_config.h"

void uart_init(uint32_t baud, uint8_t dbits, uint8_t sbits, uint8_t parity)
{
    //turn on UART0 & GPIOA clocks
    SYSCTL_RCGCUART_R |= (1<<0);
    SYSCTL_RCGCGPIO_R |= (1<<0);


    //Configure PA0->Rx, PA1->Tx
    GPIO_PORTA_LOCK_R = 0x4C4F434B;
    GPIO_PORTA_CR_R  |= 0x03;
    GPIO_PORTA_AFSEL_R |= 0x03;
    GPIO_PORTA_PCTL_R  = (GPIO_PORTA_PCTL_R & ~0xFF) | 0x11;
    GPIO_PORTA_DEN_R  |= 0x03;
    GPIO_PORTA_DIR_R  |= 0x02;  // PA1 out, PA0 in

    //Baud divisor (16 MHz clock)
    uint32_t ibrd = 16000000 / (16 * baud);
    float    frac = (16000000/(16.0f*baud) - ibrd)*64 + 0.5f;
    UART0_IBRD_R = ibrd;
    UART0_FBRD_R = (uint32_t)frac;

    //8 databits-No parity-1 stop bit, FIFO on (16 byte buffer)
    UART0_LCRH_R = (0x60) | (1<<4);

    //UART0_LCRH_R &= ~UART_LCRH_FEN;             // Disable FIFO (FIFO Enable bit = 0)

    //Enable UART, Rx & Tx
    UART0_CTL_R |= (1<<0) | (1<<8) | (1<<9);

    //Clear any pending, enable only the RX interrupt
    UART0_ICR_R = (1<<4);        // clear RX
    UART0_IM_R  = (1<<4);        // un-mask RX interrupt

    //Enable in NVIC (irq #5)
    NVIC_EN0_R |= (1<<5);
}
/*
extern void uart_write(char data){
    //while((UART0_FR_R&UART_FR_TXFF) != 0);    // UART Transmit FIFO Full
    UART0_DR_R = data;
}

extern char uart_read(void){
    while((UART0_FR_R&UART_FR_RXFE) != 0);    // UART Receive FIFO Empty
    return((char)(UART0_DR_R&0xFF));          // When read, this field contains the data that was received by the UART.
}
*/

//uart rx method
uint8_t uart_getc(void) {
    while (UART0_FR_R & UART_FR_RXFE) { //when RXFE = 0 at least one byte has arrived, exit loop
                                        //fifo works as 16 bit hardware queue?
        vTaskDelay(pdMS_TO_TICKS(10));  //avoid blocking on uart poll by yielding (caller task) through delay
    }
    return (uint8_t)(UART0_DR_R & 0xFF);
}


//uart tx method
void uart_putc(uint8_t b)
{
    while( UART0_FR_R & (1<<5) ) {}   // wait TX FIFO not full (blocking)
    UART0_DR_R = b;
}

//no fifo method
/*
void uart_putc(char c)
{
    while((UART0_FR_R&UART_FR_TXFF) != 0);
    UART0_DR_R = c;
}*/

// "printf-style" uart print
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

void uart_send_double(double value)
{
    uint8_t *p = (uint8_t *)&value;
    int i;
    for ( i = 0; i < sizeof(double); i++) {
        uart_putc(p[i]);  // Send each byte over UART
    }
}
/*
void uart_send_16int(INT16U value)
{
    INT8U lsb= value & 0x00FF;
    INT8U temp = value & 0xFF00;
    INT8U msb = (temp>>8);

        uart_putc(msb);  // Send msb byte over UART
        uart_putc(lsb);  // Send lsb byte over UART
}
*/
void uart_send_16int(INT16U value)
{
    uint8_t *p = (uint8_t *)&value;
    int i;
    for ( i = 0; i < sizeof(INT16U); i++) {
        uart_putc(p[i]);  // Send each byte over UART
    }
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
