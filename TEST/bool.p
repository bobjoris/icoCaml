program

function bnot (x : boolean) : boolean ;
begin
   if x then
      bnot := false
   else
      bnot := true
end ;

function band (x, y : boolean) : boolean ;
begin
   if x then
      band := y
   else
      band := false
end ;

function bor (x : boolean; y : boolean) : boolean ;
begin
   bor := bnot(band(bnot(x),bnot(y)))
end ;



function implies (x : boolean; y : boolean) : boolean ;
begin
   implies := bor(bnot(x), y)
end ;


procedure pbool(b : boolean) ;
var r : integer ;
begin
   if b then
      r := 1
   else
      r := 0;
   writeln(r)
end;

procedure test() ;
var n :  integer ;
begin
   n := readln() ;
   while n <> 0 do begin
      pbool(0 < n) ;
      pbool(band(n >= 0, 0 >= n)) ;
      pbool(implies(n > 0, 0 >= n)) ;
      n := readln()
   end ;
   pbool(band(n >= 0, n <= 0))
end ;

begin  
  test()
end.
