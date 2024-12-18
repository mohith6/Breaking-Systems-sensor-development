
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
-- Filename:            reset.ads
--
-- Description:         Models the reset button associated with the BSCU, i.e. the
--                      reset is either enabled or disabled at any moment in time. 

pragma SPARK_Mode (On); 
package Reset

is
   
   State: Boolean:= False;
     
   -- sets reset status to true
   procedure Enable
   with
     Global => (Output => State),
     Depends => (State => null);
   
   -- sets reset status to false
   procedure Disable
   with
     Global => (Output => State),
     Depends => (State => null);
   
   -- returns true if reset status is true
   function Enabled return Boolean
   with
     Global => (Input => State),
     Depends => (Enabled'Result => State);
   
 end Reset;



