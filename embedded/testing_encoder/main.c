
/**
 * main.c
 */
#include <stdint.h>
#include "tm4c123gh6pm.h"
#include "emp_type.h"
#include "systick_frt.h"
#include "FreeRTOS.h"
#include "task.h"
#include "tmodel.h"
#include "queue.h"
#include "semphr.h"
#include "status_led.h"'
#include "spi.h"
#include "uart.h"
#include "control.h"

#define USERTASK_STACK_SIZE configMINIMAL_STACK_SIZE
#define IDLE_PRIO 0
#define LOW_PRIO 1
#define MED_PRIO 2
#define HIGH_PRIO 3

#define BAUDRATE 115200

#define QUEUE_LEN 128

static void setupHardware(void)
/*****************************************************************************
 *   Input    :  -
 *   Output   :  -
 *   Function :
 *****************************************************************************/
{
  // Warning: If you do not initialize the hardware clock, the timings will be inaccurate
  init_systick();
  init_gpio();
  SPI_init();
  uart0_init(BAUDRATE);
}

int main(void)
{
  static struct spi_info spi_info;
  spi_info_init(&spi_info);
  static struct uart_info uart_info;
  uart_info_init(&uart_info);
  static struct control_info control_info;
  control_info_init(&control_info, &spi_info, &uart_info);
  static struct PID_controller PID_controller;
  PID_init(&PID_controller, &spi_info, &uart_info);
  
  int i;
  for (i = 0; i <= 20; i++);

  setupHardware();
  xTaskCreate(status_led, "red_LED_task", USERTASK_STACK_SIZE, NULL, LOW_PRIO, NULL);
  xTaskCreate(spi_task, "spi_task", USERTASK_STACK_SIZE, (void *)&spi_info, LOW_PRIO, NULL);
  xTaskCreate(uart_task, "uart_task", USERTASK_STACK_SIZE, (void *)&uart_info, LOW_PRIO, NULL);
  // xTaskCreate(control_task, "control_task", USERTASK_STACK_SIZE, (void *)&control_info, LOW_PRIO, NULL);
//   xTaskCreate(uart_task2, "uart_task2", USERTASK_STACK_SIZE, (void *)&control_info, LOW_PRIO, NULL);
   xTaskCreate(PID_task, "PID_task", USERTASK_STACK_SIZE, (void *)&PID_controller, LOW_PRIO, NULL);

  vTaskStartScheduler();
  return 0;
}
