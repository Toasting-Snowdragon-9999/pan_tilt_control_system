/*
 * tiva_fpga_map.c
 *
 *  Created on: 15 May 2025
 *      Author: lucas
 */

#include "tiva_fpga_map.h"

INT8S tiva_fpga_map_pan(INT32S pid_output_pan)
/*****************************************************************************
 *   Input    : INT32S pid_output_pan - PID output value from the pan controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 *****************************************************************************/
{
    INT8S pid_map_value = pid_output_pan / PAN_STEP_INCREMENT;

    return pid_map_value;
}

INT8S tiva_fpga_map_tilt(INT32S pid_output_tilt)
/*****************************************************************************
 *   Input    : INT32S pid_output_tilt - PID output value from the tilt controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 *****************************************************************************/
{
    INT8S pid_map_value = pid_output_tilt / TILT_STEP_INCREMENT;

    return pid_map_value;
}