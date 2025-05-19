/*
 * control.c
 *
 *  Created on: 16 May 2025
 *      Author: lucas
 */

#include "control.h"

void PID_init(struct PID_controller *PID_controller,
              struct spi_info *spi_info,
              struct uart_info *uart_info)
{
    PID_controller->spi_info = spi_info;
    PID_controller->uart_info = uart_info;
    PID_controller->kp = 1.0f; //5.0f; // 25.0f;
    PID_controller->ki = 0.0f;
    PID_controller->kd = 0.0f; //0.001f; // 0.1f;
    PID_controller->Ts = (1.0f / 200.0f);
    PID_controller->N = 1000.0f;
    PID_controller->output_min = -12.0f;
    PID_controller->output_max = 12.0f;

    // Initialize PID coefficients for the derivative term
    PID_controller->alpha = PID_controller->N * (PID_controller->Ts / 2.0f) - 1;
    PID_controller->beta = 1 + PID_controller->N * (PID_controller->Ts / 2.0f);
    PID_controller->gamma = PID_controller->kd * PID_controller->N;
    // Initialize previous values
    PID_controller->prev_error = 0;
    // pid->integral   = 0.0;
    // pid->prev_integral = 0.0;
    PID_controller->prev_derivative = 0;

    // Initialize PID output limits
    PID_controller->max_pid_output_pan = PID_compute(PID_controller, MAX_DEGREE_PAN, 0.0);
    PID_controller->max_pid_output_tilt = PID_compute(PID_controller, MAX_DEGREE_TILT, 0.0);

    // Increment values for mapping
    PID_controller->pan_step_increment = PID_controller->max_pid_output_pan / MAX_MAP_STEP;
    PID_controller->tilt_step_increment = PID_controller->max_pid_output_tilt / MAX_MAP_STEP;

    // Initialize reference values
    PID_controller->combined_ref_pan = 0;
    PID_controller->combined_ref_tilt = 0;
    PID_controller->vision_ref_pan = 0;
    PID_controller->vision_ref_tilt = 0;

    // Initialize output values
    PID_controller->pid_output_pan = 0;
    PID_controller->pid_output_tilt = 0;

    // Initialize encoder values and history
    PID_controller->enc_pan = 0;
    PID_controller->enc_tilt = 0;
    PID_controller->prev_enc_pan = 0;
    PID_controller->prev_enc_tilt = 0;
    PID_controller->enc_pan_total = 0;
    PID_controller->enc_tilt_total = 0;

    // U_d(z) / e(z) = gamma * (z-1) / (alpha*z + beta)
}

