
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
-- Filename:            test_bscu.adb
--
-- Description:         Test harness for the BSCU. Note that test data and results
--                      are managed via the Env and Log packages respectively.

pragma SPARK_Mode (Off); 
with Env, Log, BSCU, Sensors, Brakes;
use type Sensors.Sensor_Type;
procedure Test_BSCU is
begin
   Env.Open_File;
   Log.Open_File;
   loop
      exit when Env.At_End;
      Env.Update;
      Log.Update;
      bscu.Control_Unit;
      if (Sensors.Read_Sensor_Majority = Sensors.Enable) and not(Brakes.Enabled) then
	 Log.Crash;
	 exit;
      end if; 
      Log.Update;
   end loop;
   Env.Close_File;
   Log.Close_File;
end Test_BSCU;



