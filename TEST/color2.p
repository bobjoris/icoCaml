program

procedure f (x :  integer);
var r,s,t,u,v,w,y,z :   integer;
begin
   y := x;
   writeln(y);
   z := x;
   if z > 0 then
   begin
      r := y - 1;
      t := y - 1;
      v := y - 1;
      s := r;
      u := t;
      w := v;
      f (z + s);
      f (z + u);
      f (z + v)
   end
   else begin end
end; { f }

begin
   f(0)
end.
