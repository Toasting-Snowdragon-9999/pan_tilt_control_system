/*
 * map.c
 *
 *  Created on: 7 May 2025
 *      Author: linax
 */

#include "common.h"
#include "map.h"

//task handles ligegyldige de er i common?
//pass som struct?
QueueHandle_t xPanCtrlInQueue;
QueueHandle_t xTiltCtrlInQueue;

QueueHandle_t xPanCtrlOutQueue;
QueueHandle_t xTiltCtrlOutQueue;

QueueHandle_t xSpiRxQueue;
QueueHandle_t xSpiTxQueue;

QueueHandle_t xUartRxQueue;
QueueHandle_t xUartTxQueue;



INT16U CreateFrame(INT8U panDir, INT8U panSpeed, INT8U tiltDir, INT8U tiltSpeed){ //From TIVA to FPGA
    INT16U Frame = 0b0000000000000000;
    Frame &= 0x0000;

    Frame     |=(0 << 15)                 //start bit = 0
               | (0 << 14) | (0 << 13)
               |((panDir & 0x01) << 12)     //1 bit
               |((panSpeed & 0x1F) << 7)   //5 bit
               |((tiltDir & 0x01) << 6)     //1 bit
               |((tiltSpeed & 0x1F) << 1)  //5 bit
               |(1 << 0);                  //stop bit = 1


    return Frame;
} //specifiy unsigned values?

void UnpackVisionFrame(INT16S Frame, INT8S *panVal, INT8S *tiltVal){ //From FPGA to TIVA (And vision to TIVA)

    //shift MSB of EncoderFrame into panVal
    *panVal = (INT8S)(((uint16_t)Frame >> 8) & 0xFFu);
    //shift LSB of EncoderFrame into tiltVal
       *tiltVal = (INT8S)((uint16_t)Frame & 0xFFu);

}
void UnpackEncoderFrame(INT16S Frame, INT8S *panVal, INT8S *tiltVal){ //From FPGA to TIVA (And vision to TIVA)
  //  uart1_print("\r\Frame: 0x%04x, 0b%s, d:%d \r\n", Frame, rx_binary_string(Frame), Frame);
    //shift MSB of EncoderFrame into panVal
    *panVal = (INT8S)(((uint16_t)Frame >> 8) & 0xFFu);
    //shift LSB of EncoderFrame into tiltVal
       *tiltVal = (INT8S)((uint16_t)Frame & 0xFFu);


//       uart1_print("\r\panVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string(panVal), panVal);
  //     uart1_print("\r\tiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string(tiltVal), tiltVal);

}


/* Option 1: pass by value – simplest */
void tiva_fpga_map_pan(INT32S  pid_output_pan, //TILT
                       INT8U  *pid_speed_pan,
                       INT8U  *pid_dir_pan)
{
    *pid_speed_pan = (INT8U)(abs(pid_output_pan) / pan_step_increment) & 0x1F;
    *pid_dir_pan   = pid_output_pan < 0 ? PAN_DIR_LEFT : PAN_DIR_RIGHT;
/*
    if(*pid_speed_pan >= 1 && pid_speed_pan <= 20){
            *pid_speed_pan = 20;
        }
*/
  if(*pid_speed_pan >= 1){
        *pid_speed_pan+=11;
    }

    if(*pid_speed_pan >= 20){
           *pid_speed_pan =20;
   }



}


void tiva_fpga_map_tilt(INT32S  pid_output_tilt, //PAN
                        INT8U  *pid_speed_tilt,
                        INT8U  *pid_dir_tilt)
{
    *pid_speed_tilt = (INT8U)(abs(pid_output_tilt) / tilt_step_increment) & 0x1F;
    *pid_dir_tilt   =  pid_output_tilt < 0 ? TILT_DIR_UP : TILT_DIR_DOWN;

    /*if(*pid_speed_tilt >= 1 && pid_speed_tilt <= 20){
               *pid_speed_tilt = 20;
           }*/

      if(*pid_speed_tilt >= 20){
            *pid_speed_tilt =20;
    }

      if(*pid_speed_tilt >= 1){
            *pid_speed_tilt+=7;
    }
}


