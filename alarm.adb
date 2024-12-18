pragma SPARK_Mode (On);
package body alarm
  is

procedure enable
is
begin
   state := true;   --sets alarm state to be true
end enable;

procedure disable
is
begin
   state := false;
end disable;

procedure Reset_cnt
is
begin
   cnt := 0;
end reset_cnt;

function enabled return boolean is
begin
   if state = true then
      return true;

   else
      return false;
   end if;
end enabled;

function read_cnt return integer is
cnt : Integer := 0;
   begin
      if Alarm.Enabled then
         cnt := cnt + 1;
      --elsif Alarm.Disable then
        -- cnt := cnt - 1;
         end if;
   return cnt;
end read_cnt;
end alarm;
