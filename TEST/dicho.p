program

var t : array of integer;

function find (lo, hi : integer;
               a : array of integer; k : integer) : boolean;
var mid	: integer;
begin
  if lo = hi then
    find := false
  else if lo + 1 = hi then
    find := (a[lo] = k)
  else begin
    mid := (lo + hi) / 2;
    if a[mid] < k then
      find := find (mid, hi, a, k)
    else if a[mid] = k then
      find := true
    else
      find := find (lo, mid, a, k)
  end
end; { find }

function findLoop (lo, hi : integer;
                   a : array of integer; k : integer) : boolean;
var mid	 : integer;
   again : boolean;
begin
  again := true;
  while again do begin
    again := false;
    if lo = hi then
      findLoop := false
    else if lo + 1 = hi then
      findLoop := (a[lo] = k)
    else begin
      mid := (lo + hi) / 2;
      if a[mid] < k then begin
	 lo := mid;
	 again := true
      end
      else if a[mid] = k then
	findLoop := true
      else begin
	hi := mid;
	again := true
      end
    end
  end
end; { findLoop }

begin
   t := new array of integer [4];
   t[0] := 3;
   t[1] := 5;
   t[2] := 7;
   t[3] := 48;
   if find (0, 4, t, 7) then
      writeln(1)
   else
      writeln(0);
   if find (0, 4, t, 53) then
      writeln(1)
   else
      writeln(0);
   if findLoop (0, 4, t, 3) then
      writeln(1)
   else
      writeln(0);
   if findLoop (0, 4, t, 4) then
      writeln(1)
   else
      writeln(0)
end.

