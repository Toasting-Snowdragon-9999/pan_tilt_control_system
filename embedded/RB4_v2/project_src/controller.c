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



void PID_Init(PIDController_t *pid, float kp, float ki, float kd, float Ts, float N, float output_min, float output_max){
    // Values given to the PID controller
      pid->kp = kp;
      pid->ki = ki;
      pid->kd = kd;
      pid->Ts = Ts;
      pid->N  = N;
      pid->output_min = output_min;
      pid->output_max = output_max;

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
        // Initialize PID output limits

      max_pid_output_pan   = Pan_PID_Compute(pid, 38, 0.0);
      max_pid_output_tilt  = Tilt_PID_Compute(pid, 21, 0.0);
    //  uart1_print("\r\n max_pid_output_pan: 0x%04x, 0b%s, d:%d \r\n", max_pid_output_pan, rx_binary_string(max_pid_output_pan), max_pid_output_pan);
     // uart1_print("\r\n max_pid_output_tilt: 0x%04x, 0b%s, d:%d \r\n", max_pid_output_tilt, rx_binary_string(max_pid_output_tilt), max_pid_output_tilt);

      // Increment values for mapping
      pan_step_increment = max_pid_output_pan / MAX_MAP_STEP;
      tilt_step_increment = max_pid_output_pan / MAX_MAP_STEP;

}

