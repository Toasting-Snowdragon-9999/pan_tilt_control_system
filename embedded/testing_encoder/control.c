/*
 * control.c
 *
 *  Created on: 16 May 2025
 *      Author: chris
 */


#include "control.h"

void control_info_init(struct control_info *control_info, struct spi_info *spi_info, struct uart_info *uart_info){
    control_info->spi_info = spi_info;
    control_info->uart_info = uart_info;
    control_info->stop_flag = FALSE;
}


void control_task(void *pvParameter){
    struct control_info* control_info = (struct control_info*)pvParameter;

    for(EVER){

        static uint16_t spi_rx_temp = 0xFFFF;
        static uint16_t uart_rx_temp = 0x0000;

        if(xSemaphoreTake(control_info->uart_info->semaphore, portMAX_DELAY)) {
            uart_rx_temp = control_info->uart_info->rx;
            control_info->uart_info->tx = spi_rx_temp;
            xSemaphoreGive(control_info->uart_info->semaphore);
        }

        if(xSemaphoreTake(control_info->spi_info->semaphore, portMAX_DELAY)) {
            if(control_info->stop_flag){
                control_info->spi_info->tx = MOTOR_STOP_COMMAND;
            }
            else{
                control_info->spi_info->tx = uart_rx_temp;
            }
            spi_rx_temp = control_info->spi_info->rx;
            xSemaphoreGive(control_info->spi_info->semaphore);
        }
        uint8_t enc_pos_pan = ((spi_rx_temp & 0xFF00) >> 8);
        uint8_t enc_pos_tilt = (spi_rx_temp & 0x00FF);
        
        if(enc_pos_pan == 0x10){
            control_info->stop_flag = TRUE;
        }

        //if(control_info->spi_info->rx)
        vTaskDelay(10 / portTICK_RATE_MS);
    }
}
