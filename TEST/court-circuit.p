program

{ Ce test v�rifie que l'�valuation du and est bien court-circuit,
  ainsi que le sp�cifie la s�mantique de Pseudo-Pascal. }

function vrai () : boolean;
begin
   writeln(0);
   vrai := true
end;

begin
   if false and vrai() then begin
   end else begin end
end.
