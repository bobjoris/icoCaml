program

procedure f (x :  integer);
var y,z,t,u :   integer;
begin
   y := x;
   writeln(y);
   z := x;
   if z > 0 then
   begin
      t := y - 1;
      u := t;
      f (z + u)
   end
   else begin end
end; { f }

begin
   f(0)
end.
