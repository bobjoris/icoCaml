program
function f () : integer;
begin
	f := 1 + 1
end;
procedure g(x : integer);
begin
	if x >= 0 then x := f() else g(x + 1)
end;
begin
	g(f())
end.