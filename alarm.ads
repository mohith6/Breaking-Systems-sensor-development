
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
-- Filename:            alarm.ads
--
-- Description:         Models the alarm device associated
--                      with the BSCU.

pragma SPARK_Mode (On);
package Alarm 

is
   pragma Elaborate_Body;
   
   State: Boolean;
   Cnt:   Integer;
   
   -- returns true if alarm state is true, otherwise returns false
   function Enabled return Boolean
   with 
     Global => (Input => State),
       Depends => (Enabled'Result => State);
   
   -- Sets alarm state to be true
   procedure Enable
   with 
   Global => (In_Out => (State, Cnt)),
   Depends => (State => State,
               Cnt   => (Cnt, State));
   
   -- Sets alarm state to be false
   procedure Disable
   with
     Global => (In_Out => State),
       Depends => (State => State);
   
   procedure Reset_Cnt
   with 
     Global  => (Output => Cnt),
     Depends => (Cnt    => null);
   
   function Read_Cnt return Integer;

end Alarm;



