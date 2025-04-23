/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: swtimers.c
*
* PROJECT....: ECP
*
* DESCRIPTION: See module specification file (.h-file).
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 080219  MoH    Module created.
*
*****************************************************************************/

/***************************** Include files *******************************/
//#include "common.h"
#include "messages.h"
/*****************************    Defines    *******************************/
#define MAX_MSG 64

/*****************************   Constants   *******************************/

/*****************************   Variables   *******************************/

INT8U   msg_event[MAX_MSG];
INT8U   msg_state[MAX_MSG];

/*****************************   Functions   *******************************/

INT8U get_msg_event( no )
INT8U no;
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
  INT8U result = 0;

  if( no < MAX_MSG )
  {
    if( msg_event[no] )
	  {
	    result = msg_event[no];
	    msg_event[no] = 0;
	  }
  }
  return( result );
}



void put_msg_event( no, event )
INT8U  no;
INT8U  event;
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
  if( no < MAX_MSG )
    msg_event[no] = event;
}

INT8U get_msg_state( no )
INT8U no;
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
  INT8U result = 0;

  if( no < MAX_MSG )
  {
    result = msg_state[no];
  }
  return( result );
}



void put_msg_state( no, state )
INT8U  no;
INT8U  state;
/*****************************************************************************
*   Function : See module specification (.h-file).
*****************************************************************************/
{
  if( no < MAX_MSG )
    msg_state[no] = state;
}

