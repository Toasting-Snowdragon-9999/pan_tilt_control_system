
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
    //INT16U test_word1 = 0b1111110001010100;
    INT16U test_word2 = 0b0111101010100010;
  //INT16U test_word2 = 0b0111000000000000;
    SPI_init(); //Initialize the SPI2 module and its related GPIO pins
    //SPI_init_slave();
   // uart0_init(9600, 8, 1, 'n');
//    INT8U test_uart = '\0';
    //SPI_write(0b0000000000000000);
    //SPI_write(0b0000000000000000);
   // while(1){
          //while(!uart0_rx_rdy());
//        if(uart0_rx_rdy()){
//            test_uart = uart0_getc();
//        }
//        if(test_uart != '\0'){
//            SPI_write(test_uart);
//        }
//    INT8U lsb_8;
    INT8U msb_8;
    INT16U msb;
    while(1){
        SPI_write(test_word2);
        //msb = SPI_read();

        //msb_8 = msb;//(unsigned char)(unsigned short)msb;

        //while(!uart0_tx_rdy());
            //lsb_8 = SPI_read() & 0x00FF;
            //uart0_putc(lsb_8);
           // Delay_ms(10);
        //if(uart0_tx_rdy()){
           // uart0_putc(msb_8);
           // Delay_ms(10);
        //}

    }

//        if(uart0_tx_rdy()){
//                uart0_putc(SPI_read());
//        }
        //Delay_ms(sec); //Wait 1 second
          //while(!uart0_tx_rdy());¨
//       uart0_putc( test_uart );
      // Delay_ms(10);
//       test_uart = '\0';



      //  Delay_ms(100); //Wait 1 second
   // }
    return 0;
}

/***************** End of module **************/
