/*
 * control.h
 *
 *  Created on: 16 May 2025
 *      Author: chris
 */

#ifndef CONTROL_H_
#define CONTROL_H_


#include "spi.h"
#include "uart.h"
#include "semphr.h"

struct control_info {
    struct spi_info *spi_info;
    struct uart_info *uart_info;
    BOOLEAN stop_flag;
};

struct PID_controller
{
    struct spi_info *spi_info;
    struct uart_info *uart_info;
    FP32 kp;                            // Proportional gain
    FP32 ki;                            // Integral gain
    FP32 kd;                            // Derivative gain
    FP32 Ts;                            // Sampling time
    FP32 N;                             // Filter coefficient for derivative term
    // FP32 integral;                   // Integral term
    FP32 output_min;                    // Minimum output (anti-windup) (skla være INT8U?)/ eller send det til mapping som fikser?
    FP32 output_max;                    // Maximum output (anti-windup) (skla være INT8U?)
    INT8S prev_error;                   // Previous error
    INT16S prev_derivative;             // Previous derivative term
    FP32 alpha;                         // Coefficient for derivative term
    FP32 beta;                          // Coefficient for derivative term
    FP32 gamma;                         // Coefficient for derivative term
    // Initialize PID output limits
    INT32S max_pid_output_pan;
    INT32S max_pid_output_tilt;
    // Increment values for mapping
    INT32S pan_step_increment;
    INT32S tilt_step_increment;
    // Output values
    INT32S pid_output_pan;
    INT32S pid_output_tilt;
    // Mapped values
    INT8U pid_speed_pan;
    INT8U pid_dir_pan;
    INT8U pid_speed_tilt;
    INT8U pid_dir_tilt;
    // References
    INT8S combined_ref_pan;
    INT8S combined_ref_tilt;
    INT8S vision_ref_pan;
    INT8S vision_ref_tilt;
    INT8S enc_pan;
    INT8S enc_tilt;
};

void PID_init(struct PID_controller *PID_controller,
              struct spi_info *spi_info,
              struct uart_info *uart_info);

INT32S PID_compute(struct PID_controller *PID_controller, INT8S vision_reference, INT8S enc_measured_val);

INT8S ticks_to_degrees(INT8S ticks);

void tiva_fpga_map_pan(struct PID_controller *PID_controller);
/*****************************************************************************
 *   Input    : INT32S pid_output_pan - PID output value from the pan controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 ******************************************************************************/

void tiva_fpga_map_tilt(struct PID_controller *PID_controller);
/*****************************************************************************
 *   Input    : INT32S pid_output_tilt - PID output value from the tilt controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 ******************************************************************************/

void PID_task(void *pvParameter);













void control_info_init(struct control_info *control_info, struct spi_info *spi_info, struct uart_info *uart_info);

void control_task(void *pvParameter);
void uart_task2(void *pvParameter);

#endif /* CONTROL_H_ */
