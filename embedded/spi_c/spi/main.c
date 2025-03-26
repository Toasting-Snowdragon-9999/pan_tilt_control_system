
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
/***************** Defines ********************/
/***************** Constants ******************/

/***************** Variables ******************/
int main(void)
{
    INT16U test_word1 = 0b1111110001010100;
    INT16U test_word2 = 0b0110101101010111;
    int sec = 1000;
    SPI_init(); //Initialize the SPI2 module and its related GPIO pins

    while(1){
        SPI_write(test_word1);
        Delay_ms(sec); //Wait 1 second
        SPI_write(test_word2);
        Delay_ms(sec); //Wait 1 second
    }
    return 0;
}

/***************** End of module **************/
