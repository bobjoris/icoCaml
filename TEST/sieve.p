program

procedure sieve ();
var n, i, j : integer;
    prime   : array of boolean;
begin
   n := readln();
   prime := new array of boolean [n];
   { Initialization }
   i := 1;
   while i < n do begin
      prime[i] := true;
      i := i + 1
   end;
   { Sieve }
   writeln(1);
   i := 2;
   while i < n do begin
      if prime[i] then begin
	 writeln(i);
	 j := 2 * i;
	 while j < n do begin
	    prime[j] := false;
	    j := j + i
	 end
      end else begin end;
      i := i + 1
   end
end; { sieve }

begin
   sieve()
end.

