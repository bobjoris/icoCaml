program

function debile (x, y : integer) : integer;
var z, t : integer;
begin
   z := debile (x, y);
   x := y;
   t := debile (y, z);
   debile := y + z + t
end; { debile }

begin
end.

