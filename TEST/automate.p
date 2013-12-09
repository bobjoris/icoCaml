program

function odd (n : integer) : integer;
begin
   if n = 0 then
      odd := 0
   else
      odd := even (n-1)
end; { odd }

function even (n : integer) : integer;
begin
   if n = 0 then
      even := 1
   else
      even := odd (n-1)
end; { even }

procedure check ();
var i : integer;
begin
   i := 100;
   while (i >= 0) do begin
      writeln(even(i));
      i := i - 1
   end
end; { check }

begin
   check()
end.