INT32S PID_compute(struct PID_controller *PID_controller, INT8S vision_reference, INT8S enc_measured_val)
{
    INT8S error = vision_reference - enc_measured_val;

    // Proportional term
    INT32S P = PID_controller->kp * error;

    // Integral term
    // FP32 I = pid->prev_integral + pid->ki * (pid->Ts / 2) * (error + pid->prev_error);
    // pid->prev_integral = I; // Save the integral term for next calculation

    // Derivative term
    INT32S D = -(PID_controller->alpha / PID_controller->beta) * PID_controller->prev_derivative + (PID_controller->gamma / PID_controller->beta) * (error - PID_controller->prev_error);

    PID_controller->prev_derivative = D; // Save the derivative term for next calculation

    // Update previous error for next calculation
    PID_controller->prev_error = error;

    // Compute PID output
    INT32S output = (INT32S)(P + D); // expected voltage

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

INT8S ticks_to_degrees(INT8S ticks)
{

    if (GEAR_RATIO <= 0.0 || ENC_CPR <= 0)
    {
        return 0.0; // or some error value
    }

    return ((INT8S)ticks / (GEAR_RATIO * ENC_CPR)) * 360.0;
}

void tiva_fpga_map_pan(struct PID_controller *PID_controller)
/*****************************************************************************
 *   Input    : INT32S pid_output_pan - PID output value from the pan controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 *****************************************************************************/
{
    PID_controller->pid_speed_pan = abs(PID_controller->pid_output_pan) / PID_controller->pan_step_increment;
    // hardcode if 10 then stop, if less than 25 then 25
    // if (PID_controller->pid_speed_pan < 2)
    // {
    //     PID_controller->pid_speed_pan = 0;
    // }
    // else if (PID_controller->pid_speed_pan < 5)
    // {
    //     PID_controller->pid_speed_pan = 5;
    // }
    if (PID_controller->pid_speed_pan > 20)
    {
        PID_controller->pid_speed_pan = 20;
    }

    PID_controller->pid_dir_pan = PID_controller->pid_output_pan < 0 ? PAN_DIR_LEFT : PAN_DIR_RIGHT;
}

void tiva_fpga_map_tilt(struct PID_controller *PID_controller)
/*****************************************************************************
 *   Input    : INT32S pid_output_tilt - PID output value from the tilt controller
 *   Output   : INT8S - Mapped value for the FPGA
 *   Function : Maps the PID output value to a range suitable for the FPGA
 *****************************************************************************/
{
    PID_controller->pid_speed_tilt = abs(PID_controller->pid_output_tilt) / PID_controller->tilt_step_increment;
    // hardcode if 10 then stop, if less than 25 then 25
    // if (PID_controller->pid_speed_tilt < 2)
    // {
    //     PID_controller->pid_speed_tilt = 0;
    // }
    // else if (PID_controller->pid_speed_tilt < 5)
    // {
    //     PID_controller->pid_speed_tilt = 5;
    // }
    if (PID_controller->pid_speed_tilt > 20)
    {
        PID_controller->pid_speed_tilt = 20;
    }

    PID_controller->pid_dir_tilt = PID_controller->pid_output_tilt < 0 ? TILT_DIR_DOWN : TILT_DIR_UP;
}

void update_encoder_total(struct PID_controller *PID)
{
    // Calculate deltas (8-bit arithmetic handles wrapping correctly)
    INT8S delta_pan = PID->enc_pan - PID->prev_enc_pan;
    INT8S delta_tilt = PID->enc_tilt - PID->prev_enc_tilt;

    // Accumulate total
    PID->enc_pan_total += delta_pan;
    PID->enc_tilt_total += delta_tilt;

    // Store current as previous for next time
    PID->prev_enc_pan = PID->enc_pan;
    PID->prev_enc_tilt = PID->enc_tilt;
}

void unpack_uart_frame(struct PID_controller *PID_controller, uint16_t message)
{
    INT8S MSB = (INT8S)(message >> 8);
    INT8S LSB = (INT8S)(message & 0x00FF);
    BOOLEAN motor_check_MSB = MSB >> 7;
    BOOLEAN motor_check_LSB = LSB >> 7;
    INT8S error_MSB = MSB & 0x7F;
    INT8S error_LSB = LSB & 0x7F; // 0b00000111

    // PID_controller->vision_ref_pan = (motor_check_MSB) ? error_MSB : error_LSB;
    // PID_controller->vision_ref_tilt = (motor_check_LSB) ? error_MSB : error_LSB;

    PID_controller->vision_ref_pan = error_MSB;
    PID_controller->vision_ref_tilt = error_LSB;
}

void unpack_spi_frame(struct PID_controller *PID_controller, uint16_t message)
{ // From FPGA to TIVA (And vision to TIVA)

    // shift MSB of EncoderFrame into panVal
    PID_controller->enc_pan = (INT8S)(message >> 8);

    // shift LSB of EncoderFrame into tiltVal
    PID_controller->enc_tilt = (INT8S)(message & 0xFF);
}

uint16_t create_frame(struct PID_controller *PID_controller)
{ // From TIVA to FPGA

    uint16_t frame = 0x0000;

    frame |= (0 << 15)                                        // start bit = 0
             | (0 << 14) | (0 << 13)                          // dummy bits
             | ((PID_controller->pid_dir_pan & 0x01) << 12)   // 1 bit
             | ((PID_controller->pid_speed_pan & 0x1F) << 7)  // 5 bit
             | ((PID_controller->pid_dir_tilt & 0x01) << 6)   // 1 bit
             | ((PID_controller->pid_speed_tilt & 0x1F) << 1) // 5 bit
             | (1 << 0);                                      // stop bit = 1
    return frame;
}

void PID_task(void *pvParameter)
{
    struct PID_controller *PID_controller = (struct PID_controller *)pvParameter;

    for (EVER)
    {
        uint16_t uart_rx = get_uart_rx(PID_controller->uart_info);
        BOOLEAN uart_new_flag = PID_controller->uart_info->new_data_flag;
        unpack_uart_frame(PID_controller, uart_rx);
        uint16_t spi_rx = get_spi_rx(PID_controller->spi_info);
        set_uart_tx(PID_controller->uart_info, spi_rx);
        unpack_spi_frame(PID_controller, spi_rx);
        update_encoder_total(PID_controller);
        if (uart_new_flag)
        {

            PID_controller->combined_ref_pan = PID_controller->vision_ref_pan + PID_controller->enc_pan_total;
            PID_controller->combined_ref_tilt = PID_controller->vision_ref_tilt + PID_controller->enc_tilt_total;

            PID_controller->uart_info->new_data_flag = 0;
        }

        PID_controller->pid_output_pan = PID_compute(PID_controller, PID_controller->combined_ref_pan, PID_controller->enc_pan_total);
        PID_controller->pid_output_tilt = PID_compute(PID_controller, PID_controller->combined_ref_tilt, PID_controller->enc_tilt_total);

        tiva_fpga_map_pan(PID_controller);
        tiva_fpga_map_tilt(PID_controller);

        uint16_t spi_message = create_frame(PID_controller);

        set_spi_tx(PID_controller->spi_info, spi_message);

        vTaskDelay(5 / portTICK_RATE_MS);
    }
}

void control_info_init(struct control_info *control_info, struct spi_info *spi_info, struct uart_info *uart_info)
{
    control_info->spi_info = spi_info;
    control_info->uart_info = uart_info;
    control_info->stop_flag = FALSE;
}

void control_task(void *pvParameter)
{
    struct control_info *control_info = (struct control_info *)pvParameter;

    for (EVER)
    {

        static uint16_t spi_rx_temp = 0xFFFF;
        static uint16_t uart_rx_temp = 0x0000;

        if (xSemaphoreTake(control_info->uart_info->semaphore, portMAX_DELAY))
        {
            uart_rx_temp = control_info->uart_info->rx;
            control_info->uart_info->tx = spi_rx_temp;
            xSemaphoreGive(control_info->uart_info->semaphore);
        }

        if (xSemaphoreTake(control_info->spi_info->semaphore, portMAX_DELAY))
        {
            if (control_info->stop_flag)
            {
                control_info->spi_info->tx = MOTOR_STOP_COMMAND;
            }
            else
            {
                control_info->spi_info->tx = uart_rx_temp;
            }
            spi_rx_temp = control_info->spi_info->rx;
            xSemaphoreGive(control_info->spi_info->semaphore);
        }
        uint8_t enc_pos_pan = ((spi_rx_temp & 0xFF00) >> 8);
        uint8_t enc_pos_tilt = (spi_rx_temp & 0x00FF);

        if (enc_pos_pan == 0x10)
        {
            control_info->stop_flag = TRUE;
        }

        // if(control_info->spi_info->rx)
        vTaskDelay(10 / portTICK_RATE_MS);
    }
}

void uart_task2(void *pvParameter)
{
    struct control_info *control_info = (struct control_info *)pvParameter;

    for (EVER)
    {
        control_info->uart_info->tx = control_info->uart_info->rx;
        vTaskDelay(10 / portTICK_RATE_MS);
    }
}