INT32S Pan_PID_Compute(PIDController_t *pid, INT8S combinedReference, INT8S encMeasuredVal){
    INT8S error = combinedReference - encMeasuredVal;
   uart1_print("\r\n Pan error: 0x%04x, 0b%s, d:%d \r\n", error, rx_binary_string(error), error);

    // Proportional
    INT32S P = pid->kp * error;
   //uart1_print("\r\nProportional: 0x%04x, 0b%s, d:%d \r\n", P, rx_binary_string(P), P);

    // Integral
    //FP32 I = pid->prev_integral + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);
    //pid->prev_integral = I; // Save the integral term for next calculation

    // Derivative
    INT32S D = - (pid->alpha / pid->beta) * pid->prev_derivative + (pid->gamma / pid->beta) * (error - pid->prev_error);
    pid->prev_derivative = D; // Save the derivative term for next calculation

    //uart1_print("\r\nDerivative: 0x%04x, 0b%s, d:%d \r\n", D, rx_binary_string(D), D);


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

INT32S Tilt_PID_Compute(PIDController_t *pid, INT8S combinedReference, INT8S encMeasuredVal){
    INT8S error = combinedReference - encMeasuredVal;
  uart1_print("\r\n Tilt error: 0x%04x, 0b%s, d:%d \r\n", error, rx_binary_string(error), error);

    // Proportional
    INT32S P = pid->kp * error;
   //uart1_print("\r\nProportional: 0x%04x, 0b%s, d:%d \r\n", P, rx_binary_string(P), P);

    // Integral
    //FP32 I = pid->prev_integral + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);
    //pid->prev_integral = I; // Save the integral term for next calculation

    // Derivative
    INT32S D = - (pid->alpha / pid->beta) * pid->prev_derivative + (pid->gamma / pid->beta) * (error - pid->prev_error);
    pid->prev_derivative = D; // Save the derivative term for next calculation

    //uart1_print("\r\nDerivative: 0x%04x, 0b%s, d:%d \r\n", D, rx_binary_string(D), D);


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

  //  PID_Init(&tiltPID, 25.0, 0., 0.1, 0.004, 1000.0, -12.0, 12.0);
   // PID_Init(&panPID, 25.0, 0., 0.1, 0.004, 1000.0, -12.0, 12.0);
    PID_Init(&tiltPID, 1.0, 0.0f, 0.0f, 0.005f, 1000.0, -12.0, 12.0);
    PID_Init(&panPID, 1.0, 0., 0., 0.005, 1000.0, -12.0, 12.0);

    INT8S panVisionRef = 0;
    INT8S panEncMeasuredVal =  0;

    INT32S panOutput = 0;
    INT8S panIn;

    INT32S tiltOutput = 0;
    INT8S tiltIn;

    INT8S tiltVisionRef   = 0;
    INT8S tiltEncMeasuredVal =  0;

    INT8S panEncCurrentVal =  0;
    INT8S tiltEncCurrentVal =  0;

    INT8S panCombinedRef = 0;
    INT8S tiltCombinedRef = 0;

    for(EVER){

        if((xQueueReceive(xPanCtrlInQueue, &panIn, 0) == pdTRUE)
          && (xQueueReceive(xTiltCtrlInQueue, &tiltIn, 0) == pdTRUE)){
        //  uart1_print("\r\n<<<PID_CONTROLLER_VISION>>>\r\n");
           FSM_STATUS = CTRL;

            //updating reference
            panVisionRef = panIn;
            tiltVisionRef = tiltIn;

           panEncCurrentVal = panEncMeasuredVal;
           tiltEncCurrentVal = tiltEncMeasuredVal;

           panCombinedRef = panVisionRef+panEncMeasuredVal;
           tiltCombinedRef = tiltVisionRef+tiltEncMeasuredVal;

       //uart1_print("\r\panVisionRef: 0x%04x, 0b%s, d:%d \r\n", panVisionRef, rx_binary_string(panVisionRef), panVisionRef);
       //uart1_print("\r \tiltVisionRef: 0x%04x, 0b%s, d:%d \r\n", tiltVisionRef, rx_binary_string(tiltVisionRef), tiltVisionRef);

         // uart1_print("\r\panEncCurrentVal: 0x%04x, 0b%s, d:%d \r\n", panEncCurrentVal, rx_binary_string(panEncCurrentVal), panEncCurrentVal);
         //uart1_print("\r\ntiltEncCurrentVal: 0x%04x, 0b%s, d:%d \r\n", tiltEncCurrentVal, rx_binary_string(tiltEncCurrentVal), tiltEncCurrentVal);

        }

       if((xQueueReceive(xPanFbInQueue, &panEncMeasuredVal, 0) == pdTRUE)
          && (xQueueReceive(xTiltFbInQueue, &tiltEncMeasuredVal, 0) == pdTRUE)){

         //uart1_print("\r\n<<<PID_CONTROLLER_ENCODER>>>\r\n");

         //uart1_print("panVisionRef: d:%d, panEncMeasuredVal: d:%d, \r\n", panVisionRef, panEncMeasuredVal);
         //uart1_print("tiltVisionRef: d:%d,  tiltEncMeasuredVal: d:%d \r\n", tiltVisionRef,tiltEncMeasuredVal);
       uart1_print("panEncMeasuredVal: 0x%04x, 0b%s, d:%d \r\n", panEncMeasuredVal, rx_binary_string(panEncMeasuredVal), panEncMeasuredVal);
     uart1_print("tiltEncMeasuredVal: 0x%04x, 0b%s, d:%d \r\n", tiltEncMeasuredVal, rx_binary_string(tiltEncMeasuredVal), tiltEncMeasuredVal);
           FSM_STATUS = CTRL;
         //BLOCK SPI

           //GPIO_PORTF_DATA_R ^=  (1U << 4);// Toggle PB2 (XOR bit 2)
            panOutput = Pan_PID_Compute(&panPID, panCombinedRef, panEncMeasuredVal);
           tiltOutput = Tilt_PID_Compute(&tiltPID, tiltCombinedRef, tiltEncMeasuredVal);
            //GPIO_PORTF_DATA_R ^=  (1U << 4);// Toggle PB2 (XOR bit 2)
            //tiltOutput =  0b0000000000000000;
            //PAN CTRL OUT (to map then to motor) //TILT CTRL OUT (to map then to motor)
          //  uart1_print("\r\npanOutput:  0x%04x, 0b%s, d:%d \r\n", panOutput, rx_binary_string(panOutput), panOutput);
           // uart1_print("tiltOutput:  0x%04x, 0b%s, d:%d \r\n", tiltOutput, rx_binary_string(tiltOutput), tiltOutput);
            xQueueSend(xPanCtrlOutQueue, &panOutput, 0);
            xQueueSend(xTiltCtrlOutQueue, &tiltOutput, 0);


           //uart1_print("cunt");

       }


           // taskYIELD();
     //  GPIO_PORTB_DATA_R ^=  (1U << 2);// Toggle PB2 (XOR bit 2)
      // GPIO_PORTF_DATA_R ^=  (1U << 2);// Toggle PB2 (XOR bit 2)
           vTaskDelay(pdMS_TO_TICKS(1));
            // vTaskDelayUntil( &xLastWakeTime, xFrequency );
     }

}
