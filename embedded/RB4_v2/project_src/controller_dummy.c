/*
 * controller.c
 *
 *  Created on: 18 Mar 2025
 *      Author: linax
 */

#include <controller_dummy.h>
#include "common.h"

extern unsigned char Feedback;

void vControllerDummyTask(void *pv) {
    TickType_t lastWake = xTaskGetTickCount();
    uint8_t in, out;

    for (;;) {
            uart_print("\r\n<<<CONTROLLER DUMMY>>>\r\n");

            if(xQueueReceive(xUartRxQueue, &in, pdMS_TO_TICKS(300))== pdTRUE){ //macro for delay???
                //dummy controller computation
                in -= '0';
                fb = ref - in;
                Feedback += fb;
                out = ref + Feedback;

            }

            uart_print("\r\n in:%u fb:%u \r\n", in, fb); //always print input and feedback

            //controller output send through txQueue, and printed in txTask
            if(xQueueSend(xUartTxQueue, &out, pdMS_TO_TICKS(300)) == pdTRUE)  //macro for delay???
            {
                uart_print("\r\n<<<controller dummy output>>>\r\n");

            }

        vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(2000));
    }
}


