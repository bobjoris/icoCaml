program
var t : array of integer;
    n : integer;
procedure lire ();
var i : integer;
    e : integer;
begin
   n := readln() ;
   t := new array of integer [n];
   i := n ;
   while i <> 0 do begin
      i := i-1 ;
      e := readln() ;
      t[i] := e
   end
end;

procedure tri(    t : array of integer;     g : integer;     d : integer);
var m : integer;
    v : integer;
    x : integer;
    i : integer;
begin
   if g < d then begin
      v := t[g];
      m := g;
      i := g+1;
      while i < d do begin
         if t[i] < v then begin
            m := m+1;
            x := t[m];
            t[m] := t[i];
            t[i] := x;
            i := i+1
         end else
         i := i+1
      end ;
      x := t[m];
      t[m] := t[g];
      t[g] := x;
      tri(t,g,m);
      tri(t,m+1,d)
   end else begin
   end
end;

procedure affiche ();
var i : integer;
begin
   i := 0 ;
   while i < n do begin
      writeln(t[i]);
      i := i+1
   end
end;
begin
   lire();
   tri(t,0,n);
   affiche()
end.
