/*****************************************************************************
* University of Southern Denmark
* Embedded C Programming (ECP)
*
* MODULENAME.: glob_def.h
*
* PROJECT....: ECP
*
* DESCRIPTION: Definements of variable types.
*
* Change Log:
******************************************************************************
* Date    Id    Change
* YYMMDD
* --------------------
* 050128  KA    Module created.
*
*****************************************************************************/

#ifndef _GLOB_DEF_H
  #define _GLOB_DEF_H

/***************************** Include files *******************************/

/*****************************    Defines    *******************************/

#define FALSE	0
#define TRUE  !FALSE
#define NULL	((void *)0)
#define EVER ;;
#define NONE 0
#define LEFT    0
#define RIGHT   1
#define NEGATIVE 0
#define POSITIVE 1

#define ONE_MS 1
#define TEN_MS 10
#define HUNDRED_MS 100
#define TWO_SEC 2000
#define THREE_SEC 3000

#define RESET 0
#define SET TRUE
#define NOT_SET FALSE

#define UART_ERROR_CODE 0xFFFF
#define MOTOR_STOP_COMMAND 0x0001

// Control defs
#define MAX_DEGREE_PAN 38.48
#define MAX_DEGREE_TILT 21.31
#define MAX_MAP_STEP 20
#define GEAR_RATIO 3              // 1:3 gear ratio for the external gears
#define ENC_CPR 360               // Encoder counts per revolution

// Pan and tilt direction seen from the camera
#define PAN_DIR_LEFT 1
#define PAN_DIR_RIGHT 0
#define TILT_DIR_UP 1
#define TILT_DIR_DOWN 0


/*****************************   Constants   *******************************/



/*****************************   Functions   *******************************/

/****************************** End Of Module *******************************/
#endif
