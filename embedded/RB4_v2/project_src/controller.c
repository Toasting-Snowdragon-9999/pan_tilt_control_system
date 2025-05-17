/*
 * controller.c
 *
 *  Created on: 28 Apr 2025
 *      Author: linax
 */

#include "common.h"
#include "controller.h"


extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;

extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlInQueue;

extern QueueHandle_t xPanFbInQueue;
extern QueueHandle_t xTiltFbInQueue;


void PID_Init(PIDController_t *pid,FP32 kp, FP32 ki, FP32 kd, FP32 Ts, FP32 N, FP32 output_min, FP32 output_max){
    // Values given to the PID controller
      pid->kp = kp;
      pid->ki = ki;
      pid->kd = kd;
      pid->Ts = Ts;
      pid->N  = N;
      pid->output_min = output_min;
      pid->output_max = output_max;

      // Initialize PID output limits
      max_pid_output_pan   = PID_Compute(pid, MAX_DEGREE_PAN, 0.0);
      max_pid_output_tilt  = PID_Compute(pid, MAX_DEGREE_TILT, 0.0);

      // Increment values for mapping
      pan_step_increment = max_pid_output_pan / MAX_MAP_STEP;
      tilt_step_increment = max_pid_output_pan / MAX_MAP_STEP;

      // Initialize previous values
      pid->prev_error = 0;
      //pid->integral   = 0.0;
      //pid->prev_integral = 0.0;
      pid->prev_derivative = 0;

      // Initialize PID coefficients for the derivative term
      pid->alpha  = pid->N * (pid->Ts / 2) - 1;
      pid->beta = 1 + pid->N * (pid->Ts / 2);
      pid->gamma = pid->kd * pid->N;
      // U_d(z) / e(z) = gamma * (z-1) / (alpha*z + beta)
}

INT32S PID_Compute(PIDController_t *pid, INT8S visionReference, INT8S encMeasuredVal){
    INT8S error = visionReference - encMeasuredVal;
   uart1_print("\r\n error: 0x%04x, 0b%s, d:%d \r\n", error, rx_binary_string(error), error);

    // Proportional
    INT32S P = pid->kp * error;
    uart1_print("\r\nProportional: 0x%04x, 0b%s, d:%d \r\n", P, rx_binary_string(P), P);

    // Integral
    //FP32 I = pid->prev_integral + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);
    //pid->prev_integral = I; // Save the integral term for next calculation

    // Derivative
    INT32S D = - (pid->alpha / pid->beta) * pid->prev_derivative + (pid->gamma / pid->beta) * (error - pid->prev_error);
    pid->prev_derivative = D; // Save the derivative term for next calculation

    uart1_print("\r\nDerivative: 0x%04x, 0b%s, d:%d \r\n", D, rx_binary_string(D), D);


    // Update previous error for next calculation
    pid->prev_error = error;

    // Compute PID output
    INT32S output = (INT32S)(P + D); //expected voltage

    // Clamp output to min/max
    /*if (output > pid->output_max) {
    pid->ki = 0.0; // Reset integral term if output exceeds max
    } else if (output < pid->output_min) {
    output = pid->output_min;
    }*/

    // Update integral term with anti-windup
    /*pid->integral += error * pid->Ts;
    if (pid->integral > pid->output_max) {
    pid->integral = pid->output_max;
    } else if (pid->integral < pid->output_min) {
    pid->integral = pid->output_min;
    }*/

    return output;

}

void vPIDControllerTask(void *pvParameters){
    TickType_t xLastWakeTime;
     const TickType_t xFrequency = 1;
     xLastWakeTime = xTaskGetTickCount();

    PIDController_t panPID;
    PIDController_t tiltPID;

   //PID_Init(&panPID, 350.0, 0.1, 10.0, 0.004, 1000.0, -12.0, 12.0);
   // PID_Init(&tiltPID, 350.0, 0.1, 10.0, 0.004, 1000.0, -12.0, 12.0);

    PID_Init(&tiltPID, 25.0, 0., 0.1, 0.004, 1000.0, -12.0, 12.0);
    PID_Init(&panPID, 25.0, 0., 0.1, 0.004, 1000.0, -12.0, 12.0);

    INT8S panVisionRef = 0;
    INT8S panEncMeasuredVal =  0;
    INT32S panOutput = 0;
    INT8S panIn;

    INT8S tiltVisionRef   = 0;
    INT8S tiltEncMeasuredVal =  0;
    INT32S tiltOutput = 0;
    INT8S tiltIn;



    for( ;; ){


        if((xQueueReceive(xPanCtrlInQueue, &panIn, 0) == pdTRUE)
          && (xQueueReceive(xTiltCtrlInQueue, &tiltIn, 0) == pdTRUE)){
        //  uart1_print("\r\n<<<PID_CONTROLLER_VISION>>>\r\n");
            FSM_STATUS = CTRL;

            //updating reference
            panVisionRef = panIn;
            tiltVisionRef = tiltIn;

           // uart1_print("\r\npanIn: 0x%04x, 0b%s, d:%d \r\n", panIn, rx_binary_string(panIn), panIn);
            //uart1_print("tiltIn: 0x%04x, 0b%s, d:%d \r\n", tiltIn, rx_binary_string(tiltIn), tiltIn);


        }

       if((xQueueReceive(xPanFbInQueue, &panEncMeasuredVal, 0) == pdTRUE)
          && (xQueueReceive(xTiltFbInQueue, &tiltEncMeasuredVal, 0) == pdTRUE)){

           //uart1_print("\r\n<<<PID_CONTROLLER_ENCODER>>>\r\n");

          uart1_print("panVisionRef: d:%d, panEncMeasuredVal: d:%d, \r\n", panVisionRef, panEncMeasuredVal);
         uart1_print("tiltVisionRef: d:%d,  tiltEncMeasuredVal: d:%d \r\n", tiltVisionRef,tiltEncMeasuredVal);
        //  uart1_print("panEncMeasuredVal: 0x%04x, 0b%s, d:%d \r\n", panEncMeasuredVal, rx_binary_string(panEncMeasuredVal), panEncMeasuredVal);
         // uart1_print("tiltEncMeasuredVal: 0x%04x, 0b%s, d:%d \r\n", tiltEncMeasuredVal, rx_binary_string(tiltEncMeasuredVal), tiltEncMeasuredVal);
           FSM_STATUS = CTRL;
           //BLOCK SPI
            panOutput = PID_Compute(&panPID, panVisionRef, panEncMeasuredVal);
            tiltOutput = PID_Compute(&tiltPID, tiltVisionRef, tiltEncMeasuredVal);


            //PAN CTRL OUT (to map then to motor) //TILT CTRL OUT (to map then to motor)
            xQueueSend(xPanCtrlOutQueue, &panOutput, 0);
            xQueueSend(xTiltCtrlOutQueue, &tiltOutput, 0);
            uart1_print("\r\npanOutput:  0x%04x, 0b%s, d:%d \r\n", panOutput, rx_binary_string(panOutput), panOutput);
           uart1_print("tiltOutput:  0x%04x, 0b%s, d:%d \r\n", tiltOutput, rx_binary_string(tiltOutput), tiltOutput);
            // uart1_print("cunt");

       }


           // taskYIELD();
           vTaskDelay(pdMS_TO_TICKS(1));
            // vTaskDelayUntil( &xLastWakeTime, xFrequency );
     }

}
