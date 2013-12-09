program

var
   x : integer;

{ factaccu }
function f (n, accu : integer) : integer;
begin
   if n <= 1 then
      f := accu
   else
      f := f (n - 1, n * accu)
end; { factaccu }

function fact (n : integer) : integer;
begin
   fact := f (n, 1)
end;

begin
   x := readln();
   writeln(fact(x))
end.
