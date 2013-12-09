program

var
   n, f	: integer;
   a	: array of integer;

procedure find (n, f : integer; a : array of integer);
var
   m, r, i, j, w : integer;
begin
   m := 1;
  while m < n do begin
     r := a[f];
     i := m;
     j := n;
     while i <= j do begin
        while a[i] < r do
	   i := i + 1;
        while r < a[j] do
	   j := j - 1;
        if i <= j then begin
	   w := a[i];
	   a[i] := a[j];
	   a[j] := w;
	   i := i + 1;
	   j := j - 1
	end else begin end
     end;
     if f <= j then
	n := j
     else if i <= f then
	m := i
     else begin
	n := f;
	m := f
     end
  end
end; { find }

function input (n : integer) : array of integer;
var
   i : integer;
   t : array of integer;
begin
   t := new array of integer [n+1];
   i := 1;
   while i <= n do begin
      t[i] := readln();
      i := i + 1
   end;
   input := t
end; { input }

begin
   f := readln();
   n := readln();
   a := input(n);
   find(n, f, a);
   writeln(a[f])
end.

