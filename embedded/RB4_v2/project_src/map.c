/*
 * map.c
 *
 *  Created on: 7 May 2025
 *      Author: linax
 */

#include "common.h"
#include "map.h"

QueueHandle_t xPanCtrlInQueue;
QueueHandle_t xTiltCtrlInQueue;
QueueHandle_t xPanCtrlOutQueue;
QueueHandle_t xTiltCtrlOutQueue;

QueueHandle_t xSpiRxQueue;
QueueHandle_t xSpiTxQueue;

void CreateFrame(INT16U *Frame, INT8U *panDir, INT8U *panSpeed, INT8U *tiltDir, INT8U *tiltSpeed){ //From TIVA to FPGA
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

//void vMapTestTask(void *pvParameters){ //Test mapping (PACKING)
//    INT16U Frame;
//    INT8U panSpeed = 9;
//    INT8U tiltSpeed = 6;
//    INT8U panDir = 0;
//    INT8U tiltDir = 0;
//    while(1){
//        CreateFrame(&Frame, &panDir, &panSpeed, &tiltDir, &tiltSpeed);
//        uart0_print("Frame:: 0x%04x, 0b%s, d:%u \r\n", Frame, rx_binary_string(Frame), (unsigned)Frame);
//        vTaskDelay(pdMS_TO_TICKS(1000));
//        uart0_print("panDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
//        vTaskDelay(pdMS_TO_TICKS(1000));
//        uart0_print("panSpeed: 0x%04x, 0b%s, d:%u \r\n", panSpeed, rx_binary_string(panSpeed), (unsigned)panSpeed);
//        vTaskDelay(pdMS_TO_TICKS(1000));
//        uart0_print("tiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);
//        vTaskDelay(pdMS_TO_TICKS(1000));
//        uart0_print("tiltSpeed: 0x%04x, 0b%s, d:%u \r\n", tiltSpeed, rx_binary_string(tiltSpeed), (unsigned)tiltSpeed);
//
//        vTaskDelay(pdMS_TO_TICKS(1000));
//
//   }
//}

//void UnpackFrame(INT16U *Frame, INT8U *panVal, INT8U *tiltVal, INT8U *panDir, INT8U *tiltDir){ //From FPGA to TIVA (And vision to TIVA)
//    FSM_STATUS = URTRX;
//    //shift MSB of EncoderFrame into panVal
//    *panVal  = (INT8U)((*Frame >> 8) & 0xFF);
//    *panDir = (INT8U)((*panVal >> 7) & 0x01); //MSB
//
//    //shift LSB of EncoderFrame into tiltVal
//    *tiltVal = (INT8U)( *Frame   & 0xFF);
//    *tiltDir = (INT8U)((*tiltVal >> 7) & 0x01); //MSB
//}
void UnpackFrame(INT16S *Frame, INT8S *panVal, INT8S *tiltVal){ //From FPGA to TIVA (And vision to TIVA)
    FSM_STATUS = URTRX;
    //shift MSB of EncoderFrame into panVal
    *panVal  = (INT8S)((*Frame >> 8) & 0xFF);

    //shift LSB of EncoderFrame into tiltVal
    *tiltVal = (INT8S)(*Frame & 0xFF);
}

void vMapTestTask(void *pvParameters){ //Test mapping (UNPACKING)
    INT16S VisionFrame;
    INT8S panVal, tiltVal;
    while(1){
        if(xQueueReceive(xUartRxQueue, &VisionFrame, portMAX_DELAY) == pdTRUE){
            UnpackFrame(&VisionFrame, &panVal, &tiltVal);
            uart0_print("Frame:: 0x%04x, 0b%s, d:%d \r\n", VisionFrame, rx_binary_string16(VisionFrame), VisionFrame);
            uart0_print("panVal: 0x%04x, 0b%s, d:%d \r\n", panVal, rx_binary_string8(panVal), panVal);
            uart0_print("tiltVal: 0x%04x, 0b%s, d:%d \r\n", tiltVal, rx_binary_string8(tiltVal), tiltVal);
        }

            vTaskDelay(pdMS_TO_TICKS(100));

   }
}

//
//INT8U ErrorToSpeed(FP32 *error){
//    if (error > 100) error = 100;
//    return (INT8U)((error * 20 + 50) / 100); //speed
//}

/*
INT8U EncValToAngle(INT8U encVal){ //EncValToErrorMap????

    //return angle for control
    //encAng queue???
}
*/
/*
void vSpiGetFrameTask(void *pvParameters){ //should unpack encoderFrame from SpiRxQueue and send to PanCtrlFbqueue

    INT16U EncoderFrame;
    INT8U panVal, tiltVal;
    INT8U panDir, tiltDir;

    for(;;){

        //uart_putc('G');
        xQueueReceive(xSpiRxQueue, &EncoderFrame, pdMS_TO_TICKS(100));

        UnpackFrame(&EncoderFrame, &panVal, &tiltVal, &panDir, &tiltDir);

        //INT8U EncValToAngle(INT8U encVal);

        INT16U panAng = panVal << 8;
        INT16U tiltAng = tiltVal << 8;

        //uart_print("Pan_value: \n");
        xQueueSend(xUartTxQueue, &panAng, pdMS_TO_TICKS(100));
        vTaskDelay(pdMS_TO_TICKS(500));

        //uart_print("Tilt_value: \n");
        //xQueueSend(xUartTxQueue, &tiltAng, pdMS_TO_TICKS(100));

        xQueueSend(xPanCtrlInQueue, &panAng, pdMS_TO_TICKS(100));
        //xQueueSend(xTiltCtrlInQueue, &tiltAng, pdMS_TO_TICKS(100));

        vTaskDelay(pdMS_TO_TICKS(500));
    }
}

void vSpiSendFrameTask(void *pvParameters){ //should create MotorFrame from PanCtrloutQueue and send to SpiTxQueue

    INT8U panError, tiltError;

    INT8U  panSpeed, tiltSpeed;
    INT8U  panDir,   tiltDir;

    INT16U MotorFrame;

    INT8U panCurrentError, tiltCurrentError;
    for(;;){

        //uart_putc('S');
        xQueueReceive(xPanCtrlOutQueue, &panError, pdMS_TO_TICKS(100));
        xQueueReceive(xTiltCtrlOutQueue, &tiltError, pdMS_TO_TICKS(100));

        //get direction???
        if(panError <= panCurrentError){
            panDir = 1; //negativ???
        } else {panDir = 0;}
        if(tiltError <= tiltCurrentError){
            tiltDir = 1; //negativ???
        } else {tiltDir = 0;}

        panSpeed = ErrorToSpeed(panError);
        tiltSpeed = ErrorToSpeed(tiltError);

        //update error
        panCurrentError = panError;
        tiltCurrentError = tiltError;

        MotorFrame = CreateFrame(panDir, panSpeed, tiltDir, tiltSpeed);
        //uart_print("MotorFrame: ");
        xQueueSend(xUartTxQueue, &MotorFrame, pdMS_TO_TICKS(100));
        //xQueueSend(xSpiTxQueue, &MotorFrame, pdMS_TO_TICKS(100));

        vTaskDelay(pdMS_TO_TICKS(500));

       }

}
*/
//void vUartGetFrameTask(void *pvParameters){ //should unpack visionframe from uartRxQueue and send to PanCtrlInQueue
//
//    INT16U VisionFrame;
//    INT8U panVal, tiltVal;
//    INT8U panDir, tiltDir;
//    uart1_print("<<<UartGetFrameTask>>>\r\n");
//    for(;;){
//
//       if(xQueueReceive(xUartRxQueue, &VisionFrame, portMAX_DELAY) == pdTRUE){
//           FSM_STATUS = CTRL;
//           UnpackFrame(&VisionFrame, &panVal, &tiltVal, &panDir, &tiltDir);
//           uart1_print("VisionFrame:: 0x%04x, 0b%s, d:%u \r\n", VisionFrame, rx_binary_string(VisionFrame), (unsigned)VisionFrame);
//           uart1_print("panVal: 0x%04x, 0b%s, d:%u \r\n", panVal, rx_binary_string(panVal), (unsigned)panVal);
//           uart1_print("tiltVal: 0x%04x, 0b%s, d:%u \r\n", tiltVal, rx_binary_string(tiltVal), (unsigned)tiltVal);
//           uart1_print("panDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
//           uart1_print("tiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);
//
//           xQueueSend(xPanCtrlInQueue, &panVal, 0);
//
//       }
// }
//}
        //INT8U EncValToAngle(INT8U encVal);



            // uart_print(1, "Pan_Ang: %d \n", panVal);
             //uart_print(1, "Tilt_Ang: %d \n", tiltVal);
             //uart_print(1, "Pan_Dir: %d \n", panDir);
             //uart_print(1, "Tilt_Dir: %d \n", tiltDir);



        //vTaskDelay(pdMS_TO_TICKS(500));


        /*
        if(xQueueSend(xTiltCtrlInQueue, &tiltAng, pdMS_TO_TICKS(20)) == pdTrue){
                    uart_print(1, "TiltAng: %d \n", tiltAng);
        }
*/
        //uart_print("Tilt_value: \n");
        //xQueueSend(xUartTxQueue, &tiltAng, pdMS_TO_TICKS(100));

        //xQueueSend(xPanCtrlInQueue, &panAng, pdMS_TO_TICKS(100));
        //xQueueSend(xTiltCtrlInQueue, &tiltAng, pdMS_TO_TICKS(100));

       // vTaskDelay(pdMS_TO_TICKS(100));


//
//void vUartSendFrameTask(void *pvParameters){ //should create vision frame from PanFbOutQueue abd sebd to UartTxQueue
//
//    INT8U panError, tiltError;
//    //INT16U tmpError;
//    INT8U  panSpeed, tiltSpeed;
//    INT8U  panDir,   tiltDir;
//
//    //INT16U MotorFrame;
//
//   // INT8U panCurrentError, tiltCurrentError;
//    uart1_print("<<<UartSendFrameTask>>>\r\n");
//    for(;;){
//
//      if ((xQueueReceive(xPanCtrlOutQueue, &panError, portMAX_DELAY) == pdTRUE) &&
//          (xQueueReceive(xTiltCtrlOutQueue, &tiltError, portMAX_DELAY) == pdTRUE)){
//                FSM_STATUS = CTRL;
//                panDir = 1; //temp
//                tiltDir = 0; //temp
//                // panError = 0b00110011;
//                //panSpeed = ErrorToSpeed(panError);
//
//                //update error
//                //panCurrentError = panError;
//
//                INT16U motorFrame = CreateFrame(panDir, panError, tiltDir, tiltError);
//                uart1_print("MotorFrame: 0x%04x, 0b%s, d:%u \r\n", motorFrame, rx_binary_string(motorFrame), (unsigned)motorFrame);
//                uart1_print("panVal: 0x%04x, 0b%s, d:%u \r\n", panError, rx_binary_string(panError), (unsigned)panError);
//                uart1_print("tiltVal: 0x%04x, 0b%s, d:%u \r\n", tiltError, rx_binary_string(tiltError), (unsigned)tiltError);
//                uart1_print("panDir: 0x%04x, 0b%s, d:%u \r\n", panDir, rx_binary_string(panDir), (unsigned)panDir);
//                uart1_print("tiltDir: 0x%04x, 0b%s, d:%u \r\n", tiltDir, rx_binary_string(tiltDir), (unsigned)tiltDir);
//
//
//                xQueueSend(xUartTxQueue, &motorFrame, 0);
//
//      }
//
//
//    }
//
//}


       /*
          if( xQueueReceive(xTiltCtrlOutQueue, &tiltError, pdMS_TO_TICKS(1)) == pdTrue){

                       if(tiltError <= tiltCurrentError){
                           tiltDir = 1; //negativ???
                       } else {tiltDir = 0;}

                       tiltSpeed = ErrorToSpeed(tiltError);

                       //update error
                       tiltCurrentError = tiltError;


            }
          */
       //xQueueSend(xSpiTxQueue, &MotorFrame, pdMS_TO_TICKS(100));
        //xQueueReceive(xTiltCtrlOutQueue, &tiltError, pdMS_TO_TICKS(100));

        //get direction???


       // vTaskDelay(pdMS_TO_TICKS(100));
