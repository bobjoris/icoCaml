program

procedure ecrit(x  : integer);
begin
   writeln(x)
end;
procedure many (a0 : integer; a1 : integer; a2 : integer;
                a3 : integer; a4 : integer; a5 : integer);
begin
   ecrit (a0);
   ecrit (a1);
   ecrit (a2);
   ecrit (a3);
   ecrit (a4);
   ecrit (a5)
end;
begin
   many (1,2,3,4,5,6)
end
.