program

var x : integer;

procedure tab (n : integer);
var
   a : array of integer;
   i : integer;
begin
   a := new array of integer [n];
   i := 0;
   while i < n do begin
      writeln(a[i]);
      i := i + 1
   end
end;

procedure f ();
var x : integer;
begin
   writeln(x)
end;

begin
   f();
   writeln(x);
   tab(100)
end.

