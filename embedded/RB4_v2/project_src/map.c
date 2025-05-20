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

    //shift MSB of EncoderFrame into panVal
    *panVal = (INT8S)(((uint16_t)Frame >> 8) & 0xFFu);
    //shift LSB of EncoderFrame into tiltVal
       *tiltVal = (INT8S)((uint16_t)Frame & 0xFFu);



}


/* Option 1: pass by value – simplest */
void tiva_fpga_map_pan(INT32S  pid_output_pan,
                       INT8U  *pid_speed_pan,
                       INT8U  *pid_dir_pan)
{
    *pid_speed_pan = (INT8U)(abs(pid_output_pan) / pan_step_increment) & 0x1F;

    if(*pid_speed_pan >= 5){
        *pid_speed_pan+=6;
    }

    *pid_dir_pan   = pid_output_pan < 0 ? PAN_DIR_LEFT : PAN_DIR_RIGHT;

}


void tiva_fpga_map_tilt(INT32S  pid_output_tilt,
                        INT8U  *pid_speed_tilt,
                        INT8U  *pid_dir_tilt)
{
    *pid_speed_tilt = (INT8U)(abs(pid_output_tilt) / tilt_step_increment) & 0x1F;
    *pid_dir_tilt   =  pid_output_tilt < 0 ? TILT_DIR_UP : TILT_DIR_DOWN;

    if(*pid_speed_tilt >= 5){
            *pid_speed_tilt+=5;
    }

}

/*
 *
 *
INT8S ticks_to_degrees(INT8S ticks){
    INT8S gear_ratio = 3;      // 1:3 gear ratio for the external gears
    INT8S encoder_cpr = 360;      // Encoder counts per revolution

    if (gear_ratio <= 0.0 || encoder_cpr <= 0) {
        return 0.0;  // or some error value
    }

    return ((INT8S)ticks / (encoder_cpr * gear_ratio)) * 360.0;
}
void tiva_fpga_map_tilt(INT32S *pid_output_tilt, INT8U *pid_speed_tilt, INT8U *pid_dir_tilt)

{
    *pid_speed_tilt = abs(pid_output_tilt) / tilt_step_increment;
    *pid_dir_tilt = pid_output_tilt < 0 ? 1 : 0;
}
**/
/*
void vSpiGetFrameTask(void *pvParameters){ //should unpack encoderFrame from SpiRxQueue and send to PanCtrlFbqueue

    INT16S EncoderFrame;
    INT8S panTicks, tiltTicks;
    INT8S panAng, tiltAng;

    for(;;){

        if(xQueueReceive(xSpiRxQueue, &EncoderFrame, portMAX_DELAY) == pdTRUE){
            uart1_print("\r\n<<<SpiGetFrameTask>>>\r\n");

            UnpackFrame(&EncoderFrame, &panTicks, &tiltTicks);

            panAng = ticks_to_degrees(panTicks);
            tiltAng = ticks_to_degrees(tiltTicks);

            uart1_print("\r\nEncoderFrame: 0x%04x, 0b%s, d:%d \r\n", EncoderFrame, rx_binary_string(EncoderFrame), EncoderFrame);
            uart1_print("\r\npanAng: 0x%04x, 0b%s, d:%d \r\n", panAng, rx_binary_string(panAng), panAng);
            uart1_print("\r\ntiltAng: 0x%04x, 0b%s, d:%d \r\n", tiltAng, rx_binary_string(tiltAng), tiltAng);

            xQueueSend(xPanFbInQueue, &panAng, 0);
            xQueueSend(xTiltFbInQueue, &tiltAng, 0);
        }
    }
}

void vSpiSendFrameTask(void *pvParameters){ //should create MotorFrame from PanCtrloutQueue and send to SpiTxQueue
      //INT8U panError, tiltError;
    INT32S panError, tiltError;
    INT8U panSpeed, tiltSpeed;
    INT8U  panDir,   tiltDir;
    INT16U MotorFrame;

      for(;;){

          if((xQueueReceive(xPanCtrlOutQueue, &panError, portMAX_DELAY) == pdTRUE) &&
              (xQueueReceive(xTiltCtrlOutQueue, &tiltError, portMAX_DELAY) == pdTRUE))
              uart1_print("\r\n<<<SpiSendFrameTask>>>\r\n");

              tiva_fpga_map_pan(&panError, &panSpeed, &panDir);
              tiva_fpga_map_tilt(&tiltError, &tiltSpeed, &tiltDir);

              CreateFrame(&MotorFrame, &panDir, &panSpeed, &tiltDir, &tiltSpeed);

            //DEBUGGER PRINTS
              uart1_print("\r\nMotorFrame: 0x%04x, 0b%s, d:%u \r\n", MotorFrame, rx_binary_string(MotorFrame), (unsigned)MotorFrame);
              uart1_print("\r\panSpeed: 0x%04x, 0b%s, d:%u \r\n", panSpeed, rx_binary_string(panSpeed), (unsigned)panSpeed);
              uart1_print("\r\tiltSpeed: 0x%04x, 0b%s, d:%u \r\n", tiltSpeed, rx_binary_string(tiltSpeed), (unsigned)tiltSpeed);
              uart1_print("\r\npanDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
              uart1_print("\r\ntiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);

            //xQueueSend(xUartTxQueue, &MotorFrame, 0);
             xQueueSend(xSpiTxQueue, &MotorFrame, 0);



        }

   }



void vUartGetFrameTask(void *pvParameters){ //should unpack visionframe from uartRxQueue and send to PanCtrlInQueue

    INT16S VisionFrame;
    INT8S panVal, tiltVal;

    for(;;){

       if(xQueueReceive(xUartRxQueue, &VisionFrame, portMAX_DELAY) == pdTRUE){
            uart1_print("\r\n<<<UartGetFrameTask>>>\r\n");

            UnpackFrame(&VisionFrame, &panVal, &tiltVal);

            uart1_print("\r\nVisionFrame:: 0x%04x, 0b%s, d:%d \r\n", VisionFrame, rx_binary_string(VisionFrame), VisionFrame);
            uart1_print("\r\npanVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string(panVal), panVal);
            uart1_print("\r\ntiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string(tiltVal), tiltVal);

           xQueueSend(xPanCtrlInQueue, &panVal, 0);
           xQueueSend(xTiltCtrlInQueue, &tiltVal, 0);
       }
 }
}
*/
//uart send frame skal ikke rigtigt bruges medmindre user feedback??

