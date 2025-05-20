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
//extern INT8S panCombinedRef;
//extern INT8S tiltCombinedRef;
typedef struct {
    float kp;       // Proportional gain
    float ki;       // Integral gain
    float kd;       // Derivative gain
    float Ts;       // Sampling time
    float N;        // Filter coefficient for derivative term
    INT8S prev_error; // Previous error
    // FP32 integral;   // Integral term
    float output_min; // Minimum output (anti-windup) (skla være INT8U?)/ eller send det til mapping som fikser?
    float output_max; // Maximum output (anti-windup) (skla være INT8U?)
    INT16S prev_derivative; // Previous derivative term
    float alpha;    // Coefficient for derivative term
    float beta;     // Coefficient for derivative term
    float gamma;    // Coefficient for derivative term

} PIDController_t;



/*
void PID_Init(PIDController_t *pid,
    FP32 kp, FP32 ki, FP32 kd, FP32 Ts, FP32 N,
    FP32 output_min, FP32 output_max);
*/
void Pan_PID_Init(PIDController_t *pid, float kp, float ki, float kd, float Ts, float N, float output_min, float output_max);
void Tilt_PID_Init(PIDController_t *pid, float kp, float ki, float kd, float Ts, float N, float output_min, float output_max);
INT32S Pan_PID_Compute(PIDController_t *pid, INT8S combinedReference, INT8S encMeasuredVal);
INT32S Tilt_PID_Compute(PIDController_t *pid, INT8S combinedReference, INT8S encMeasuredVal);

void vPIDControllerTask(void *pvParameters);

//void vPanControllerTask(void *pvParameters);
//void vTiltControllerTask(void *pvParameters);

#endif /* CONTROLLER_H */
