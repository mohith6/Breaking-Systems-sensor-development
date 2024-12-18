pragma Spark_Mode (On);
package body speedo

is

   procedure write_speed(S: in Speed_Type) is
   begin
      State := S;
   end write_speed;

   function Read_speed return Speed_type is
   begin
      return State;
   end Read_speed;
end speedo;
