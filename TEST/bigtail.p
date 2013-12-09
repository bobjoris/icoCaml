program

{ both of these functions present a self tail call, with a sliding pattern:
  the parameters slide towards the right in [somme], towards the left in
  [somme2]. Surprisingly, even though my parallel move algorithm is
  dissymmetric, the compiler produces good code in both cases, thanks
  to a good job by the register allocator. }

function somme (a, b, c, d, e, f, g : integer; accu : integer) : integer;
begin
   if a = 0 and b = 0 and c = 0 and d = 0 and e = 0 and f = 0 and g = 0 then
      somme := accu
   else
      somme := somme (0, a, b, c, d, e, f, g + accu)
end; { somme }

function somme2 (a, b, c, d, e, f, g : integer; accu : integer) : integer;
begin
   if a = 0 and b = 0 and c = 0 and d = 0 and e = 0 and f = 0 and g = 0 then
      somme2 := accu
   else
      somme2 := somme2 (b, c, d, e, f, g, 0, a + accu)
end; { somme2 }

begin
   writeln(somme (1, 2, 3, 4, 5, 6, 7, 0));
   writeln(somme2(1, 2, 3, 4, 5, 6, 7, 0))
end.

