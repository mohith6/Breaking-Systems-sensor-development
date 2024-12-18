
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
-- Filename:            sensors.ads
--
-- Description:         Models the 3 brake pedal sensors associated with the BSCU. Note 
--                      that a single sensor reading is calculated using a majority vote
--                      algorithm.

pragma SPARK_Mode (On); 
package Sensors
is
   pragma Elaborate_Body;
   
   type Sensor_Type is (Enable, Nosig, Undef);
   subtype Sensor_Index_Type is Integer range 1..3;
   type Sensors_Type is array (Sensor_Index_Type) of Sensor_Type;
   
   State: Sensors_Type;
   
   -- updates sensors state with three sensor values
   procedure Write_Sensors(Value_1, Value_2, Value_3: in Sensor_Type)
   with 
     Global => (In_Out => State),
     Depends => (State => (State, Value_1, Value_2, Value_3));
   
   -- returns an individual sensors state value 
   function Read_Sensor(Sensor_Index: in Sensor_Index_Type) return Sensor_Type
   with
     Global  => (Input => State),
     Depends => (Read_Sensor'Result => (State, Sensor_Index));
   
   -- returns the majority sensor value 
   function Read_Sensor_Majority return Sensor_Type
   with
     Global => (Input => State),
     Depends => (Read_Sensor_Majority'Result => State);

end Sensors;







