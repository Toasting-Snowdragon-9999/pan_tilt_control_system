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
    double kp;       // Proportional gain
        double ki;       // Integral gain
        double kd;       // Derivative gain
        double Ts;       // Sampling time
        double prev_error; // Previous error
        double integral;   // Integral term
        double output_min; // Minimum output (anti-windup)
        double output_max; // Maximum output (anti-windup)

} PIDController_t;

void PID_Init(PIDController_t *pid,
              double kp, double ki, double kd, double Ts,
              double output_min, double output_max);

double PID_Compute(PIDController_t *pid,
                   double reference,
                   double measured_value);
//2 control loops
//vPanControllerTask
//vTiltControllerTask

void vPidControllerTask(void *pvParameters);

#endif /* CONTROLLER_H */
