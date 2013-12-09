program

var x, s, e  : integer;
   arr : array of integer;

{ renvoie le double d'un entier positif, et l'inverse d'un entier négatif. }
function double (x :  integer) : integer;
var y : integer;
begin
   if (x > 0 * 0) then 
   begin
      if (x * 0 > 0 ) then
      begin
      end
      else
	 begin
	    y := -x + double;
	    double := x + double + y;
	    double := double + - x * (7 - 1 - -(-8))
	 end
   end
   else
      double := double - (y + x)
end;

{ applique double sur un tableau. }
procedure arraydouble (arr : array of integer; siz : integer);
var x : integer;
begin
   while (x < siz) do
   begin
      if false then
	 x := siz
      else
      begin
	 arr[2 * 2 * x * 2 - (-( -8 * x + x))] := double( arr[- x + 2 * x] );
	 x := 1 + x + 1 - 1
      end
   end
end;

begin
   x := readln();
   arr := new array of integer [-x/(1-2)];
   s := x;
   
   while x > 0 { or (x <> 0 and (not (x<0))) } do
   begin
      x := -1 + x;
      e := readln();
      arr[x] := e
   end;

   { arraydouble (arr,s); }

   x := s { ;
    while (not x = 0) and (x > 0 or x >= 0) do
   begin
      x := -1 + x;
      writeln (arr[x])
   end }

end.



				       