program

var x : integer;

function times (p : integer; q : integer) : integer;
begin
   times := p * q
end; { times }

function fact (n : integer) : integer;
var
   nm1 : integer;
begin		       
   if n <= 1 then
      fact := 1
   else begin
      nm1 := n - 1;
      fact := times (n, fact (nm1))
   end
end; { fact }

begin
   x := readln ();
   writeln (fact (x))
end.
