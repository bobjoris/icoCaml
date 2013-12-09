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

function gcditer (x, y : integer) : integer;
begin
   while x > 0 and y > 0 do
      if x < y then
	 y := y - x
      else
	 x := x - y;
   if x = 0 then
      gcditer := y
   else
      gcditer := x
end; { gcditer }

begin
   x := readln();
   y := readln();
   writeln(gcd(x, y));
   writeln(gcditer(x, y))
end.
