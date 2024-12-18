
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
-- Filename:            brakes.ads
--
-- Description:         Models the car braking subsystem associated
--                      with the BSCU.

pragma SPARK_Mode (On); 
package Brakes

is
   pragma Elaborate_Body;
     
   State: Boolean;
   
   -- returns true if brakes state is true
   function Enabled return Boolean
   with
     Global => (Input => State),
     Depends => (Enabled'Result => State);
   
   -- sets brakes state to true
   procedure Enable
   with
     Global => (In_Out => State),
     Depends => (state =>null, null => State);
   
   -- sets brakes state to false
   procedure Disable
   with
     Global => (In_Out => State),
     Depends => (state => null, null => State);

end Brakes;



