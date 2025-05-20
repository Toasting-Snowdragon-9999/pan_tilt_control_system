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


#define MAX_DEGREE_PAN 38.48
#define MAX_DEGREE_TILT 21.31

#define PAN_DIR_LEFT 1
#define PAN_DIR_RIGHT 0

#define TILT_DIR_UP 1
#define TILT_DIR_DOWN 0

#define MAX_MAP_STEP 20

extern INT16U MotorFrame;

//INT16U CreateFrame(INT8U *panDir, INT8U *panSpeed, INT8U *tiltDir, INT8U *tiltSpeed);
INT16U CreateFrame(INT8U panDir, INT8U panSpeed, INT8U tiltDir, INT8U tiltSpeed);
void UnpackFrame(INT16S Frame, INT8S *panVal, INT8S *tiltVal);
void vSpiGetFrameTask(void *pvParameters);
void vSpiSendFrameTask(void *pvParameters);
//void vUartSendFrameTask(void *pvParameters);
void vUartGetFrameTask(void *pvParameters);

INT8S ticks_to_degrees(INT8S ticks);
void tiva_fpga_map_tilt(INT32S pid_output_tilt, INT8U *pid_speed_tilt, INT8U *pid_dir_tilt);
/*****************************************************************************
 *   Input    : INT32S pid_output_pan - PID output value from the pan controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 ******************************************************************************/

void tiva_fpga_map_pan(INT32S pid_output_pan, INT8U *pid_speed_pan, INT8U *pid_dir_pan);
/*****************************************************************************
 *   Input    : INT32S pid_output_tilt - PID output value from the tilt controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 ******************************************************************************/
#endif /* PROJECT_INC_MAP_H_ */
