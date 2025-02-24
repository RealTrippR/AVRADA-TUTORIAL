pragma Warnings (Off);
pragma Ada_95;
pragma Restrictions (No_Exception_Propagation);
with System;
package ada_main is


   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure main;
   pragma Export (C, main, "main");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  interfaces%s
   --  system%s
   --  system.machine_code%s
   --  system.unsigned_types%s
   --  avr%s
   --  avr%b
   --  avr.atmega328p%s
   --  avr.mcu%s
   --  avr.timer1%s
   --  avr.timer1%b
   --  avr.wait%s
   --  avr.wait%b
   --  avrada_rts_config%s
   --  servo%b
   --  END ELABORATION ORDER

end ada_main;
