program

var x, y : integer;

function gcd (x, y : integer) : integer;
begin
   if x = 0 then
      gcd := y
   else if y = 0 then
      gcd := x
   else if x < y then
      gcd := gcd (x, y - x)
   else
      gcd := gcd (x - y, y)
end; { gcd }

begin
   x := readln();
   y := readln();
   writeln(gcd(x, y))
end.