/*
void vUartSendFrameTask(void *pvParameters){ //should create vision frame from PanFbOutQueue abd sebd to UartTxQueue

    INT8U panError, tiltError;
    //INT16U tmpError;
    INT8U  panSpeed, tiltSpeed;
    INT8U  panDir,   tiltDir;

    //INT16U MotorFrame;

   // INT8U panCurrentError, tiltCurrentError;
    uart1_print("<<<UartSendFrameTask>>>\r\n");
    for(;;){

      if ((xQueueReceive(xPanCtrlOutQueue, &panError, portMAX_DELAY) == pdTRUE) &&
          (xQueueReceive(xTiltCtrlOutQueue, &tiltError, portMAX_DELAY) == pdTRUE)){
                FSM_STATUS = CTRL;
                panDir = 1; //temp
                tiltDir = 0; //temp
                // panError = 0b00110011;
                //panSpeed = ErrorToSpeed(panError);

                //update error
                //panCurrentError = panError;

                INT16U motorFrame = CreateFrame(panDir, panError, tiltDir, tiltError);
                uart1_print("MotorFrame: 0x%04x, 0b%s, d:%u \r\n", motorFrame, rx_binary_string(motorFrame), (unsigned)motorFrame);
                uart1_print("panVal: 0x%04x, 0b%s, d:%u \r\n", panError, rx_binary_string(panError), (unsigned)panError);
                uart1_print("tiltVal: 0x%04x, 0b%s, d:%u \r\n", tiltError, rx_binary_string(tiltError), (unsigned)tiltError);
                uart1_print("panDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
                uart1_print("tiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);


                xQueueSend(xUartTxQueue, &motorFrame, 0);

      }


    }

}
*/
