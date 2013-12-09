program

var n : integer;

{ Goal: given i and j distinct members of ( 1, 2, 3 ), find k
  so that ( i, j, k ) = ( 1, 2, 3 ). }

function other (i, j : integer) : integer;
begin
   if i = 1 and j = 2 then
      other := 3
   else if i = 1 and j = 3 then
      other := 2
   else
      other := 1
end; { other }

{ Goal: explain how to move n disks from tower i to tower j. }

procedure hanoi (n : integer; i, j : integer);
var k :  integer;
begin
   if n > 0 then begin
      { Find out where space is available. }
      k := other(i, j);
      { Move n-1 disks from i to k. }
      hanoi (n - 1, i, k);
      { Move one disk from i to j. }
      writeln(10 * i + j);
      { Move n-1 disks from k to j. }
      { Note: this is a tail call. }
      hanoi (n-1, k, j)
   end else begin end
end; { hanoi }

begin
   n := readln();
   hanoi(n, 1, 3)
end.

