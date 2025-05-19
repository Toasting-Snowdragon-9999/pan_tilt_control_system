/*
 * spi.c
 *
 *  Created on: 11 May 2025
 *      Author: linax
 */

#include "spi.h"

void SPI_init(void){
    /*******************************************************************
       To enable and initialize the SSI, the following steps are necessary:
       Enable the SSI module using the RCGCSSI register (see page 345).
       **********************************************************************/

       SYSCTL_RCGCSSI_R |= SYSCTL_RCGCSSI_R2; //Enable and provide a clock to SSI module 2 in Run mode

       /****************************************************************************************
       Enable the clock to the appropriate GPIO module via the RCGCGPIO register (see page 339).
       To find out which GPIO port to enable, refer to Table 23-5 on page 1346.
       ******************************************************************************************/

       SYSCTL_RCGCGPIO_R |= SYSCTL_RCGCGPIO_R1; //Due to the use of module 2: enable and provide a clock to the GPIO Port B in Run mode

       /*******************************************************************************************
       Set the GPIO AFSEL bits for the appropriate pins (see page 669). To determine which GPIOs to
       configure, see Table 23-4 on page 1339
       *********************************************************************************************/

       GPIO_PORTB_AFSEL_R |= (1 << 4) | (1 << 5) | (1 << 6) | (1 << 7); // The associated pin functions as a peripheral signal and is controlled by the alternate hardware function

       //GPIO_PORTB_AMSEL_R &= ~(0xF0); //Disabler analog func i pins


       /**********************************************************************************************
       Configure the PMCn fields in the GPIOPCTL register to assign the SSI signals to the appropriate
       pins. See page 686 and Table 23-5 on page 1346.
       ***********************************************************************************************/

       GPIO_PORTB_PCTL_R |= GPIO_PCTL_PB4_SSI2CLK | GPIO_PCTL_PB5_SSI2FSS | GPIO_PCTL_PB6_SSI2RX | GPIO_PCTL_PB7_SSI2TX; //Controls the configurations for the GPIO pins 4, 5, 6, 7

       /**************************************************************************************************
       Program the GPIODEN register to enable the pin's digital function. In addition, the drive strength,
       drain select and pull-up/pull-down functions must be configured. Refer to �General-Purpose
       Input/Outputs (GPIOs)� on page 648 for more information.
       Note: Pull-ups can be used to avoid unnecessary toggles on the SSI pins which can take the
       slave to a wrong state. (ALL GPIO SIGNALS ARE 5-V TOLERANT)
       ****************************************************************************************************/

       GPIO_PORTB_DEN_R |= (1 << 4) | (1 << 5) | (1 << 6) | (1 << 7); //Enabling pins PB4 to PB7

       /**************************************************************************************************
       For each of the frame formats, the SSI is configured using the following steps:
       Ensure that the SSE bit in the SSICR1 register is clear before making any configuration changes.
       ****************************************************************************************************/

       SSI2_CR1_R &= ~(SSI_CR1_SSE); // SSE bit(1) cleared

       /**************************************************************************************************
       Select whether the SSI is a master or slave:
       For master operations, set the SSICR1 register to 0x0000.0000.
       ****************************************************************************************************/

       SSI2_CR1_R &= ~(SSI_CR1_MS); // Selecting SSI as master

       /**************************************************************************************************
       Configure the SSI clock source by writing to the SSICC register.
       ****************************************************************************************************/

       SSI2_CC_R = 0x00; // System clock (based on clock source and divisor factor)

       /**************************************************************************************************
       Configure the clock prescale divisor by writing the SSICPSR register.
       ****************************************************************************************************/

       SSI2_CPSR_R = 20; //Clock prescaler set to 2

       /**************************************************************************************************
       Write the SSICR0 register with the following configuration:
        *Serial clock rate (SCR)
        *Desired clock phase/polarity, if using Freescale SPI mode (SPH and SPO)
        *The protocol mode: Freescale SPI, TI SSF, MICROWIRE (FRF)
        *The data size (DSS)
       ****************************************************************************************************/
       SSI2_CR0_R |= SSI_CR0_DSS_16 |  0x0100 | SSI_CR0_SPH | SSI_CR0_SPO; // Mode 3 is used and the master clk is set to 4 MHz(16MHz/(2*(1+1)))


       /*Serial clock rate (SCR) set to 0, mode 0 is used (SPH=0 and SPO=0), protocol mode Freescale SPI is used
        * and data size is set to 16 bits (if 8 bits set (0x7 << 0))*/

       /**************************************************************************************************
       Optionally, configure the microDMA channel (see �Micro Direct Memory Access (microDMA)� on page 584)
       and enable the DMA option(s) in the SSIDMACTL register. (NOT CONFIGURED)
       ****************************************************************************************************/

       /**************************************************************************************************
       Enable the SSI by setting the SSE bit in the SSICR1 register.
       ****************************************************************************************************/

       SSI2_CR1_R |= SSI_CR1_SSE; // SSE bit(1) set

}



void SPI_write(INT16U data){

    //GPIO_PORTB_DATA_R &= ~(1 << 5); //Slave select bit is set to low, causing slave data to be enabled onto SSI2Rx
    while((SSI2_SR_R & SSI_SR_TNF) == 0); //Waits until transmit FIFO is empty/ready
    SSI2_DR_R = data; //Transmit data via SPI
    while(SSI2_SR_R & SSI_SR_BSY); //Wait until transmit FIFO is idle/transmission complete
    //GPIO_PORTB_DATA_R |= (1 << 5); //Slave select bit is set to high to end communication

}

INT16U SPI_read(void){

    //GPIO_PORTB_DATA_R &= ~(1 << 5); //Slave select bit is set to low, causing slave data to be enabled onto SSI2Rx
    while((SSI2_SR_R & SSI_SR_RFF) == 1); //Waits until receive FIFO is not empty/is full
    INT16U data = SSI2_DR_R; //Transmit data via SPI
    while(SSI2_SR_R & SSI_SR_BSY); //Wait until receive FIFO is full/receive complete
    //GPIO_PORTB_DATA_R |= (1 << 5); //Slave select bit is set to high to end communication
    return data;
}

void spi_info_init(struct spi_info *spi_info){

    spi_info->tx = 0x0001;
    spi_info->rx = 0x0000;
    spi_info->semaphore = xSemaphoreCreateMutex();

}

void set_spi_tx(struct spi_info* spi_info, uint16_t message)
{
    if(xSemaphoreTake(spi_info->semaphore, portMAX_DELAY)) {
        spi_info->tx = message;
        xSemaphoreGive(spi_info->semaphore);
    }
}
uint16_t get_spi_rx(struct spi_info* spi_info)
{
    uint16_t message = 0;
    if(xSemaphoreTake(spi_info->semaphore, portMAX_DELAY)) {
        message = spi_info->rx;
        xSemaphoreGive(spi_info->semaphore);
    }
    return message;
}

void spi_task(void *pvParameter)
{
    struct spi_info* spi_info = (struct spi_info*)pvParameter;
    for(EVER){

        if(xSemaphoreTake(spi_info->semaphore, portMAX_DELAY)) {
            SPI_write(spi_info->tx);
            spi_info->rx = SPI_read();
            xSemaphoreGive(spi_info->semaphore);
        }
        vTaskDelay(5 / portTICK_RATE_MS);
    }
}
