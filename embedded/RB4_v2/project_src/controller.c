/*
 * controller.c
 *
 *  Created on: 28 Apr 2025
 *      Author: linax
 */

#include "common.h"
#include "controller.h"


void PID_Init(PIDController_t *pid,
              double kp, double ki, double kd, double Ts,
              double output_min, double output_max)
{
    pid->kp = kp;
    pid->ki = ki;
    pid->kd = kd;
    pid->Ts = Ts;
    pid->prev_error = 0.0;
    pid->integral   = 0.0;
    pid->output_min = output_min;
    pid->output_max = output_max;
}

double PID_Compute(PIDController_t *pid,
                   double reference,
                   double measured_value)
{
    double error = reference - measured_value;

        // Proportional
        double P = pid->kp * error;

        // Integral
        double I = pid->ki * pid->prev_error + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);

        // Derivative
        double D = pid->kd * (2 / pid->Ts) * (error - pid->prev_error) - pid->kd * pid->prev_error;

        // Update previous error for next calculation
        pid->prev_error = error;

        // Compute PID output
        double output = P + I + D;

        // Clamp output to min/max
        if (output > pid->output_max) {
            pid->ki = 0.0; // Reset integral term if output exceeds max
        } else if (output < pid->output_min) {
            output = pid->output_min;
        }

        // Update integral term with anti-windup
        pid->integral += error * pid->Ts;
        if (pid->integral > pid->output_max) {
            pid->integral = pid->output_max;
        } else if (pid->integral < pid->output_min) {
            pid->integral = pid->output_min;
        }

        // Save current error for next derivative calculation
        pid->prev_error = error;

        return output;

}

void vPidControllerTask(void *pvParameters)
{
    //uart_putc('C');

    PIDController_t pid;
    PID_Init(&pid,  1.0, 0.5, 0.1, 0.1, -10.0, 10.0);
    double reference      = 100.0;
    double measured_value =  0.0;
    double output = 0.0;
    uint8_t in;

    TickType_t xLastWakeTime = xTaskGetTickCount(); //initilize before start of task

    for( ;; )
    {
        //uart_print("<<<PID CONTROLLER>>>");
        // response simulation??

        measured_value += output; // * dt
        uart_print("\r\n measured_value: \r\n");
        uart_send_double(measured_value); //has to be done before sending output to txqueue,
                                          // so controller task can yield to txtask


        //controller input from rxQueue
        if(xQueueReceive(xUartRxQueue, &in, pdMS_TO_TICKS(100))== pdTRUE){ //macro for delay???
            uart_print("\r\n PID in: \r\n");
            uart_putc(in);
            measured_value = in;
        }

        double output = PID_Compute(&pid, reference, measured_value);

        //controller output send through txQueue, and printed in txTask
        if(xQueueSend(xUartTxQueue, &output, pdMS_TO_TICKS(200)) == pdTRUE){  //macro for delay???
            uart_print("\r\n PID out: \r\n");
            //uart_putc(output);
        }

        vTaskDelayUntil(&xLastWakeTime, pdMS_TO_TICKS(PID_FREQ_MS));
   }


}

