program
var x : integer;

function fact (n : integer) : integer;
var r : integer ;
begin
   r := 1 ;
   while n > 0 do
   begin
      r :=  r * n;
      n := n-1
   end ;
   fact := r
end;

begin
   x := readln ();
   writeln (fact (x))
end.
