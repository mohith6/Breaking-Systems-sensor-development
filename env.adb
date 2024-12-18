
-- Author:              A. Ireland
--
-- Address:             School Mathematical & Computer Sciences
--                      Heriot-Watt University
--                      Edinburgh, EH14 4AS
--
-- E-mail:              a.ireland@hw.ac.uk
--
-- Last modified:       10.9.2022
--
-- Filename:            env.adb
--
-- Description:         Provides the drivers required for simulating the
--                      environment in which the BSCU operates.


pragma SPARK_Mode (Off);
with Text_IO, Sensors, Speedo, Reset;
use type Sensors.Sensor_Type;
-- use type Speedo.Speed_Type;

package body Env is

   Env_File: Text_IO.File_Type;

   package Integer_INOUT is new Text_IO.Integer_IO(Integer);

   procedure Update is

      Sensor_1: Integer;
      Sensor_2: Integer;
      Sensor_3: Integer;
      Speed:    Speedo.Speed_Type;
      ResetSig: Integer;

      function Int_To_Sensor_Type(X: in Sensor_Range) return Sensors.Sensor_Type is
      begin
         case X is
            when 0 => return Sensors.Nosig;
            when 1 => return Sensors.Enable;
            when 2 => return Sensors.Undef;
         end case;
      end Int_To_Sensor_Type;

   begin
      Integer_INOUT.Get(Env_File, Sensor_1);
      Integer_INOUT.Get(Env_File, Sensor_2);
      Integer_INOUT.Get(Env_File, Sensor_3);
      Integer_INOUT.Get(Env_File, Speed);
      Integer_INOUT.Get(Env_File, ResetSig);
      Sensors.Write_Sensors(Int_To_Sensor_Type(Sensor_1),
                            Int_To_Sensor_Type(Sensor_2),
                            Int_To_Sensor_Type(Sensor_3));
      Speedo.Write_Speed(Speed);
      if ResetSig = 1 then
         Reset.Enable;
      else
         Reset.Disable;
      end if;
      Text_IO.Put('.');
   end Update;

   function At_End return Boolean is
   begin
      return Text_IO.End_Of_File(Env_File);
   end At_End;

   procedure Open_File is
   begin
      Text_IO.Open(Env_File, Text_IO.In_File, "env.dat");
   end Open_File;

   procedure Close_File is
   begin
      Text_IO.Close(Env_File);
      Text_IO.Put_Line(" [ complete ]");
   end Close_File;

end Env;



