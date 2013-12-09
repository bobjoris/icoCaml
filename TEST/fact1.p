program

var x : integer;

function fact (n : integer) : integer;
begin		       
   if n <= 1 then
      fact := 1
   else
      fact := n * fact (n - 1)
end; { fact }

begin
   x := readln ();
   writeln (fact (x))
end.
