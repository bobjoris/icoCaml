program

var x : integer;

function f (y : integer) : integer;
begin
   y := y + 2 * x;
   x := x + 1;
   y := y * 5 + x;
   f := y
end; { f }

begin
   writeln(f(0));
   writeln(f(1) + f(2))
end.
