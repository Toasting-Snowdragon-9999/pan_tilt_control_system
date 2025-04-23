/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: button.c
*
* PROJECT....: EMP
*
* DESCRIPTION: See module specification file (.h-file).
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 090215  MoH   Module created.
*
*****************************************************************************/

/***************************** Include files *******************************/

#include "common.h"
#include "sw_task.h"

/*****************************    Defines    *******************************/
#define BS_IDLE           0
#define BS_FIRST_PUSH     1
#define BS_FIRST_RELEASE  2
#define BS_SECOND_PUSH    3
#define BS_LONG_PUSH      4

/*****************************   Constants   *******************************/


/*****************************   Variables   *******************************/
INT8U  button_state = BS_IDLE;
/*****************************   Functions   *******************************/
INT8U button_pushed()
{
  return( !(GPIO_PORTF_DATA_R & 0x10) );                                // SW1 at PF4
}

void update_button_queue(INT8U button_state){
    char ch;

    switch(button_state){
        case BS_IDLE:
            ch = 'I';
            break;

        case BS_FIRST_RELEASE:
            ch = 'R';
            break;

        case BS_SECOND_PUSH:
            ch = 'G';
            break;

        case BS_LONG_PUSH:
            ch = 'B';
        break;

    }

    xQueueSendToFront( xUartTxQueue, &ch, pdMS_TO_TICKS(100) );
}


void vSwitchTask(void * pvParameters)

/*****************************************************************************
*   Input    :
*   Output   :
*   Function :
******************************************************************************/
{
for(;;){
    uart_print("\r\n<<<SWITCH_TASK>>>\r\n");
   INT8U  time_out;

   time_out = get_msg_event( SEB_TO_BUTTON );

  switch( button_state )
  {
    case BS_IDLE:
        if( button_pushed( ))                                           // if button pushed
        {
            button_state = BS_FIRST_PUSH;                               // we go from the idle state to first push
            start_swtimer( ST_BUTTON, SEB_TO_BUTTON, pdMS_TO_TICKS(2000) );  // we set a timer of 2s to see if this is a long push
      }
        break;
    case BS_FIRST_PUSH:
        if( time_out )                                                  // if the timer runs out before the button was released it was a long push
        {
            button_state = BS_LONG_PUSH;
            put_msg_event( SEB_BUTTON_EVENT, BE_LONG_PUSH );
        }
        else
        {
        if( !button_pushed() )                                          // if button released before the timer runs out it was a normal push
        {
            button_state = BS_FIRST_RELEASE;
            start_swtimer( ST_BUTTON, SEB_TO_BUTTON, pdMS_TO_TICKS(100) );   // we set a new timer to see if the button is pressed again shortly after (double push)
        }
        }
        break;
    case BS_FIRST_RELEASE:
        if( time_out )                                                  // if the timer runs out without the button being pushed again it was a single push
        {
            button_state = BS_IDLE;
            put_msg_event( SEB_BUTTON_EVENT, BE_SINGLE_PUSH );
        }
        else
        {
        if( button_pushed() )                                           // if button is pressed again before the timer runs out it was a double push
        {
            button_state = BS_SECOND_PUSH;
            start_swtimer( ST_BUTTON, SEB_TO_BUTTON, pdMS_TO_TICKS( 2000 )); // we set a new timer to see if it is a long push
        }
        }
        break;
    case BS_SECOND_PUSH:
        if( time_out )                                                  // if the timer runs out before button is released it was a long push
        {
          button_state = BS_LONG_PUSH;
        put_msg_event( SEB_BUTTON_EVENT, BE_LONG_PUSH );
        }
        else
        {
        if( !button_pushed() )                                          // if button released before the timer runs out it was a double push
        {
            button_state = BS_IDLE;
            put_msg_event( SEB_BUTTON_EVENT, BE_DOUBBLE_PUSH );
        }
        }
        break;
    case BS_LONG_PUSH:
        if( !button_pushed() )                                          // when the button is released after a long push we go back to the idle state
            button_state = BS_IDLE;
        break;
    default:
      break;
  }

  update_button_queue(button_state);
  //DELAY
           vTaskDelay( pdMS_TO_TICKS( 1500) );
}


}


/****************************** End Of Module *******************************/












