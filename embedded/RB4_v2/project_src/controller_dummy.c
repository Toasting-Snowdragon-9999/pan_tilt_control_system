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
