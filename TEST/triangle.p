program
var n : integer;
procedure triangle(n : integer );
var i: integer;
    j : integer;
    c : array of integer;
begin
   i := 0;
   c := new array of integer [n+1];
   while i <= n do begin
      j := i-1;
      while j > 0 do begin
         c[j] := c[j-1] + c[j];
         j := j-1
      end ;
      c[0] := 1;
      c[i] := 1;
      j := 0 ;
      while j <= i do begin
         writeln(c[j]);
         j := j+1
      end ;
      i := i+1
   end
end;

begin
   n := readln();
   triangle(n)
end.