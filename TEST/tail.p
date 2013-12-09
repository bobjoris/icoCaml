program

{ some examples of tail calls }

function id (x : integer) : integer;
begin
   writeln(x);
   id := x
end; { id }

{ function to function }

function succ (x : integer) : integer;
begin
   writeln(x);
   succ := id (x + 1)
end; { succ }

{ procedure to function }

procedure p ();
var dummy : integer;
begin
   writeln(2);
   dummy := succ(3)
end; { p }

{ procedure to procedure }

procedure q ();
begin
   writeln(1);
   p()
end; { q }

begin
   q();
   q()
end.

