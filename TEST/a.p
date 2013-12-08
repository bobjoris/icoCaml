program

var x : integer;
   
function f (n0, n1, n2, n3, n4, n5, n6, n7, n8, n9 : integer) : integer;
begin
   f := n0+n1+n2+n3+n4+n5+n6+n7+n8+n9
end; { f }

function g (x : integer) : integer;
begin
   g := x
end;

begin
   x := 1;
   writeln (f(x, g(2), 3, 4, 5, 6, 7, g(g(8)), 9, 10))
end.
