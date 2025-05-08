/*
 * map.h
 *
 *  Created on: 7 May 2025
 *      Author: linax
 */

#ifndef PROJECT_INC_MAP_H_
#define PROJECT_INC_MAP_H_

#include "emp_type.h"

#define BIT_15      (1u << 15)        // start bit
#define BIT_12      (1u << 12)        // panDir
#define BIT_11_7    (0x1Fu <<  7)     // panSpeed (5 bits)
#define BIT_6       (1u <<  6)        // tiltDir
#define BIT_5_1     (0x1Fu <<  1)     // tiltSpeed (5 bits)
#define BIT_0       (1u <<  0)        // stop bit

#define CLEAR_MASK  ( BIT_15 \
                    | BIT_12 \
                    | BIT_11_7 \
                    | BIT_6 \
                    | BIT_5_1 \
                    | BIT_0 )



INT16U CreateFrame(INT8U panDir, INT8U panSpeed, INT8U tiltDir, INT8U tiltSpeed);
void UnpackFrame(INT16U *EncoderFrame, INT8U *panVal, INT8U *tiltVal, INT8U *panDir, INT8U *tiltDir);
INT8U ErrorToSpeed(INT8U error);
//INT8U EncValToAngle(INT8U encVal);
void vSpiGetFrameTask(void *pvParameters);
void vSpiSendFrameTask(void *pvParameters);



#endif /* PROJECT_INC_MAP_H_ */
