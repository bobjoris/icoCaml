program

var
   x : integer;

begin
   x := 1073741823;
   while x <= 1073741823 + 10 do begin
      writeln(x);
      x := x + 1
   end
end.
