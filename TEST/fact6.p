program

var
   x : integer;

{ factaccu } { order of parameters reversed wrt fact3 }
function f (accu, n : integer) : integer;
begin
   if n <= 1 then
      f := accu
   else
      f := f (n * accu, n - 1)
end; { factaccu }

function fact (n : integer) : integer;
begin
   fact := f (1, n)
end;

begin
   x := readln();
   writeln(fact(x))
end.
