{* Traduction manuelle du programme HP48 suivant, qui calcule une
 * factorielle:
 *
 *  1 SWAP
 *  WHILE DUP 0 >
 *  REPEAT
 *    DUP ROT SWAP * SWAP 1 -
 *  END
 *  DROP
 *}

program

function fact (n : integer) : integer;
var x1, x2, x3 : integer; { une pile a trois niveaux }
   t	       : integer; { temporaire d'echange }
begin
   x1 := n; { initialisation }
   x2 := x1; x1 := 1; { 1 }
   t := x2; x2 := x1; x1 := t; { SWAP }
   while x1 > 0 do begin { je triche en traduisant finement DUP 0 > }
      x3 := x2; x2 := x1; { DUP }
      t := x3; x3 := x2; x2 := x1; x1 := t; { ROT }
      t := x2; x2 := x1; x1 := t; { SWAP }
      x1 := x1 * x2; x2 := x3; { * }
      t := x2; x2 := x1; x1 := t; { SWAP }
      x1 := x1 - 1 { je triche en traduisant finement 1 - }
   end;
   x1 := x2; { DROP }
   fact := x1
end; { fact }

function factSSA (n : integer) : integer;
var a1, b2, b1, c2, c1, d2, d1, e3, e2, e1, f3, f2, f1, g3, g2, g1, h2, h1, i2, i1, j2, j1, k2, k1, l1 : integer;
begin
   a1 := n; { initialisation }
   b2 := a1; b1 := 1; { 1 }
   c2 := b1; c1 := b2; { SWAP }
   d1 := c1; d2 := c2; { phi move }
   while d1 > 0 do begin { DUP 0 > }
      e3 := d2; e2 := d1; e1 := d1; { DUP }
      f3 := e2; f2 := e1; f1 := e3; { ROT }
      g3 := f3; g2 := f1; g1 := f2; { SWAP }
      h2 := f3; h1 := f2 * f1; { * }
      i2 := h1; i1 := h2; { SWAP }
      j2 := i2; j1 := i1 - 1; { 1 - }
      d2 := j2; d1 := j1 { phi move }
   end;
   k2 := d2; k1 := d1; { phi move? }
   l1 := k2; { DROP }
   factSSA := l1
end; { factSSA }
   
begin
   writeln(fact(5));
   writeln(factSSA(5))
end.

