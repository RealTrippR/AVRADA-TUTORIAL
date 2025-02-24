with AVR; use AVR;
with AVR.Wait;
with Avrada_Rts_Config;

with AVR.MCU;

procedure ledIO is
   port8   : Boolean renames MCU.PORTB_Bits (0);

   Key_DD      : Boolean renames MCU.DDRC_Bits(0);
   Key_Pull_Up : Boolean renames MCU.PortC_Bits(0);
   Key         : Boolean renames MCU.PinC_Bits(0);

   procedure Wait_1_Sec is new
     AVR.Wait.Generic_Wait_USecs (Avrada_Rts_Config.Clock_Frequency,
                                  1_000_000);

begin

   Key_DD := DD_Input;
   Key_Pull_Up := High;

   loop
      -- Low = pulled to ground (0)
      -- High = current flowing (1)

      if (Key = Low) then
         port8 := True;
      else
         port8 := False;
      end if;
   end loop;
end ledIO;
