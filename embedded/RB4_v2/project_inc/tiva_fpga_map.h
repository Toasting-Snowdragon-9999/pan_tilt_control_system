/*
 * tiva_fpga_map.c
 *
 *  Created on: 15 May 2025
 *      Author: lucas
 */

#ifndef TIVA_FPGA_MAP_H
#define TIVA_FPGA_MAP_H

#include "emp_type.h"

#define MAX_DEGREE_PAN 38.48
#define MAX_DEGREE_TILT 22.84
#define MAX_MAP_STEP 20

INT8S tiva_fpga_map_pan(INT32S pid_output_pan);
/*****************************************************************************
 *   Input    : INT32S pid_output_pan - PID output value from the pan controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 ******************************************************************************/

INT8S tiva_fpga_map_tilt(INT32S pid_output_tilt);
/*****************************************************************************
 *   Input    : INT32S pid_output_tilt - PID output value from the tilt controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 ******************************************************************************/

#endif /* TIVA_FPGA_MAP_H */