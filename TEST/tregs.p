program
function g(    x : integer;     y : integer) :integer;
begin
   g := x+y
end;

function f(    x : integer) : integer ;
begin
   f := g(x,1)+(g(x,2)+(g(x,3)+(g(x,4)+g(x,5))))
end;


function h(    x : integer) : integer ;
var r : integer;
begin
   r := g(x,1);
   r := r + g(x,2);
   r := r + g(x,3);
   r := r + g(x,4);
   r := r + g(x,5);
   h := r
end;
function k(    x : integer) : integer ;
begin
   k := g(x,1);
   k := k + g(x,2);
   k := k + g(x,3);
   k := k + g(x,4);
   k := k + g(x,5)
end;
   
begin
   writeln(f(10)) ;
   writeln(h(10)) ;
   writeln(k(10))
end.