program

function copy (x, y, z : integer) : integer;
var
   x1, y1, z1, x2, y2, z2, x3, y3, z3 : integer;
begin
   x1 := x;
   y1 := y;
   z1 := z;
   x2 := x1;
   y2 := y1;
   z2 := z1;
   x3 := x2;
   y3 := y2;
   z3 := z2;
   copy := x3 + y3 + z3
end; { copy }

begin
   writeln(copy(1, 2, 3))
end.
