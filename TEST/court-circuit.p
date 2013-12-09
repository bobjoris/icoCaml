program

{ Ce test vérifie que l'évaluation du and est bien court-circuit,
  ainsi que le spécifie la sémantique de Pseudo-Pascal. }

function vrai () : boolean;
begin
   writeln(0);
   vrai := true
end;

begin
   if false and vrai() then begin
   end else begin end
end.
