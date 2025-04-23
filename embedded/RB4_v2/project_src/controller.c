/*
 * controller.c
 *
 *  Created on: 18 Mar 2025
 *      Author: linax
 */


#include "common.h"
#include "controller.h"
#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "uart_config.h"

extern QueueHandle_t xUartRxQueue, xUartTxQueue;
extern unsigned char Feedback, ref, fb;

void vControllerTask(void *pv) {
    TickType_t lastWake = xTaskGetTickCount();
    uint8_t in, fb, out;
    for (;;) {
        uart_putc('C');
            uart_print("\r\n<<<CONTROLLER>>>\r\n");

            if(xQueueReceive(xUartRxQueue, &in, pdMS_TO_TICKS(300))== pdTRUE){
            in -= '0';
            fb = ref - in;
            Feedback += fb;
            out = ref + Feedback;

            }
            uart_print("\r\n in:%u fb:%u \r\n", in, fb);
            if(xQueueSend(xUartTxQueue, &out, pdMS_TO_TICKS(300)) == pdTRUE)
            {
                uart_print("\r\n<<<controller output>>>\r\n");

            }


        vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(2000));
    }
}


