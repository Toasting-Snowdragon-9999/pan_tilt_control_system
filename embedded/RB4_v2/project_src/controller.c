/*
 * controller.c
 *
 *  Created on: 28 Apr 2025
 *      Author: linax
 */

#include "common.h"
#include "controller.h"
#include "common.h"
#include "controller.h"

//ALL A BIT QUEUES
extern QueueHandle_t xPanCtrlOutQueue;
extern QueueHandle_t xTiltCtrlOutQueue;

extern QueueHandle_t xPanCtrlInQueue;
extern QueueHandle_t xTiltCtrlInQueue;

extern QueueHandle_t xPanFbInQueue;
extern QueueHandle_t xTiltFbInQueue;

//extern QueueHandle_t xUartTxQueue;
//extern QueueHandle_t xUartRxQueue;

//extern QueueHandle_t xPanFbOutQueue;
//extern QueueHandle_t xTiltFbOutQueue;

void PID_Init(PIDController_t *pid,
              FP32 kp, FP32 ki, FP32 kd, FP32 Ts, FP32 N,
              FP32 output_min, FP32 output_max)
{
    // Values given to the PID controller
    pid->kp = kp;
    pid->ki = ki;
    pid->kd = kd;
    pid->Ts = Ts;
    pid->N  = N;
    pid->output_min = output_min;
    pid->output_max = output_max;

    // Initialize previous values
    pid->prev_error = 0.0;
    //pid->integral   = 0.0;
    //pid->prev_integral = 0.0;
    pid->prev_derivative = 0.0;

    // Initialize PID coefficients for the derivative term
    pid->alpha = 1 + pid->N * (pid->Ts / 2);
    pid->beta  = pid->N * (pid->Ts / 2) - 1;
    pid->gamma = pid->kd * pid->N;
    // U_d(z) / e(z) = gamma * (z-1) / (alpha*z + beta)
}

INT16U PID_Compute(PIDController_t *pid, INT8U visionReference, INT8U encMeasuredVal)
{
    INT8U error = visionReference - encMeasuredVal;
    uart1_print("error: 0x%04x, 0b%s, d:%u \r\n", error, rx_binary_string(error), (unsigned)error);
    // Proportional
    FP32 P = pid->kp * error;
    uart1_print("Proportional: 0x%04x, 0b%s, d:%u \r\n", P, rx_binary_string(P), (unsigned)P);

    // Integral
    //FP32 I = pid->prev_integral + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);
    //pid->prev_integral = I; // Save the integral term for next calculation

    // Derivative
    FP32 D = - (pid->alpha / pid->beta) * pid->prev_derivative + (pid->gamma / pid->beta) * (error - pid->prev_error);
    pid->prev_derivative = D; // Save the derivative term for next calculation
    uart1_print("Derivative: 0x%04x, 0b%s, d:%u \r\n", D, rx_binary_string(D), (unsigned)D);

    // Update previous error for next calculation
    pid->prev_error = error;

    // Compute PID output
    INT16U output = (INT16U)(P + D);

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

void vPanControllerTask(void *pvParameters){


    PIDController_t pid;
    PID_Init(&pid, 350, 1, 10, 0, 1000, 12, 12);
    INT8U panVisionRef = 100;
    INT8U panEncMeasuredVal =  0;
    FP32 panOutput = 0;
    INT8U panIn; //pan input from uart
    for( ;; ){
        uart1_print("<<<PanControllerTask>>>\r\n");
        FSM_STATUS = CTRL;

        if((xQueueReceive(xPanCtrlInQueue, &panIn, portMAX_DELAY) == pdTRUE)){
            panVisionRef = panIn; //updating reference
            uart1_print("panIn: 0x%04x, 0b%s, d:%u \r\n", panIn, rx_binary_string(panIn), (unsigned)panIn);
        }

        if((xQueueReceive(xPanFbInQueue, &panEncMeasuredVal, portMAX_DELAY) == pdTRUE)){
            panOutput = PID_Compute(&pid, panVisionRef, panEncMeasuredVal);

            uart1_print("panOutput:  0x%04x, 0b%s, d:%u \r\n", panOutput, rx_binary_string(panOutput), (unsigned)panOutput);

            //PAN CTRL OUT (to map then to motor)
            xQueueSend(xPanCtrlOutQueue, &panOutput, 0);
        }


    }


}



void vTiltControllerTask(void *pvParameters)
{

    PIDController_t pid;
    PID_Init(&pid, 350, 1, 10, 0, 1000, 12, 12);
    INT8U tiltVisionRef   = 100;
    INT8U tiltEncMeasuredVal =  0;
    FP32 tiltOutput = 0;
    INT8U tiltIn; //tilt input from uart

    for( ;; )
    {
       FSM_STATUS = CTRL;
       uart1_print("<<<TiltControllerTask>>>\r\n");
       if( (xQueueReceive(xTiltCtrlInQueue, &tiltIn, portMAX_DELAY) == pdTRUE)){
           tiltVisionRef = tiltIn; //updating reference
         uart1_print("tiltIn: 0x%04x, 0b%s, d:%u \r\n", tiltIn, rx_binary_string(tiltIn), (unsigned)tiltIn);
       }

       if((xQueueReceive(xTiltFbInQueue, &tiltEncMeasuredVal, portMAX_DELAY) == pdTRUE)){

          tiltOutput = PID_Compute(&pid, tiltVisionRef, tiltEncMeasuredVal);

          uart1_print("tiltOutput:  0x%04x, 0b%s, d:%u \r\n", tiltOutput, rx_binary_string(tiltOutput), (unsigned)tiltOutput);

          //TILT CTRL OUT (to map then to motor)
          xQueueSend(xTiltCtrlOutQueue, &tiltOutput, 0);

        }

       }


   }



