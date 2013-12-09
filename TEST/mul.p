program
var n : integer;
    a : array of integer;

function lire () : array of integer;
var i : integer;
    j : integer;
    t : array of integer;
    x : integer;
begin
   t := new array of integer [ n * n ];
   i := 0 ;
   while i < n do begin
      j := 0;
      while j < n do begin
	 x := readln();
         t[n*i+j] := x;
         j := j + 1
      end ;
      i := i+1
   end;
   lire := t
end;


procedure affiche (    t :array of integer );
var i : integer;
    j : integer;
begin
   i := 0 ;
   while i < n do begin
      j := 0;
      while j < n do begin
         writeln(t[n*i+j]);
         j := j + 1
      end;
      i := i+1
   end
end;

function
  matmult(    a : array of integer;     b : array of integer):array of integer;
var r : array of integer;
    i : integer;
    j : integer;
    k : integer;   
    t : integer;
begin
   r := new array of integer [n*n];
   i := 0;
   while i < n do begin
      j := 0;
      while j < n do begin
         k := 0;
         t := 0;
         while k < n do begin
            t := t + a[n*i+k] * b[n*k+j];
            k := k+1
         end;
         r[n*i+j] := t;
         j := j+1
      end;
      i := i+1
   end;
   matmult := r
end;

function pow(    n : integer;     a : array of integer):array of integer;
var t : array of integer;
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
   a := lire();
   affiche(pow(n,a))
end.
