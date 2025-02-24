with AVR;                          use AVR;
with AVR.MCU;
with AVR.Interrupts;
with AVR.Timer0; -- used for PWM reading
with AVR.Timer1; -- used for PWM output
with AVR.Atmega328P;               use AVR.Atmega328P;
with Avrada_Rts_Config;
with AVR.Strings;                  use AVR.strings;
with AVR.Int_Img;                  use AVR.Int_Img;
with AVR.Ext_Int;                  use AVR.Ext_Int;
with AVR.UART;                     use AVR.UART; -- for serial transmission
with Interfaces;                   use Interfaces;

with ISR;                          use ISR;

procedure pwmInput is
   
   function clampU16 (num : Unsigned_16; lb :Unsigned_16; ub : Unsigned_16) return Unsigned_16 is
   begin
      if (num < lb) then
         return lb;
      elsif (num > ub) then
         return ub;
      else
         return num;
      end if;
      
   end clampU16;
    
   use AVR.MCU;
  
   -- ASTR5 is an AVR_String of 5 characters, refer to: 
   -- https://github.com/RREE/AVRAda_Lib/blob/5b4426c959ceec4e4c2120c7c0ec868337e7a184/src/avr-strings.ads
   str : ASTR5 := "     ";
   dutyCycle : Unsigned_16;

   Int0_Pin : Boolean renames MCU.PORTD_Bits(2);
   Int0_DD  : Boolean renames MCU.DDRD_Bits(2);
   
   periodLower : constant Unsigned_16 := 250;
   periodUpper : constant Unsigned_16 := 500;
   
begin
   Init (Baud_9600_16MHz);
   
   --  set the key pins to input
   Int0_DD := DD_Input;
   --  enable internal pull ups
   Int0_Pin := High;
   
   -- toggle calls the ISR on both falling edge and rising edge
   Set_Int0_Sense_Control (Toggle);

   Enable_External_Interrupt_0;

   --  enable interrupts generally in the MCU
   AVR.Interrupts.Enable;

   Timer1.Init_Normal (Timer1.Scale_By_64);   
   
   loop
      if (captureIdx = 0) then
         -- clamped to prevent underflow
         dutyCycle := ((clampU16(highTime,periodLower,periodUpper)-periodLower)*100)/(periodUpper-periodLower);
         -- the period in microseconds:
         -- periodMS := (period * Prescaler) / (Avrada_Rts_Config.Clock_Frequency / 1000000)
      end if;
      U16_Img_Right(dutyCycle, str);
      put_line(str);
   end loop;
end pwmInput;
