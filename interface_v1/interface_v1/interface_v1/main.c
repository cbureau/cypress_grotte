//----------------------------------------------------------------------------
// C main line
//----------------------------------------------------------------------------

#include <m8c.h>        // part specific constants and macros
#include "PSoCAPI.h"    // PSoC API definitions for all User Modules
#define LED1 0x01       // P0_0 
#define LED2 0x10		// P1_4
#define LED3 0x04		// P1_2
void Tempo(long);
void init(void);
void main(void)
{
unsigned char val;
//M8C_EnableGInt ; // Uncomment this line to enable Global Interrupts
init();
while(1){
	if((SPIS_1_bReadStatus() & SPIS_1_SPIS_RX_BUFFER_FULL)==SPIS_1_SPIS_RX_BUFFER_FULL){
	val=SPIS_1_bReadRxData();
	 	if (val=='U')
		BP4_Switch(1);
		else if(val=='D')
		BP6_Switch(1);
		else if(val=='P')
		BP7_Switch(1);
		else {
		BP4_Switch(0);
		BP6_Switch(0);
		BP7_Switch(0);
			}
		}
	//if ((PRT0DR | ~LED1)== ~LED1)
	//SPIS_1_SetupTxData('A');
	 if ((PRT0DR & LED1)== LED1)
	SPIS_1_SetupTxData('a');
	else 
	 SPIS_1_SetupTxData('A');
	//else if ((PRT1DR | ~LED2)== ~LED2)
	//SPIS_1_SetupTxData('B');
	//else if ((PRT0DR & LED2)== LED2)
	//SPIS_1_SetupTxData('b');	
	//if ((PRT1DR | ~LED3)== ~LED3)
	//SPIS_1_SetupTxData('C');
	 if ((PRT1DR & LED3)== LED3)
	SPIS_1_SetupTxData('c');
	else 
	SPIS_1_SetupTxData('C');
	}
}
/******************tempo***********************/
void Tempo(long val){
long i;
for (i=0;i<val;i++);
}
/********************initialisation*********************/
void init(void){
SPIS_1_Start(SPIS_1_SPIS_MODE_0 | SPIS_1_SPIS_MSB_FIRST);
 ONOFF_Start(); 
 BP4_Start();
 BP6_Start();
 BP7_Start();
Tempo(10000);
SPIS_1_EnableSS();
 ONOFF_Switch(1); // stiimsound ON
Tempo(50000);
 ONOFF_Switch(0); // stiimsound ON
}


