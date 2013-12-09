{ A program to solve the 8-queens problem. }

program

var 
   n		     : integer;
   col		     : array of integer;
   row, diag1, diag2 : array of boolean;

procedure printboard ();
var
   i, j	: integer;
begin
   i := 0;
   while (i < n) do begin
      j := 0;
      while (j < n) do begin
	 if col[i] = j then
	    write(1)
	 else
	    write(0);
	 j := j + 1
      end;
      writeln(2);
      i := i + 1
   end;
   writeln(2)
end; { printboard }

procedure try (c : integer);
var
   r : integer;
begin
   if c = n then
      printboard()
   else begin
      r := 0;
      while r < n do begin
	 if not row[r] and not diag1[r+c] and not diag2[r+7-c] then begin
	    row[r] := true;
	    diag1[r+c] := true;
	    diag2[r+7-c] := true;
	    col[c] := r;
	    try(c+1);
	    row[r] := false;
	    diag1[r+c] := false;
	    diag2[r+7-c] := false
	 end else begin end;
	 r := r + 1
      end
   end
end; { try }

begin
   n := readln();
   row := new array of boolean [n];
   col := new array of integer [n];
   diag1 := new array of boolean [2*n-1];
   diag2 := new array of boolean [2*n-1];
   try(0)
end.

