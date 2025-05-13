/*
 * uart_rx_task.c
 *
 *  Created on: 24 Mar 2025
 *      Author: linax
 */

#include "common.h"
#include "debugger.h"
extern QueueHandle_t xUart16DebugQueue;
extern QueueHandle_t xUart8DebugQueue;

void printState(){
    switch(FSM_STATUS)
          {
            case IDLE: //idle ??
                uart_print(1, "STATE: idle");
              break;
            case CTRL: //controller task
                uart_print(1, "STATE: controller");
              break;
            case URTRX: //uart rx task
                uart_print(1, "STATE: uart receiver");
              break;
            case URTTX: //uart tx task
                uart_print(1, "STATE: uart transmitter");
              break;
            case SPIRX: //spi rx task
                uart_print(1, "STATE: spi receiver");
              break;
            case SPITX:  //spi tx task
                uart_print(1, "STATE: spi transmitter");
              break;
            case GFPC: //get frame/unpack from pc
                uart_print(1, "STATE: get frame from pc");
              break;
            case GFFPGA: //get frame/unpack from fpga
                uart_print(1, "STATE: get from fpga");
              break;
            case CFPC: //create frame/unpack from pc
                uart_print(1, "STATE: send frame to pc");
              break;
            case CFFPGA: //create frame/unpack from fpga
                uart_print(1, "STATE: send frame to fpga");
              break;
          }

}


void vDebugTask(void *pvParameters) {

      INT8U prev_state = FSM_STATUS; //save elevator state
      INT8U DB8int;
      INT16U DB16int;

   for(;;){
       /*
              if( prev_state != FSM_STATUS ) //on state change run driver
              {
                  printState();
                  prev_state = FSM_STATUS;

              }
*/

        if(xQueueReceive(xUart16DebugQueue, &DB16int, pdMS_TO_TICKS(100) ) == pdTRUE){
              uart_print(1,"uart DB 16 int: ");
              uart_send_16int(1, DB16int);
              uart_print(1,"\n");
        }
        if(xQueueReceive(xUart8DebugQueue, &DB8int, pdMS_TO_TICKS(100) ) == pdTRUE){
                     uart_print(1,"uart DB 8 int: ");
                     uart_putc(1, DB8int);
                     uart_print(1,"\n");
               }

          vTaskDelay( pdMS_TO_TICKS(500) ); //optimal?
      }



}





/*
const char* getTaskStateString(eTaskState state) {
    switch (state) {
        case eRunning:   return "Running";
        case eReady:     return "Ready";
        case eBlocked:   return "Blocked";
        case eSuspended: return "Suspended";
        case eDeleted:   return "Deleted";
        default:         return "Unknown";
    }
}

void vDebugTask(void *pvParameters) {
    //uart_print("\r\n<<<DEBUGGER>>>\r\n");
    TickType_t lastWake = xTaskGetTickCount();

    for (;;) {
        //uart_print("=== Debug: System State ===\n");
        TaskStatus_t taskStats[10];
        UBaseType_t total = uxTaskGetSystemState(taskStats, 10, NULL);

       // uart_print("Number of tasks:  %u\n", total);
        uint8_t i;
      for (i = 0; i < total; i++) {
           // uart_print("Task: %s | Num: %u | Prio: %u | State: %s | Stack: %u\n",
                taskStats[i].pcTaskName,
                taskStats[i].xTaskNumber,
                taskStats[i].uxCurrentPriority,
                getTaskStateString(taskStats[i].eCurrentState),
                taskStats[i].usStackHighWaterMark);
        }

        vTaskDelayUntil(&lastWake, pdMS_TO_TICKS(1000));
    }


}

*/
