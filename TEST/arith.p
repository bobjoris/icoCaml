program

var x, y : integer;

begin
   writeln(2+2);
   y := 1;
   writeln((1+y)+(2+y));
   writeln(2 * (2 * y));
   writeln((2 * 2) * y);
   writeln(2 * (y * 8));
   writeln(0 * y);
   writeln(1 + (y - 1));
   x := y - y + 3;
   writeln(x);
   if 3 <= x and x < 6 then
      writeln(1) else begin end;   
   writeln(10 * (1 + 10 * (1 + 10 * y)));
   writeln((3 * 8) * y);
   writeln(3 * (y * 8));
   writeln(3 * (8 * y));
   writeln(8 * y);
   writeln(-x - y)
end.
