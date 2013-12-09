program

var max, n : integer;

function modulo(n : integer; p : integer) : integer;
begin
   modulo := n - (n / p) * p
end;

function grandir(n : integer) : array of integer;
var r : array of integer;
i : integer;
begin
   r := new array of integer [max+1];
   i := 0;
   while n > 0 do begin
      i := i+1 ;
      r[i] := modulo(n,10) ;
      n := n / 10
   end;
   r[0] := i;
   grandir := r
end;

procedure affiche (e :  array of integer);
var i :  integer;
begin
   i := e[0];
   while i > 1 do begin
      write(e[i]);
      i := i-1
   end;
   if e[0] = 0 then
      writeln(0)
   else
      writeln(e[1])
end;

procedure bigadd (n : array of integer; m : array of integer) ;
var i : integer;
r : integer;
nc : integer;
begin
   if n[0] < m[0] then
      nc := n[0]
   else
      nc := m[0];
   i := 1;
   r := 0;
   while i <= nc do begin
      r := n[i] + m[i] + r;
      n[i] := modulo(r,10);
      r := r/10;
      i := i + 1
   end;
   while i <= n[0] do begin
      r := n[i] + r;
      n[i] := modulo(r,10);
      r := r/10;
      i := i + 1
   end;
   while i <= m[0] do begin
      r :=  m[i] + r;
      n[i] := modulo(r,10);
      r := r/10;
      i := i + 1
   end;
   if r = 0 then
      n[0] := i-1
   else begin
      n[i] := r;
      n[0] := i
   end   
end;

procedure copy (n : array of integer; m : array of integer);
var i :  integer;
begin
   i := m[0];
   while i >= 0 do begin
      n[i] := m[i];
      i := i-1
   end
end;

procedure triangle(n : integer );
var i : integer;
j : integer;
c : array of array of integer;
begin
   i := 0;
   c := new array of array of integer [n+1];
   while i <= n do begin
      j := i-1;
      while j > 0 do begin
         bigadd(c[j], c[j-1]) ;
         j := j-1
      end ;
      c[0] := grandir(1);
      c[i] := grandir(1);
      i := i+1
   end ;
   j := 0 ;
   while j <= n do begin
      affiche(c[j]);
      j := j+1
   end
end;

begin  
   max := 32;
   n := readln() ;
   triangle(n)
end.
