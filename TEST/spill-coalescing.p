program

function increment (x : integer) : integer;
begin
   increment := x + 1
end; { increment }

function artificial () : integer;
var
   x0, x1, x2, x3, x4, x5, x6, x7, x8, x9, x10, x : integer;
   y0, y1, y2, y3, y4, y5, y6, y7, y8, y9, y10, y : integer;
begin
   x0 := 0;
   x1 := 1;
   x2 := 2;
   x3 := 3;
   x4 := 4;
   x5 := 5;
   x6 := 6;
   x7 := 7;
   x8 := 8;
   x9 := 9;
   x10 := 10;
   x0 := increment(x0);
   x1 := increment(x1);
   x2 := increment(x2);
   x3 := increment(x3);
   x4 := increment(x4);
   x5 := increment(x5);
   x6 := increment(x6);
   x7 := increment(x7);
   x8 := increment(x8);
   x9 := increment(x9);
   x10 := increment(x10);
   x := x0 + x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 + x10;
   y0 := x0;
   y1 := x1;
   y2 := x2;
   y3 := x3;
   y4 := x4;
   y5 := x5;
   y6 := x6;
   y7 := x7;
   y8 := x8;
   y9 := x9;
   y10 := x10;
   y0 := increment(y0);
   y1 := increment(y1);
   y2 := increment(y2);
   y3 := increment(y3);
   y4 := increment(y4);
   y5 := increment(y5);
   y6 := increment(y6);
   y7 := increment(y7);
   y8 := increment(y8);
   y9 := increment(y9);
   y10 := increment(y10);
   y := y0 + y1 + y2 + y3 + y4 + y5 + y6 + y7 + y8 + y9 + y10;
   artificial := x + y
end; { artificial }

begin
   writeln(artificial())
end.

