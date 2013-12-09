program
var x : integer ;
    n : integer ;

function power(    x : integer;     n : integer) : integer ;
var r : integer ;
    t : integer ;
begin
   t := x ; r := 1 ;
   while n > 0 do begin
      if n <> 2*(n/2) then
         r := r * t
      else begin
      end ;
      n := n / 2 ;
      t := t*t
   end ;
   power := r
end ;

begin
   x := readln() ; n := readln() ;
   writeln(power(x,n))
end.