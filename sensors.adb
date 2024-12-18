pragma SPARK_Mode (On);
package body Sensors
is

   procedure Write_Sensors(value_1, value_2, value_3 :  in Sensor_Type)
   is
   begin
      state(1) := value_1;
      state(2) := value_2;
      state(3) := value_3;

   end write_sensors;

   function read_sensor(Sensor_Index : in Sensor_Index_Type) return Sensor_Type
   is
   begin
      return State(Sensor_Index);
   end read_sensor;

   function Read_Sensor_Majority return Sensor_Type
   is
     M : Integer := 0;
     N : Integer := 0;

   begin
      for A in Integer range 1 .. 3 loop
         if state(A) = Enable then
            M := M + 1;
      end if;
      end loop;



      for B in Integer range 1 .. 3 loop
         if state(B) = Nosig then
            N := N + 1;
         end if;
         end loop;

      if N < M then
         return Enable;


      else
         return Nosig;
      end if;

     end Read_Sensor_Majority;


   --for Sensors_Type in state'Range loop
   --if Sensor_Type = enable then
     -- return Enabled;
   --else  if Sensor_Type = Nosig then
     --    return Disabled;
      --else if Sensor_Type = Undef then
   --    return

    end sensors;
