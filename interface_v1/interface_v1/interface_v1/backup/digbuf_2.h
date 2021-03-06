//*****************************************************************************
//*****************************************************************************
//  FILENAME: DigBuf_2.h
//  Version: 1.3, Updated on 2013/5/19 at 10:43:26
//  Generated by PSoC Designer 5.4.2946
//
//  DESCRIPTION: DigitalBuffers User Module C Language interface file
//-----------------------------------------------------------------------------
//  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
//*****************************************************************************
//*****************************************************************************
#ifndef DigBuf_2_INCLUDE
#define DigBuf_2_INCLUDE

#include <m8c.h>

#pragma fastcall16 DigBuf_2_EnableInt
#pragma fastcall16 DigBuf_2_DisableInt
#pragma fastcall16 DigBuf_2_Start
#pragma fastcall16 DigBuf_2_Stop

//-------------------------------------------------
// Prototypes of the DigBuf_2 API.
//-------------------------------------------------

extern void DigBuf_2_EnableInt(void);
extern void DigBuf_2_DisableInt(void);
extern void DigBuf_2_Start(void);
extern void DigBuf_2_Stop(void);


//--------------------------------------------------
// Constants for DigBuf_2 API's.
//--------------------------------------------------
#define DigBuf_2_CONTROL_REG_START_BIT         ( 0x01 )
#define DigBuf_2_INT_REG_ADDR                  ( 0x0e1 )
#define DigBuf_2_INT_MASK                      ( 0x02 )


//--------------------------------------------------
// Constants for DigBuf_2 user defined values
//--------------------------------------------------
#pragma ioport  DigBuf_2_DATA_0_REG:    0x024              //DR0 Count register
BYTE            DigBuf_2_DATA_0_REG;
#pragma ioport  DigBuf_2_DATA_1_REG:    0x025              //DR1 Period register
BYTE            DigBuf_2_DATA_1_REG;
#pragma ioport  DigBuf_2_DATA_2_REG:    0x026              //DR2 Compare register
BYTE            DigBuf_2_DATA_2_REG;
#pragma ioport  DigBuf_2_CONTROL_REG:   0x027              //Control register
BYTE            DigBuf_2_CONTROL_REG;
#pragma ioport  DigBuf_2_FUNC_REG:  0x124                  //Function register
BYTE            DigBuf_2_FUNC_REG;
#pragma ioport  DigBuf_2_INPUT_REG: 0x125                  //Input register
BYTE            DigBuf_2_INPUT_REG;
#pragma ioport  DigBuf_2_OUTPUT_REG:    0x126              //Output register
BYTE            DigBuf_2_OUTPUT_REG;
#pragma ioport  DigBuf_2_INT_REG:       0x0e1              //Interrupt Mask Register
BYTE            DigBuf_2_INT_REG;


//-------------------------------------------------
// Register Addresses for DigBuf_2
//-------------------------------------------------


//-------------------------------------------------
// DigBuf_2 Macro 'Functions'
//-------------------------------------------------

#define DigBuf_2_Start_M \
   DigBuf_2_CONTROL_REG |=  DigBuf_2_CONTROL_REG_START_BIT

#define DigBuf_2_Stop_M  \
   DigBuf_2_CONTROL_REG &= ~DigBuf_2_CONTROL_REG_START_BIT

#define DigBuf_2_EnableInt_M   \
   M8C_EnableIntMask(DigBuf_2_INT_REG, DigBuf_2_INT_MASK)

#define DigBuf_2_DisableInt_M  \
   M8C_DisableIntMask(DigBuf_2_INT_REG, DigBuf_2_INT_MASK)

#endif
// end of file DigBuf_2.h
