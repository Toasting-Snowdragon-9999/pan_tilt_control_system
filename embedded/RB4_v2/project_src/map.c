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

INT16U CreateFrame(INT8U panDir, INT8U panSpeed, INT8U tiltDir,INT8U tiltSpeed){
    MotorFrame &= ~CLEAR_MASK;

    MotorFrame |=(0u << 15)                 //start bit = 0
               |((panDir & 0x1u) << 12)     //1 bit
               |((panSpeed & 0x1Fu) << 7)   //5 bit
               |((tiltDir & 0x1u) << 6)     //1 bit
               |((tiltSpeed & 0x1Fu) << 1)  //5 bit
               |(1u << 0);                  //stop bit = 1

    return MotorFrame;
}

void UnpackFrame(INT16U *EncoderFrame, INT8U *panVal, INT8U *tiltVal, INT8U *panDir, INT8U *tiltDir){

    //shift MSB of EncoderFrame into panVal
    *panVal  = (INT8U)((*EncoderFrame >> 8) & 0xFF);
    *panDir = (INT8U)((*panVal >> 7) & 0x01); //MSB

    //shift LSB of EncoderFrame into tiltVal
    *tiltVal = (INT8U)( *EncoderFrame   & 0xFF);
    *tiltDir = (INT8U)((*tiltVal >> 7) & 0x01); //MSB
}


INT8U ErrorToSpeed(INT8U error){
    if (error > 100) error = 100;
    return (INT8U)((error * 20 + 50) / 100); //speed
}

/*
INT8U EncValToAngle(INT8U encVal){ //EncValToErrorMap????

    //return angle for control
    //encAng queue???
}
*/
void vSpiGetFrameTask(void *pvParameters){

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
        xQueueSend(xUartTxQueue, &tiltAng, pdMS_TO_TICKS(100));

        //xQueueSend(xPanCtrlInQueue, &panAng, pdMS_TO_TICKS(100));
        //xQueueSend(xTiltCtrlInQueue, &tiltAng, pdMS_TO_TICKS(100));

        vTaskDelay(pdMS_TO_TICKS(500));
    }
}

void vSpiSendFrameTask(void *pvParameters){

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

