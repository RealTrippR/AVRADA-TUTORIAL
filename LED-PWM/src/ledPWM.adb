with AVR;
with AVR.MCU;
with AVR.Timer1;
with AVR.Wait;

with AVR.Atmega328P; 
use AVR.Atmega328P;
with Avrada_Rts_Config;

use AVR;
with Interfaces; use Interfaces;

procedure ledPWM is
   use AVR.MCU;

    procedure Wait_1_Sec is new
     AVR.Wait.Generic_Wait_USecs (Avrada_Rts_Config.Clock_Frequency,
                                  1_000_000);
begin
   MCU.DDRB_Bits (1) := DD_Output;

   MCU.PRR_Bits (MCU.PRTIM1_Bit) := Low;

   TCCR1A_Bits := (COM1A1_Bit => True,
                   WGM11_Bit  => True,
                   others => False);

   TCCR1B_Bits := (WGM12_Bit => True,
                   WGM13_Bit => True,
                   CS10_Bit => True,
                   CS11_Bit => True,
                   others => False);
   MCU.ICR1 := 4999; -- Input Compare Register, defines the PWM period by setting the highest value before the timer resets.
      
   loop

      MCU.OCR1A := (MCU.ICR1/10); -- %10 percent brightness (duty cycle)
      Wait_1_Sec;

      MCU.OCR1A := (MCU.ICR1/2); -- %50 percent brightness (duty cycle)
      Wait_1_Sec;

      MCU.OCR1A := (MCU.ICR1); -- %100 brightness (duty cycle)
      Wait_1_Sec;

   end loop;
end ledPWM;
