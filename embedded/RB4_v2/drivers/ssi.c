#include "ssi.h"
#include "common.h"

extern QueueHandle_t uart_queue_in;
extern QueueHandle_t uart_queue_out;
extern QueueHandle_t spi_queue_in;
extern QueueHandle_t spi_queue_out;
//extern QueueHandle_t control_queue;
// SSI2 Interrupt Handler
void ssi_handler(void) { // mangler noget interrupt pï¿½ RX pï¿½ et tidspunkt.
}



void init_ssi(void) {
    // Enable the clock for SSI2
    SYSCTL_RCGCSSI_R |= SYSCTL_RCGCSSI_R3;  // Enable SSI2 clock
    while ((SYSCTL_PRSSI_R & SYSCTL_PRSSI_R3) == 0);  // Wait for SSI3 to be ready

    // Enable the clock for GPIO Port D
    SYSCTL_RCGCGPIO_R |= SYSCTL_RCGCGPIO_R3;  // Enable GPIOD clock
    while ((SYSCTL_PRGPIO_R & SYSCTL_PRGPIO_R3) == 0);  // Wait for GPIOD to be ready

    // Configure PD0, PD1, PD2, PD3 for SSI2
    GPIO_PORTD_AFSEL_R |= 0x0F;  // Enable alternate function on PD0–PD3
    GPIO_PORTD_PCTL_R &= ~0x0000FFFF;  // Clear PCTL for PD0–PD3
    GPIO_PORTD_PCTL_R |= (GPIO_PCTL_PD0_SSI3CLK |
                          GPIO_PCTL_PD1_SSI3FSS |
                          GPIO_PCTL_PD2_SSI3RX  |
                          GPIO_PCTL_PD3_SSI3TX);
    GPIO_PORTD_DEN_R |= 0x0F;    // Enable digital function on PD0–PD3
    GPIO_PORTD_AMSEL_R &= ~0x0F; // Disable analog function on PD0–PD3

    // Disable SSI2 before configuration
    SSI3_CR1_R &= ~SSI_CR1_SSE;  // Disable SSI2
    SSI3_CR1_R &= ~SSI_CR1_MS;   // Set to master mode
    SSI3_CC_R = SSI_CC_CS_PIOSC; // Use internal oscillator

    // Configure clock rate (125kHz example)
    SSI3_CPSR_R = 8;  // Clock prescale divisor
    SSI3_CR0_R &= ~(SSI_CR0_SCR_M);  // Clear SCR
    SSI3_CR0_R |= (15 << SSI_CR0_SCR_S);  // Set SCR

    // SPI mode: CPOL = 0, CPHA = 1 (Mode 1)
    SSI3_CR0_R |= SSI_CR0_SPH;
    SSI3_CR0_R &= ~SSI_CR0_SPO;

    // Data size: 13 bits
    SSI3_CR0_R |= SSI_CR0_DSS_16;

    // Enable SSI2
    SSI3_CR1_R |= SSI_CR1_SSE;
}












// Function to send and receive a byte of data over SPI
void spi_transmit(INT16U data) {
    //while (!(SSI3_SR_R & SSI_SR_TNF)) {} // Wait until TX FIFO not full
    SSI3_DR_R = data;
}

INT16U spi_receive(void) {
    // Wait until the RX FIFO has data available
    while ((SSI3_SR_R & SSI_SR_RNE) == 0) {}  // Receive FIFO not empty in SSI status Register

    // Return the received byte
    return (INT16U)SSI3_DR_R;
}
/*
extern BOOLEAN spi_rx_rdy() {
    return ((SSI3_SR_R & SSI_SR_TNF));
}

extern BOOLEAN spi_tx_rdy() {
    return ((SSI3_SR_R & SSI_SR_RNE));
}

void spi_task_transmit(void *pvParameters) {
    INT16U spi_data_transmit;
    while (1) {
        if (xQueueReceive(spi_queue_out, &spi_data_transmit, pdMS_TO_TICKS(TICK_WAIT_DELAY)) == pdPASS) { // pdMS_TO_TICKS(100)
            spi_transmit(spi_data_transmit); // Transmit the data from queue over SPI
         }
        vTaskDelay(TICK_MAX_DELAY); // wait TICK_MAX_DELAY ms.
    }
}


void spi_task_receive(void *pvParameters) {
    INT16U spi_data_receive;
    while(1) {
        if ( spi_rx_rdy() ) {
            spi_data_receive = spi_receive();
            if (xQueueSend(spi_queue_in, &spi_data_receive, pdMS_TO_TICKS(TICK_WAIT_DELAY)) == pdTRUE) {

            }
            vTaskDelay(TICK_MAX_DELAY); // wait TICK_MAX_DELAY ms.
        }
    }
}

*/
