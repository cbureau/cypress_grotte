//*****************************************************************************
//*****************************************************************************
//  FILENAME: ONOFF.h
//   Version: 1.40, Updated on 2013/5/19 at 10:43:48                                          
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION: ONOFF User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef ONOFF_INCLUDE
#define ONOFF_INCLUDE

#include <m8c.h>


/* Create pragmas to support proper argument and return value passing */
#pragma fastcall16  ONOFF_Stop
#pragma fastcall16  ONOFF_Start
#pragma fastcall16  ONOFF_On
#pragma fastcall16  ONOFF_Off
#pragma fastcall16  ONOFF_Switch
#pragma fastcall16  ONOFF_Invert
#pragma fastcall16  ONOFF_GetState


//-------------------------------------------------
// Constants for ONOFF API's.
//-------------------------------------------------
//
#define  ONOFF_ON   1
#define  ONOFF_OFF  0

//-------------------------------------------------
// Prototypes of the ONOFF API.
//-------------------------------------------------
extern void  ONOFF_Start(void);                                     
extern void  ONOFF_Stop(void);                                      
extern void  ONOFF_On(void);                                      
extern void  ONOFF_Off(void);                                      
extern void  ONOFF_Switch(BYTE bSwitch);
extern void  ONOFF_Invert(void);                                         
extern BYTE  ONOFF_GetState(void);                                         

//-------------------------------------------------
// Define global variables.                 
//-------------------------------------------------



#endif