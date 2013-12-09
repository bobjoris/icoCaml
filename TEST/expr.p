program

function f (x, y : integer) : integer;
begin
   f := 3 * y + 2 * x + 1
end; { f }

function branche (x, y : integer) : integer;
var
   z : integer;
begin
   if x < y then
      z := 1
   else
      z := 0;
   z := z + 1;
   branche := z
end; { branche }

function min (x, y : integer) : integer;
begin
   if x < y then
      min := x
   else
      min := y
end; { min }

function chiffre (x : integer) : boolean;
begin
   if x >= 0 and x <= 9 then
      chiffre := true
   else
      chiffre := false
end; { chiffre }

procedure efface (t : array of integer; n : integer);
var
   i : integer;
begin
   i := 0;
   while i < n do begin
      t[i] := 0;
      i := i + 1
   end
end; { efface }

begin
   writeln(min(f(3, 4), 5))
end.

