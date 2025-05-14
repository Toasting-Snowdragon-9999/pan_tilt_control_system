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

INT16U MotorFrame = 0;
static inline INT8S f32_to_u8(FP32 f) {
    // 1) round to nearest integer
    int   tmp = (int)roundf(f);
    // 2) clamp to [0..255]
    if (tmp < 0)   tmp = 0;
    if (tmp > 255) tmp = 255;
    // 3) return as INT8U
    return (INT8S)tmp;
}

/*INT16U CreateFrame(INT8U panDir, INT8U panSpeed, INT8U tiltDir,INT8U tiltSpeed){
    FSM_STATUS = URTTX;
    MotorFrame &= ~CLEAR_MASK;

    MotorFrame |=(0u << 15)                 //start bit = 0
               |((panDir & 0x1u) << 12)     //1 bit
               |((panSpeed & 0x1Fu) << 7)   //5 bit
               |((tiltDir & 0x1u) << 6)     //1 bit
               |((tiltSpeed & 0x1Fu) << 1)  //5 bit
               |(1u << 0);                  //stop bit = 1

    return MotorFrame;
}
*/
/*
void UnpackFrame(INT16U *Frame, INT8U *panVal, INT8U *tiltVal, INT8U *panDir, INT8U *tiltDir){
    FSM_STATUS = URTRX;
    //shift MSB of EncoderFrame into panVal
    *panVal  = (INT8U)((*Frame >> 8) & 0xFF);
    *panDir = (INT8U)((*panVal >> 7) & 0x01); //MSB

    //shift LSB of EncoderFrame into tiltVal
    *tiltVal = (INT8U)( *Frame   & 0xFF);
    *tiltDir = (INT8U)((*tiltVal >> 7) & 0x01); //MSB
}*/
//SKAL ALT VÆRE SIGNED??
void CreateFrame(INT16S *Frame, INT8S *panDir, INT8S *panSpeed, INT8S *tiltDir, INT8S *tiltSpeed){ //From TIVA to FPGA
    FSM_STATUS = URTTX;
    *Frame &= 0x0000;

    *Frame     |=(0 << 15)                 //start bit = 0
               | (0 << 14) | (0 << 13)
               |((*panDir & 0x01) << 12)     //1 bit
               |((*panSpeed & 0x1F) << 7)   //5 bit
               |((*tiltDir & 0x01) << 6)     //1 bit
               |((*tiltSpeed & 0x1F) << 1)  //5 bit
               |(1 << 0);                  //stop bit = 1

}
void UnpackFrame(INT16S *Frame, INT8S *panVal, INT8S *tiltVal){ //From FPGA to TIVA (And vision to TIVA)
    FSM_STATUS = URTRX;
    //shift MSB of EncoderFrame into panVal
    *panVal  = (INT8S)((*Frame >> 8) & 0xFF);

    //shift LSB of EncoderFrame into tiltVal
    *tiltVal = (INT8S)(*Frame & 0xFF);
}


