with AVR;                          use AVR;
with AVR.MCU;
with AVR.Timer0;
with AVR.Timer1;

with AVR.Interrupts;
with AVR.Wait;
with AVR.Atmega328P;               use AVR.Atmega328P;
with Avrada_Rts_Config;
with AVR.Ext_Int;                  use AVR.Ext_Int;

with Interfaces;                   use Interfaces;


package ISR is
   pragma Elaborate_Body;

   time1 : Unsigned_16 := 0;
   risingEdgeTime : Unsigned_16 := 0;
   fallingEdgeTime : Unsigned_16 := 0;
   highTime : Unsigned_16 := 0;
   captureIdx : Unsigned_8 := 0;
end ISR;
