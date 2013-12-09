program

var
   n : integer;
   t : array of integer;

procedure swap (t : array of integer; i, j : integer);
var v : integer;
begin
   v := t[i];
   t[i] := t[j];
   t[j] := v
end; { swap }

{ [downheap N t k n] moves the element t[k] down in the heap encoded in t[j..n] }

procedure downheap (t : array of integer; k, n : integer);
var j, jprime : integer;
begin
   j := 2*k+1;
   if j <= n then begin
      if j+1 <= n then
	 if t[j] < t[j+1] then
	    jprime := j+1
	 else
	    jprime := j
      else
	 jprime := j;
      if t[k] < t[jprime] then begin
	 swap(t, k, jprime);
	 downheap (t, jprime, n)
      end else begin end
   end else begin end
end; { downheap }

procedure heapsort (t : array of integer; n : integer);
var k : integer;
begin
   k := (n - 2) / 2;
   while k >= 0 do begin
      downheap(t, k, n - 1);
      k := k - 1
   end;
   k := n - 1;
   while k >= 1 do begin
      swap(t, 0, k);
      downheap(t, 0, k - 1);
      k := k - 1
   end
end; { heapsort }

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
      heapsort(t, n);
      output(t, n);
      n := readln()
   end
end.
