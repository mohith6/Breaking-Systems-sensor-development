pragma SPARK_Mode (On);
with Sensors, Alarm, Reset, Brakes, Speedo;
package bscu
is
   minimum_speed : constant Integer := 0;
   maximum_speed : constant integer := 69;

   procedure Control_Unit
     with
       Global =>  (Input => (Sensors.State, Speedo.state, Reset.state),
                  In_Out => (Brakes.State, Alarm.state)),
       Depends => (Brakes.State => (Sensors.state, Brakes.state, Alarm.state, Speedo.state, reset.State),
                   Alarm.state => (Reset.State, speedo.state));

end bscu;
