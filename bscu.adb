pragma SPARK_Mode (On);
with alarm, speedo, sensors, brakes, reset;
package body bscu
is
   procedure Control_Unit
   is
      use type sensors.Sensor_Type;
      begin
      if sensors.Read_Sensor_Majority=Sensors.Enable then
         brakes.Enable;

         if   brakes.enabled and speedo.Read_Speed > speedo.state then
            alarm.enable;


         end if;
         end if;
      if   sensors.Read_Sensor_Majority = sensors.nosig then
         alarm.disable;
            brakes.disable;

         end if;
      --if speedo.read_speed > speedo.state then
        --alarm.enable;
     -- end if;

      if maximum_speed < speedo.state then
         alarm.enable;
         brakes.enable;
      end if;

      if alarm.enabled then
         brakes.enable;
      end if;

      if reset.enabled then
         alarm.reset_cnt;
      end if;
   end Control_Unit;
end bscu;
