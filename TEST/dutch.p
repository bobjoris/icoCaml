program

var
   t : array of integer;
   n : integer;

procedure dutch ();
var
   b, i, r, u : integer;
begin
   r := n;
   while i < r do
     if t[i] = 0 then begin
	u := t[b];
	t[b] := t[i];
	t[i] := u;
	b := b + 1;
	i := i + 1
     end
     else if t[i] = 1 then
	i := i + 1
     else begin
	r := r - 1;
	u := t[r];
	t[r] := t[i];
	t[i] := u
     end
end; { dutch }

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

procedure output (t : array of integer; n : integer);
var
   i : integer;
begin
   i := 0;
   while i < n do begin
      writeln(t[i]);
      i := i + 1
   end
end; { output }

begin
   n := readln();
   while n > 0 do begin
      t := input(n);
      output(t, n);
      dutch();
      output(t, n);
      n := readln()
   end
end.