/*
INT8U ErrorToSpeed(INT8U error){
    if (error > 100) error = 100;
    return (INT8U)((error * 20 + 50) / 100); //speed
}


INT8U EncValToAngle(INT8U encVal){ //EncValToErrorMap????

    //return angle for control
    //encAng queue???
    //and direction???

}

*/
void vSpiGetFrameTask(void *pvParameters){ //should unpack encoderFrame from SpiRxQueue and send to PanCtrlFbqueue

    INT16S EncoderFrame;
    INT8S panVal, tiltVal;
   // INT8U panDir, tiltDir;
    INT8S panAng, tiltAng;

    for(;;){

        if(xQueueReceive(xSpiRxQueue, &EncoderFrame, portMAX_DELAY) == pdTRUE){
            uart1_print("\r\n<<<SpiGetFrameTask>>>\r\n");

            UnpackFrame(&EncoderFrame, &panVal, &tiltVal);

            //MISSING MAP AND DIRECTIONS?
            //INT8U EncValToAngle(INT8U encVal);

            panAng = panVal;
            tiltAng = tiltVal;
            uart1_print("\r\\n EncoderFrame:: 0x%04x, 0b%s, d:%d \r\n", EncoderFrame, rx_binary_string(EncoderFrame), EncoderFrame);
            uart1_print("\r\npanVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string(panVal), panVal);
            uart1_print("\r\ntiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string(tiltVal), tiltVal);

            xQueueSend(xPanFbInQueue, &panAng, 0);
            xQueueSend(xTiltFbInQueue, &tiltAng, 0);
        }
    }
}

void vSpiSendFrameTask(void *pvParameters){ //should create MotorFrame from PanCtrloutQueue and send to SpiTxQueue
      //INT8U panError, tiltError;
    FP32 panError, tiltError;
    INT8S panSpeed, tiltSpeed;
    INT8S  panDir,   tiltDir;
      INT16S MotorFrame;
      INT8S panReceived = 0;
      INT8S tiltReceived = 0;


      for(;;){

        if ((xQueueReceive(xPanCtrlOutQueue, &panError, portMAX_DELAY) == pdTRUE)){
            //INT8U  panSpeed;
            //TEMP: get speed from error function (save current errors as global variables?)
            panSpeed = f32_to_u8(panError);
            //TEMP: get direction function
            panDir = 1; //temp
            panReceived = 1;
        }

        if ((xQueueReceive(xTiltCtrlOutQueue, &tiltError, portMAX_DELAY) == pdTRUE)){
          // INT8U tiltSpeed;
           //TEMP: get speed from error function (save current errors as global variables?)
            tiltSpeed = f32_to_u8(tiltError);
           //TEMP: get direction function
           tiltDir = 0; //temp
           tiltReceived = 1;
        }

        if(panReceived == 1 && tiltReceived == 1){
            uart1_print("\r\n<<<SpiSendFrameTask>>>\r\n");

            CreateFrame(&MotorFrame, &panDir, &panSpeed, &tiltDir, &tiltSpeed);

            //DEBUGGER PRINTS
              uart1_print("\r\nMotorFrame: 0x%04x, 0b%s, d:%d \r\n", MotorFrame, rx_binary_string(MotorFrame), MotorFrame);
              uart1_print("\r\npanVal: 0x%04x, 0b%s, d:%d \r\n", panError, rx_binary_string(panError), panError);
              uart1_print("\r\ntiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltError, rx_binary_string(tiltError), tiltError);
              uart1_print("\r\npanDir: 0x%04x, 0b%s, d:%d \r\n", panDir, rx_binary_string(panDir), panDir);
              uart1_print("\r\ntiltDir: 0x%04x, 0b%s, d:%d \r\n", tiltDir, rx_binary_string(tiltDir), tiltDir);

            //xQueueSend(xUartTxQueue, &MotorFrame, 0);
             xQueueSend(xSpiTxQueue, &MotorFrame, 0);

            panReceived = 0;
            tiltReceived = 0;

        }

   }

}

void vUartGetFrameTask(void *pvParameters){ //should unpack visionframe from uartRxQueue and send to PanCtrlInQueue

    INT16S VisionFrame;
    INT8S panVal, tiltVal;
   // INT8U panDir, tiltDir;



    for(;;){

       if(xQueueReceive(xUartRxQueue, &VisionFrame, portMAX_DELAY) == pdTRUE){
            uart1_print("\r\n<<<UartGetFrameTask>>>\r\n");

            UnpackFrame(&VisionFrame, &panVal, &tiltVal);

            uart1_print("\r\nVisionFrame:: 0x%04x, 0b%s, d:%d \r\n", VisionFrame, rx_binary_string(VisionFrame), VisionFrame);
            uart1_print("\r\npanVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string(panVal), panVal);
            uart1_print("\r\ntiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string(tiltVal), tiltVal);

            //  uart1_print("\r\npanDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
          //  uart1_print("\r\ntiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);

           xQueueSend(xPanCtrlInQueue, &panVal, 0);
           xQueueSend(xTiltCtrlInQueue, &tiltVal, 0);

       }
 }
}

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
