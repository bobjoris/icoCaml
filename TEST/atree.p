program

function rien (n : integer) : integer;
begin
   rien := n
end;

function test (n : integer) : integer ;
var r : integer;
begin
   n := 1+(2+(3+(4+5)));
   n := 1-(2-(3-(4-5)-n));
   r := rien(n) ;
   r := r+rien(r) ;
   test := r
end;

begin  
   writeln(test(10))
end.
