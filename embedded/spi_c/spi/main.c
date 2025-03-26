
/***************** Header ********************/
/*********************************************
 * University of Southern Denmark
 * Embedded Programming (EMP)
 *
 * MODULENAME: main.c
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
#include "init_spi.h"
#include "uart0.h"
/***************** Defines ********************/
/***************** Constants ******************/

/***************** Variables ******************/
int main(void)
{
    INT16U test_word1 = 0b1111110001010100;
    INT16U test_word2 = 0b0110101101010111;
    int sec = 1000;
    SPI_init(); //Initialize the SPI2 module and its related GPIO pins
    uart0_init(9600, 8, 1, 'n');
    INT8U test_uart = '\0';
    int i;

    while(1){
          //while(!uart0_rx_rdy());
        if(uart0_rx_rdy()){
        test_uart = uart0_getc();
        }
        if(test_uart != '\0'){
          SPI_write(test_uart);
        }
        //Delay_ms(sec); //Wait 1 second
          //while(!uart0_tx_rdy());
       uart0_putc( test_uart );
       Delay_ms(100); //Wait 1 second
       test_uart = '\0';


        //SPI_write(test_word2);
        //Delay_ms(sec); //Wait 1 second
    }
    return 0;
}

/***************** End of module **************/
