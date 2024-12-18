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
-- Filename:            speedo.ads
--
-- Description:         Models the speedo device associated with the BSCU.

pragma SPARK_Mode (On); 
package Speedo

is
   pragma Elaborate_Body;
   
   subtype Speed_Type is Integer range 0..100;      
   State: Speed_Type;
   
   -- sets speedo state to S
   procedure Write_Speed(S: in Speed_Type)
   with
     Global  => (Output => State),
     Depends => (State  => S);
   
   -- returns speedo state
   function Read_Speed return Speed_Type
   with
     Global => (Input => State),
     Depends => (Read_Speed'Result => State);

end Speedo;



