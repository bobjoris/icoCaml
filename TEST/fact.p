program

var x : integer;

{ factorial }
function f (n : integer) : integer;
begin		       
   if n <= 0 then
      f := 1
   else
      f := n * f (n - 1)
end; { factorial }

begin
   x := readln ();
   writeln (f(x))
end.
