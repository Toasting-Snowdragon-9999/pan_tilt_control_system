
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
#include "init_spi"
/***************** Defines ********************/
/***************** Constants ******************/
INT16U test_word1 = "1010100";
INT16U test_word2 = "111000";
int sec = 1000;
/***************** Variables ******************/
int main(void)
{
    SPI_init(); //Initialize the SPI2 module and its related GPIO pins

    SPI_write(test_word1);
    Delay_ms(sec); //Wait 1 second
    SPI_write(test_word2);
    Delay_ms(sec); //Wait 1 second
	return 0;
}

/***************** End of module **************/
