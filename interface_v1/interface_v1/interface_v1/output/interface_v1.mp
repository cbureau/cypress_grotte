Project:      output/interface_v1
Build Number: 0
Date:         Fri Sep 26 18:07:35 2014
Compiler:     ICCM8C
Version:      7.05.00


Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             lit   0150   0046 =     70. bytes (rel,con,rom,lit)

       Addr  Global Symbol
      -----  --------------------------------
       0150  LoadConfigTBL_telecommande_clem_2_Bank0
       0173  LoadConfigTBL_telecommande_clem_2_Bank1
       0196  __lit_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     psoc_config   0196   00A6 =    166. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0196  LoadConfigTBL_telecommande_clem_2_Ordered
       01DB  LoadConfigInit
       01DB  _LoadConfigInit
       01E5  LoadConfig_telecommande_clem_2
       01E5  _LoadConfig_telecommande_clem_2
       023C  __psoc_config_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                     UserModules   023C   00CE =    206. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       023C  _SPIS_1_ISR
       023D  SPIS_1_EnableInt
       023D  _SPIS_1_EnableInt
       0241  _SPIS_1_DisableInt
       0241  SPIS_1_DisableInt
       0245  _SPIS_1_Start
       0245  SPIS_1_Start
       024A  SPIS_1_Stop
       024A  _SPIS_1_Stop
       024E  SPIS_1_SetupTxData
       024E  _SPIS_1_SetupTxData
       0251  bSPIS_1_ReadRxData
       0251  _SPIS_1_bReadRxData
       0251  _bSPIS_1_ReadRxData
       0251  SPIS_1_bReadRxData
       0254  SPIS_1_bReadStatus
       0254  bSPIS_1_ReadStatus
       0254  _SPIS_1_bReadStatus
       0254  _bSPIS_1_ReadStatus
       0257  SPIS_1_DisableSS
       0257  _SPIS_1_SetSS
       0257  _SPIS_1_DisableSS
       0257  SPIS_1_SetSS
       025F  _SPIS_1_EnableSS
       025F  SPIS_1_EnableSS
       025F  _SPIS_1_ClearSS
       025F  SPIS_1_ClearSS
       0267  _ONOFF_On
       0267  ONOFF_On
       026B  _ONOFF_Start
       026B  ONOFF_Stop
       026B  ONOFF_Start
       026B  _ONOFF_Off
       026B  ONOFF_Off
       026B  _ONOFF_Stop
       026D  ONOFF_Switch
       026D  _ONOFF_Switch
       027E  ONOFF_Invert
       027E  _ONOFF_Invert
       0286  _ONOFF_GetState
       0286  ONOFF_GetState
       028F  BP7_On
       028F  _BP7_On
       0293  _BP7_Start
       0293  _BP7_Stop
       0293  BP7_Off
       0293  BP7_Start
       0293  _BP7_Off
       0293  BP7_Stop
       0295  _BP7_Switch
       0295  BP7_Switch
       02A6  _BP7_Invert
       02A6  BP7_Invert
       02AE  _BP7_GetState
       02AE  BP7_GetState
       02B8  _BP6_On
       02B8  BP6_On
       02BC  BP6_Start
       02BC  BP6_Off
       02BC  _BP6_Start
       02BC  _BP6_Off
       02BC  BP6_Stop
       02BC  _BP6_Stop
       02BE  _BP6_Switch
       02BE  BP6_Switch
       02CF  BP6_Invert
       02CF  _BP6_Invert
       02D7  BP6_GetState
       02D7  _BP6_GetState
       02E1  _BP4_On
       02E1  BP4_On
       02E5  BP4_Start
       02E5  BP4_Off
       02E5  BP4_Stop
       02E5  _BP4_Off
       02E5  _BP4_Stop
       02E5  _BP4_Start
       02E7  BP4_Switch
       02E7  _BP4_Switch
       02F8  BP4_Invert
       02F8  _BP4_Invert
       0300  BP4_GetState
       0300  _BP4_GetState
       030A  __UserModules_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                            text   030A   0109 =    265. bytes (rel,con,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       030A  __text_start
       030A  _main
       0396  _Tempo
       03D2  _init
       0413  __text_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
               virtual_registers   0000   0002 =      2. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0000  __rX
       0001  __r0
       0002  __virtual_registers_end

Area                               Addr   Size   Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                    InterruptRAM   0002   0001 =      1. bytes (rel,con,ram)

       Addr  Global Symbol
      -----  --------------------------------
       0002  NO_SHADOW
       0002  Port_0_Data_SHADE
       0002  _NO_SHADOW
       0002  _Port_0_Data_SHADE
       0003  __ramareas_end
       0003  __InterruptRAM_end

Area                               Start  End    Decimal Bytes (Attributes)
--------------------------------   ----   ----   ------- ----- ------------
                             TOP   0000   00E9 =    233. bytes (abs,ovr,rom,code)

       Addr  Global Symbol
      -----  --------------------------------
       0068  __Start
       00E6  _bGetPowerSetting
       00E6  bGetPowerSetting

Files Linked      [ module(s) ]

./obj/boot.o	[ boot.asm ]
obj/main.o	[ main.c ]
<library>	[ spis_1int.asm, spis_1.asm, psocconfigtbl.asm, psocconfig.asm, onoff.asm, bp7.asm, bp6.asm, bp4.asm ]
[ rX.asm, r0.asm ]

Area Definitions

-blit:0x150.0xfff
-bdata:0.0xff
-rwh:SSCParmBlk:0xf7.0xff

