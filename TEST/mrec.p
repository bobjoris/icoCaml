program
  var n : integer;

function sum(    x : integer;     y : integer) : integer ;
begin
   sum := x+y
end;

function fib (    n: integer) : integer;
begin
   if n <= 1 then fib := 1 else fib := sum(fib1(n), fib2(n))
end;

function fib1 (    n : integer) : integer;
begin
   n := n-1 ;
   if n <= 1 then fib1 := 1 else fib1 := fib1(n) + fib2(n)
end;

function fib2 (    n : integer) : integer;
begin
   n := sum(n,-2) ;
   if n <= 1 then fib2 := 1 else fib2 := fib1(n) + fib2(n)
end ;

begin
   n := readln ();
   writeln (fib (n))
end.
