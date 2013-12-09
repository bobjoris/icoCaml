program

{ a couple of tail calls to a common external target }
{ the cleanup sequences should be shared }

procedure f (x : integer);
begin
   if x = 0 then
      writeln(0)
   else if x = 1 then
      writeln(1)
   else
      f (x - 2)
end; { f }

procedure g (x : integer);
begin
   if x = 0 then
      writeln(0)
   else if x = 1 then
      writeln(1)
   else begin
      g (x - 2);
      g (x - 1)
   end
end; { g }

begin
   f(10);
   g(10)
end.

