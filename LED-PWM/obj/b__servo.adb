pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__servo.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__servo.adb");
pragma Suppress (Overflow_Check);

package body ada_main is



   procedure adainit is
   begin
      null;

   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_servo");

   procedure main is
   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   E:\Ada-Programming\AVRADA-TUTORIAL\SERVO-PWM\obj\servo.o
   --   -LE:\Ada-Programming\AVRADA-TUTORIAL\SERVO-PWM\obj\
   --   -LE:\Ada-Programming\AVRADA-TUTORIAL\SERVO-PWM\obj\
   --   -LC:\Users\TrippR\AppData\Local\alire\cache\builds\avrada_rts_2.0.1_92a5f15a\71110aa50bcfe6fa5f256d9be5e6243378c23ab3e5fbf605bd2ecf4935bfaa91\adalib\
   --   -LC:\Users\TrippR\AppData\Local\alire\cache\builds\avrada_mcu_2.2.0_b6f5cf0d\f134f0b277bcacf4ff20a45fbe1e3040d96b87a1ae6c296fdc6c677d8ca90076\lib\
   --   -LC:\Users\TrippR\AppData\Local\alire\cache\builds\avrada_lib_2.1.0_fe38c6dc\977542c064d17eab9a05791ce2a958f0fe68a767e8a54ccb02ab7ec92619d044\lib\
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
