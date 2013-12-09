program

function tak (x, y, z : integer) : integer;
begin
   if y < x then
      tak := 1 + tak (tak (x-1, y, z), tak (y-1, z, x), tak(z-1, x, y))
   else
      tak := z
end;

begin
   writeln(tak(18, 12, 6))
end.
