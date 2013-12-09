program
  var n : integer;
function fib (n : integer) : integer;
begin
   if n <= 1 then fib := 1 else fib := fib (n-1) + fib(n-2)
end;
begin
   n := readln ();
   writeln (fib (n))
end.
