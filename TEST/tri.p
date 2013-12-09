program
  var n : integer;
      i : integer;
      x : integer;
      t : array of integer;

procedure insertion();
var i : integer;
    j : integer;
    v : integer;
    b : boolean;
begin
   i := 1;
   while i < n do
      begin
         v := t[i];
         j := i;
         if j > 0 then b := t [j-1] > v else b := false;
         while b do
            begin
               t[j] := t[j-1];
               j := j-1;
               if j > 0 then b := t [j-1] > v else b := false
            end;
         t[j] := v;
         i := i+1
      end
end;
   
begin 
   t := new array of integer [100];
   i := 0;
   x := readln ();
   while x <> 0 do
      begin
         t[i] := x;
        i := i+1;
	 x := readln ()
      end;
   n := i;
   writeln (n);
   insertion ();
   i := 0;
   while i < n do
      begin
         writeln (t[i]);
         i := i+1
      end
end.
