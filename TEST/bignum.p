program
var max, x : integer;
    n, m, r : array of integer;

function modulo(n, p : integer) : integer;
begin
   modulo := n - (n / p) * p
end;

function grandir (n : integer) : array of integer;
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

procedure bigadd (n, m : array of integer) ;
var i, r, nc : integer;
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

procedure smallmult (n : array of integer; m : integer);
var i, r, nc :  integer;
begin
   i := 1;
   nc := n[0] ;
   r := 0 ;
   while i <= nc do begin
      r := r + m * n[i];
      n[i] := modulo(r,10);
      r := r/10;
      i := i+1
   end;
   while r > 0 do begin
      n[i] := modulo(r,10);
      r := r/10;
      i := i + 1
   end;
   if m = 0 then
      n[0] := 0
   else
      n[0] := i-1
end;

procedure copy (n, m : array of integer);
var i :  integer;
begin
   i := m[0];
   while i >= 0 do begin
      n[i] := m[i];
      i := i-1
   end
end;
   


procedure bigmult (r, n, m : array of integer);
var z : array of integer;
    i :  integer;
begin
   r[0] := 0;
   z := grandir(0);
   i := m[0];
   while i > 0 do begin
      copy(z,n);
      smallmult(z,m[i]);
      smallmult(r,10);
      bigadd(r,z);
      i := i-1
   end
end;

procedure pow
(r : array of integer; n : integer; a : array of integer);
var t :  array of integer;
begin
   if n = 1 then
      copy(r,a)
   else begin
      t := grandir(0);
      pow(t,n/2,a);
      bigmult(r,t,t);
      if (n/2) * 2 = n then begin
      end else begin
         bigmult(t,a,r);
         copy(r,t)
      end
   end;
   writeln(n);
   affiche(r)
end;

function bigfact (n : integer) : array of integer;
var r : array of integer;
begin
   r := grandir(1);
   while n > 0 do begin
      smallmult(r,n);
      n := n-1
   end;
   bigfact := r
end;

begin  
   max := 100;
   n   := grandir(2);
   r   := grandir(0);
   pow(r,16,n);
   affiche(r);
   x := readln();
   while x > 0 do begin
      affiche(bigfact(x));
      x := readln()
   end
end.
