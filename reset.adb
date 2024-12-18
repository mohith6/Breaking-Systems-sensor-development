pragma SPARK_Mode (On);
package body reset

is

   procedure Enable is
   begin
      state := True;
   end enable;

   procedure Disable is
   begin
      state := False;
   end disable;

   function enabled return boolean is
   begin
      if state = true then
         return true;
      else
         return false;
      end if;
   end enabled;
end reset;
