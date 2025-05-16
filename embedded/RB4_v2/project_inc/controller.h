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
#define PID_FREQ_MS   1000   //delay/frequecy af controller

typedef struct {
    FP32 kp;       // Proportional gain
    FP32 ki;       // Integral gain
    FP32 kd;       // Derivative gain
    FP32 Ts;       // Sampling time
    FP32 N;        // Filter coefficient for derivative term
    INT8S prev_error; // Previous error
    // FP32 integral;   // Integral term
    FP32 output_min; // Minimum output (anti-windup) (skla være INT8U?)/ eller send det til mapping som fikser?
    FP32 output_max; // Maximum output (anti-windup) (skla være INT8U?)
    INT16S prev_derivative; // Previous derivative term
    FP32 alpha;    // Coefficient for derivative term
    FP32 beta;     // Coefficient for derivative term
    FP32 gamma;    // Coefficient for derivative term

} PIDController_t;

void PID_Init(PIDController_t *pid,
    FP32 kp, FP32 ki, FP32 kd, FP32 Ts, FP32 N,
    FP32 output_min, FP32 output_max);

INT32S PID_Compute(PIDController_t *pid, INT8S visionReference, INT8S encMeasuredVal);

void vPIDControllerTask(void *pvParameters);

//void vPanControllerTask(void *pvParameters);
//void vTiltControllerTask(void *pvParameters);

#endif /* CONTROLLER_H */
