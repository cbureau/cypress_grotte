;;*****************************************************************************
;;*****************************************************************************
;;  FILENAME:   BP6.asm
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

include "BP6.inc"
include "memory.inc"

export _BP6_Start
export  BP6_Start

export _BP6_Stop
export  BP6_Stop

export _BP6_On
export  BP6_On

export _BP6_Off
export  BP6_Off

export _BP6_Switch
export  BP6_Switch

export _BP6_Invert
export  BP6_Invert

export _BP6_GetState
export  BP6_GetState


AREA UserModules (ROM, REL)


.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: BP6_Start(void)
;  FUNCTION NAME: BP6_Stop(void)
;
;  FUNCTION NAME: BP6_Switch(void)
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
_BP6_On:
 BP6_On:
   mov  A,0x01
   jmp  BP6_Switch 

_BP6_Start:
 BP6_Start:
_BP6_Stop:
 BP6_Stop:
_BP6_Off:
 BP6_Off:
   mov  A,0x00

_BP6_Switch:
 BP6_Switch:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_0_Data_SHADE

   or   A,0x00                                   ; Check mode
   jz   .Turn_Off_LED

.Turn_On_LED:
IF(0)                                            ; Active High Digit Drive
   or   [Port_0_Data_SHADE],BP6_PinMask
ELSE                                             ; Active Low Digit Drive
   and  [Port_0_Data_SHADE],~BP6_PinMask
ENDIF
   jmp  .Switch_LED

.Turn_Off_LED:
IF(0)                      ; Active High Digit Drive
   and  [Port_0_Data_SHADE],~BP6_PinMask
ELSE                              ; Active Low Digit Drive
   or   [Port_0_Data_SHADE],BP6_PinMask
ENDIF

.Switch_LED:
   mov  A,[Port_0_Data_SHADE]
   mov  reg[BP6_PortDR],A

   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION



.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: BP6_Invert(void)
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
_BP6_Invert:
 BP6_Invert:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_0_Data_SHADE

   xor  [Port_0_Data_SHADE],BP6_PinMask
   mov  A,[Port_0_Data_SHADE]
   mov  reg[BP6_PortDR],A

   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION

.SECTION
;-----------------------------------------------------------------------------
;  FUNCTION NAME: BP6_GetState(void)
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
_BP6_GetState:
 BP6_GetState:
   RAM_PROLOGUE RAM_USE_CLASS_4
   RAM_PROLOGUE RAM_USE_CLASS_2
   RAM_SETPAGE_CUR >Port_0_Data_SHADE

   mov   A,[Port_0_Data_SHADE]         ; Get shade value
IF(0)                                  ; Active High Digit Drive
   // Nothing for now
ELSE                                   ; Active Low Digit Drive
   cpl   A                             ; Invert bit if Active low
ENDIF
   and   A,BP6_PinMask                 ; Mask off the trash
   jz    .End_LED_GS                   ; If zero, we're done
   mov   A,0x01                        ; Return a 1 no mater what the mask is.

.End_LED_GS:
   RAM_EPILOGUE RAM_USE_CLASS_2
   RAM_EPILOGUE RAM_USE_CLASS_4
   ret
.ENDSECTION
