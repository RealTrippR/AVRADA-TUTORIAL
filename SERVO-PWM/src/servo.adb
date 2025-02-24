with AVR;
with AVR.MCU;
with AVR.Timer1;
with AVR.Wait;

with AVR.Atmega328P; 
use AVR.Atmega328P;
with Avrada_Rts_Config;

use AVR;

procedure servo is
   use AVR.MCU;

    procedure Wait_1_Sec is new
     AVR.Wait.Generic_Wait_USecs (Avrada_Rts_Config.Clock_Frequency,
                                  1_000_000);

begin
   MCU.DDRB_Bits (1) := DD_Output;

   MCU.PRR_Bits (MCU.PRTIM1_Bit) := Low;

-- https://arduino.stackexchange.com/questions/90883/how-to-correctly-set-pwm-to-control-servo-angle-in-avr
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
      -- equation for angle: (PWM [1-2ms] / servo period [20ms] * ICR1 [4999])
      -- the PWM period is 20ms for my servo, and it has an angle range of 0 to 120 degrees.
      -- My servo has a PWM of 1ms to 2ms, where 1ms is 0, and 2ms is 120.
      -- for 0 degrees (full left) degrees, the OCR1A register should be set to 250, because the ICR1 register is set to 4999
      -- therefore, OCR1A should be set to 250, becuase ~250 = 4999 * (1/20)
      MCU.OCR1A := (250);
      Wait_1_Sec;

      -- for 60 degrees (straight ahead), it should be set to ~375, becuase 250 = 4999 * (1.5/20)
      MCU.OCR1A := (365); -- my servo is very cheap and not precise, so 365 is closer to the center than 375

      Wait_1_Sec;

      -- for 120 degrees (full right), OCR1A should be set to ~500, because 500 is 4999 * (2/20)
      MCU.OCR1A := (500);
      Wait_1_Sec;

   end loop;
end servo;