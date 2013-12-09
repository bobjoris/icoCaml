program

var n : integer;
   
procedure coucou (i : integer);
var j : integer;
    k : integer;
    l : integer;
    m : integer;
begin
   j := (((((i*i)+(i+i)+(i*i)+(i+i))+((i*i)+(i+i)+(i*i)+(i+i)))+(((i*i)+(i+i)+(i*i)+(i+i))+((i*i)+(i+i)+(i*i)+(i+i))))+((((i*i)+(i+i)+(i*i)+(i+i))+((i*i)+(i+i)+(i*i)+(i+i)))+(((i*i)+(i+i)+(i*i)+(i+i))+((i*i)+(i+i)+(i*i)+(i+i)))));
   writeln(j);
   k := j+i;
   writeln(k);
   l := j+k+i;
   writeln(l);
   m := l+j+k+i;
   writeln(m);
   writeln((((i-i)-i)-i)-i);
   writeln(i-(i-(i-(i-i))));
   writeln(i * -10);
   writeln(i / (4));
   writeln(i - (i / 4 )*4)
end;

begin
   n := readln();
   while n <> 0 do begin
      coucou(n) ;
      n := readln()
   end
end.

