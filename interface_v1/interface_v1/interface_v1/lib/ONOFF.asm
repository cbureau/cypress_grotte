;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME:   ONOFF.asm
;;  Version: 1.40, Updated on 2013/5/19 at 10:43:48
;;  Generated by PSoC Designer 5.4.2946
;;
;;  DESCRIPTION: LED user module.
;;
;;
;;  NOTE: User Module APIs conform to the fastcall16 convention for marshalling
;;        arguments and observe the associated "Registers are volatile" policy.
;;        This means it is the caller's responsibility to preserve any values
;;        in the X and A registers that are still needed after the API functions
;;        returns. For Large Memory Model devices it is also the caller's 
;;        responsibility to perserve any value in the CUR_PP, IDX_PP, MVR_PP and 
;;        MVW_PP registers. Even though some of these registers may not be modified
;;        now, there is no guarantee that will remain the case in future releases.
;;-----------------------------------------------------------------------------
;;  Copyright (c) Cypress Semiconductor 2013. All Rights Reserved.
;;*****************************************************************************
;;*****************************************************************************

include "ONOFF.inc"
include "memory.inc"

export _ONOFF_Start
export  ONOFF_Start

export _ONOFF_Stop
export  ONOFF_Stop

export _ONOFF_On
export  ONOFF_On

export _ONOFF_Off
export  ONOFF_Off

export _ONOFF_Switch
export  ONOFF_Switch

export _ONOFF_Invert
export  ONOFF_Invert

export _ONOFF_GetState
export  ONOFF_GetState


AREA UserModules (ROM, REL)


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ONOFF_Start(void)
;  FUNCTION NAME: ONOFF_Stop(void)
;
;  FUNCTION NAME: ONOFF_Switch(void)
;
;  DESCRIPTION: ( Switch )
;     Turn LED on or off     
;
;  DESCRIPTION: ( Start, Stop )
;     Turn LED off                       
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS:  ( Switch )
;     A => If 0, turn off LED, if > 0 turn on LED
;
;  ARGUMENTS:  ( Start, Stop )
;      None
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_ONOFF_On:
 ONOFF_On:
   mov  A,0x01
   jmp  ONOFF_Switch 

_ONOFF_Start:
 ONOFF_Start:
_ONOFF_Stop:
 ONOFF_Stop:
_ONOFF_Off:
 ONOFF_Off:
   mov  A,0x00

_ONOFF_Switch:
 ONOFF_Switch:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_0_Data_SHADE

   or   A,0x00                                   ; Check mode
   jz   .Turn_Off_LED

.Turn_On_LED:
IF(1)                                            ; Active High Digit Drive
   or   [Port_0_Data_SHADE],ONOFF_PinMask
ELSE                                             ; Active Low Digit Drive
   and  [Port_0_Data_SHADE],~ONOFF_PinMask
ENDIF
   jmp  .Switch_LED

.Turn_Off_LED:
IF(1)                      ; Active High Digit Drive
   and  [Port_0_Data_SHADE],~ONOFF_PinMask
ELSE                              ; Active Low Digit Drive
   or   [Port_0_Data_SHADE],ONOFF_PinMask
ENDIF

.Switch_LED:
   mov  A,[Port_0_Data_SHADE]
   mov  reg[ONOFF_PortDR],A

   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION



.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ONOFF_Invert(void)
;
;  DESCRIPTION:
;     Invert state of LED                               
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS:  none
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_ONOFF_Invert:
 ONOFF_Invert:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_0_Data_SHADE

   xor  [Port_0_Data_SHADE],ONOFF_PinMask
   mov  A,[Port_0_Data_SHADE]
   mov  reg[ONOFF_PortDR],A

   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: ONOFF_GetState(void)
;
;  DESCRIPTION:
;     Get state of LED
;
;-----------------------------------------------------------------------------
;
;  ARGUMENTS: none
;
;  RETURNS:  
;    State of LED   1 = ON,  0 = OFF
;
;  SIDE EFFECTS:
;    REGISTERS ARE VOLATILE: THE A AND X REGISTERS MAY BE MODIFIED!
;
;-----------------------------------------------------------------------------
_ONOFF_GetState:
 ONOFF_GetState:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_0_Data_SHADE

   mov   A,[Port_0_Data_SHADE]         ; Get shade value
IF(1)                                  ; Active High Digit Drive
   // Nothing for now
ELSE                                   ; Active Low Digit Drive
   cpl   A                             ; Invert bit if Active low
ENDIF
   and   A,ONOFF_PinMask               ; Mask off the trash
   jz    .End_LED_GS                   ; If zero, we're done
   mov   A,0x01                        ; Return a 1 no mater what the mask is.

.End_LED_GS:
   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION
