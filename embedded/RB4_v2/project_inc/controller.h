/*
 * controller.h
 *
 *  Created on: 28 Apr 2025
 *      Author: linax
 */

#ifndef CONTROLLER_H
#define CONTROLLER_H
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "emp_type.h"
#include <stdint.h>
#include "tiva_fpga_map.h"
#define PID_FREQ_MS   1000   //delay/frequecy af controller

typedef struct {
    FP32 kp;       // Proportional gain
    FP32 ki;       // Integral gain
    FP32 kd;       // Derivative gain
    FP32 Ts;       // Sampling time
    FP32 N;        // Filter coefficient for derivative term
    FP32 prev_error; // Previous error
    // FP32 integral;   // Integral term
    FP32 output_min; // Minimum output (anti-windup)
    FP32 output_max; // Maximum output (anti-windup)
    FP32 prev_derivative; // Previous derivative term
    FP32 alpha;    // Coefficient for derivative term
    FP32 beta;     // Coefficient for derivative term
    FP32 gamma;    // Coefficient for derivative term

} PIDController_t;

void PID_Init(PIDController_t *pid,
    FP32 kp, FP32 ki, FP32 kd, FP32 Ts, FP32 N,
    FP32 output_min, FP32 output_max);

INT16U PID_Compute(PIDController_t *pid,
                   INT16U reference,
                   INT16U measured_value);
//2 control loops
//vPanControllerTask
//vTiltControllerTask

void vPidControllerTask(void *pvParameters);

#endif /* CONTROLLER_H */
