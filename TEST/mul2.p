program
var n : integer;

function matrix (    n : integer) : array of array of integer;
var t : array of array of integer;
    i : integer;
begin
   t := new array of array of integer [n];
   i := 0;
  while i < n do
    begin
      t[i]:= new array of integer [n];
      i := i+1
    end;
    matrix := t
end;

procedure set (    t : array of array of integer;
                   i : integer;     j : integer;     v : integer);
begin
   t [i][j] := v
end;

function get (    t : array of array of integer;
                   i : integer;     j : integer) : integer;
begin
   get := t [i][j]
end;

function lire (    n : integer) : array of array of integer;
var i : integer;
    j : integer;
    t : array of array of integer;
    x : integer;
begin
   t := matrix(n);
   i := 0 ;
   while i < n do begin
      j := 0;
      while j < n do begin
	 x := readln();
         set (t, i, j, x);
         j := j + 1
      end ;
      i := i+1
   end;
   lire := t
end;


procedure affiche (    t :array of array of integer;     n : integer);
var i : integer;
    j : integer;
begin
   i := 0 ;
   while i < n do begin
      j := 0;
      while j < n do begin
         writeln(t[i][j]);
         j := j + 1
      end;
      i := i+1
   end
end;

function
    matmult(    a : array of array of integer;
                b : array of array of integer)
      : array of array of integer;
var r : array of array of integer;
    i : integer;
    j : integer;
    k : integer;   
    t : integer;
begin
   r := matrix(n);
   i := 0;
   while i < n do begin
      j := 0;
      while j < n do begin
         k := 0;
         t := 0;
         while k < n do begin
            t := t + get (a, i, k) * get (b, k, j);
            k := k+1
         end;
         set (r, i, j, t);
         j := j+1
      end;
      i := i+1
   end;
   matmult := r
end;

function pow(    n : integer;     a : array of array of integer)
  : array of array of integer;
var t : array of array of integer;
begin
   if n = 1 then
      pow := a
   else begin
      t := pow(n/2,a);
      t := matmult(t,t);
      if (n/2) * 2 = n then
         pow := t
      else
         pow := matmult(a,t)
   end
end;
   
begin 
   n := readln();
   affiche(pow(n,lire(n)), n)
end.
