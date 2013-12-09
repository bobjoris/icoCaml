program

function dead (x : integer) : integer;
begin
   x := 3;
   x := x + x;
   dead := 0
end; { dead }

function nothing (x : integer) : integer;
begin
   if false then
      nothing := x * x + 2 * x + 1 else begin end
end;

begin
   writeln(dead(5))
end.

