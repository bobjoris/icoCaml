program

procedure f(t : array of integer; n:integer);
var i : integer;
 x : integer;
   
begin
   i := n-1 ;
   while i > 0 do
   begin
      x := t[i] ;
      t[i] := t[i-1] ;
      t[i-1] := x ;
      i := i - 1
   end
end;

begin
   f (new array of integer [101], 101)
end.
