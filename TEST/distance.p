program

{ A program that computes the minimal distance between
  two words. }

var
   n1, n2    : integer;
   w1, w2    : array of integer;

function min (i, j : integer) : integer;
begin
   if i < j then
      min := i
   else
      min := j
end; { min }

function distance () : integer;
var
   t		   : array of integer;
   i, j, old, temp : integer;
begin
   t := new array of integer [n2 + 1];
   i := 0;
   while i <= n2 do begin
      t[i] := n2 - i;
      i := i + 1
   end;
   i := n1 - 1;
   while i >= 0 do begin
      old := t[n2];
      t[n2] := t[n2] + 1;
      j := n2 - 1;
      while j >= 0 do begin
	 temp := old;
	 old := t[j];
	 if w1[i] = w2[j] then
	    t[j] := temp
	 else
	    t[j] := min(t[j], t[j+1]) + 1;
	 j := j - 1
      end;
      i := i - 1
   end;
   distance := t[0]
end;

function input (n : integer) : array of integer;
var
   i : integer;
   t : array of integer;
begin
   t := new array of integer [n];
   i := 0;
   while i < n do begin
      t[i] := readln();
      i := i + 1
   end;
   input := t
end; { input }

begin
   n1 := readln();
   w1 := input(n1);
   n2 := readln();
   w2 := input(n2);
   writeln(distance())
end.

