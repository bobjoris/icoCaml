program
function sum (n : integer; r : integer) : integer;
     begin
       if n > 0 then sum := sum (n-1, r+n) else sum := r
     end;

begin
   writeln(sum(10,0))
end.