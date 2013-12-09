{ Ce test vérifie quelques problèmes de priorité et d'analyse
  syntaxique. }

program

begin
   if true then
      if false then
	 writeln(0)
      else
	 writeln(1) else begin end;

   writeln(1+2*3);
   writeln(2*3+1);
   writeln(2-1-1);
   writeln(4-2*2);
   writeln(4-2/1*2);

   if (true or true) and false then
      writeln(1)
   else
      writeln(0)
end.

