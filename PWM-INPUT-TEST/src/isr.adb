package body ISR is
   
   procedure recieveISR;

   pragma Machine_Attribute (Entity         => recieveISR,
                             Attribute_Name => "signal");
   pragma Export (C, recieveISR, AVR.MCU.Sig_INT0_String);
   procedure recieveISR is
   begin
      if (captureIdx = 0) then
         risingEdgeTime := Timer1.Counter;
         captureIdx := 1;
      elsif (captureIdx = 1) then
         fallingEdgeTime := Timer1.Counter;
         highTime := fallingEdgeTime - risingEdgeTime;
         captureIdx := 0;
      end if;
   end recieveISR;

end ISR;
