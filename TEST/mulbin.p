program
var n : integer ;
    m : integer ;

function odd(    n :integer): boolean ;
begin
   odd := n <> 2*(n/2)
end ;

function prod(    n,m : integer) : integer ;
var r : integer ;
    t : integer ;
begin
   if n < 0 then
      t := 0-n
   else
      t := n ;
   r := 0 ;
   while t > 0 do begin
      if odd(t) then
         r := r + m
      else begin
      end ;
      t := t / 2 ;
      m := m * 2
   end ;
   if n < 0 then
      prod := 0-r
   else
      prod := r
end ;

begin
   n := readln() ; m := readln() ;
   while n <> 0 do begin
      writeln(prod(n, m)) ;
      n := readln() ; m := readln()
   end
end.