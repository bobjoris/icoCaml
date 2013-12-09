program

{ an external tail call with more than 4 parameters }
{ this cannot (easily) be compiled to a true tail call }

function g (a, b, c, d, e, f : integer) : integer;
begin
   g := a + 2 * b + 3 * c + 5 * d + 7 * e + 11 * f
end; { g }

function f (x : integer) : integer;
begin
   f := g (1, 2, 3, 4, 5, 6)
end; { f }

begin
   writeln(f(10))
end.
