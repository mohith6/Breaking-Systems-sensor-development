pragma SPARK_Mode (On);
package body Brakes

is
    function enabled return boolean is
   begin
      return state;
   end enabled;


   procedure enable
   is
   begin
      state := true;
   end enable;

   procedure disable
   is
   begin
      state := false;
   end disable;

     begin
   state := true;



end brakes;
