/***************** Header ********************/
/*********************************************
 * University of Southern Denmark
 * Embedded C Programming (ECP)
 *
 * MODULENAME: init_spi.c
 * PROJECT: Control of a pan-tilt system
 * DESCRIPTION: ---
 * Change Log:
***********************************************
* Date    Id    Change
* YYMMDD: 2025/12/03
* --------------------
 *********************************************/

/***************** Include files ******************/
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
/***************** Defines ********************/
/***************** Constants ******************/
/***************** Variables ******************/
/***************** Functions ******************/

void SPI_init(void){
    /*******************************************************************
    To enable and initialize the SSI, the following steps are necessary:
    Enable the SSI module using the RCGCSSI register (see page 345).
    **********************************************************************/

    SYSCTL_RCGCSSI_R = (1<<2); //Enable and provide a clock to SSI module 2 in Run mode

    /****************************************************************************************
    Enable the clock to the appropriate GPIO module via the RCGCGPIO register (see page 339).
    To find out which GPIO port to enable, refer to Table 23-5 on page 1346.
    ******************************************************************************************/

    SYSCTL_RCGCGPIO_R1 = 1; //Due to the use of module 2: enable and provide a clock to the GPIO Port B in Run mode

    /*******************************************************************************************
    Set the GPIO AFSEL bits for the appropriate pins (see page 669). To determine which GPIOs to
    configure, see Table 23-4 on page 1339
    *********************************************************************************************/

    GPIO_PORTB_AFSEL_R |= (1 << 4) | (1 << 5) | (1 << 6) | (1 << 7); // The associated pin functions as a peripheral signal and is controlled by the alternate hardware function

    /**********************************************************************************************
    Configure the PMCn fields in the GPIOPCTL register to assign the SSI signals to the appropriate
    pins. See page 686 and Table 23-5 on page 1346.
    ***********************************************************************************************/

    GPIO_PORTB_PCTL_R |= (2 << 16) | (2 << 20) | (2 << 24) | (2 << 28); //Controls the configurations for the GPIO pins 4, 5, 6, 7

    /**************************************************************************************************
    Program the GPIODEN register to enable the pin's digital function. In addition, the drive strength,
    drain select and pull-up/pull-down functions must be configured. Refer to “General-Purpose
    Input/Outputs (GPIOs)” on page 648 for more information.
    Note: Pull-ups can be used to avoid unnecessary toggles on the SSI pins which can take the
    slave to a wrong state. (ALL GPIO SIGNALS ARE 5-V TOLERANT)
    ****************************************************************************************************/

    GPIO_PORTB_DEN_R |= (1 << 4) | (1 << 5) | (1 << 6) | (1 << 7); //Enabling pins PB4 to PB7

    /**************************************************************************************************
    For each of the frame formats, the SSI is configured using the following steps:
    Ensure that the SSE bit in the SSICR1 register is clear before making any configuration changes.
    ****************************************************************************************************/

    SSI2_CR1_R &= ~(1 << 1); // SSE bit(1) cleared

    /**************************************************************************************************
    Select whether the SSI is a master or slave:
    For master operations, set the SSICR1 register to 0x0000.0000.
    ****************************************************************************************************/

    SSI2_CR1_R = 0x00000000; // Selecting SSI as master

    /**************************************************************************************************
    Configure the SSI clock source by writing to the SSICC register.
    ****************************************************************************************************/

    SSI2_CC_R = 0x0; // System clock (based on clock source and divisor factor)

    /**************************************************************************************************
    Configure the clock prescale divisor by writing the SSICPSR register.
    ****************************************************************************************************/

    SSI2_CPSR_R = 4; //Clock prescaler set to 4 (16MHz / 4 = 4MHz)

    /**************************************************************************************************
    Write the SSICR0 register with the following configuration:
     *Serial clock rate (SCR)
     *Desired clock phase/polarity, if using Freescale SPI mode (SPH and SPO)
     *The protocol mode: Freescale SPI, TI SSF, MICROWIRE (FRF)
     *The data size (DSS)
    ****************************************************************************************************/

    SSI2_CR0_R = (0xF << 0);
    /*Serial clock rate (SCR) set to 0, mode 0 is used (SPH=0 and SPO=0), protocol mode Freescale SPI is used
     * and data size is set to 16 bits (if 8 bits set (0x7 << 0))*/

    /**************************************************************************************************
    Optionally, configure the microDMA channel (see “Micro Direct Memory Access (microDMA)” on page 584)
    and enable the DMA option(s) in the SSIDMACTL register. (NOT CONFIGURED)
    ****************************************************************************************************/

    /**************************************************************************************************
    Enable the SSI by setting the SSE bit in the SSICR1 register.
    ****************************************************************************************************/

    SSI2_CR1_R |= (1 << 1); // SSE bit(1) set

}

void SPI_write(INT16U data){

    GPIO_PORTB_DATA_BITS_R &= ~(1 << 5); //Slave select bit is set to low, causing slave data to be enabled onto SSI2Rx
    while(SSI2_SR_R & (1 << 0) == 0); //Waits until transmit FIFO is not empty/ready
    SSI2_DR_R = data; //Transmit data via SPI
    while(SSI2_SR_R & (1 << 1) == 0); //Wait until transmit FIFO is full/transmission complete
    GPIO_PORTB_DATA_BITS_R |= (1 << 5); //Slave select bit is set to high to end communication

}

/************* Code from source (creates software delay) **********/
void Delay_ms(int time_ms)
{
    int i, j;
    for(i = 0; i < time_ms; i++)  // Outer loop for the number of milliseconds
        for(j = 0; j < 3180; j++) // Inner loop to generate delay for 1 ms
            {}  // Empty loop (NOP) for creating delay
}
/****************************** End Of Module *******************************/
