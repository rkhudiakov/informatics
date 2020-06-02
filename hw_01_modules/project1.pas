program project1;

uses

  Geometry;

var
  Tri: Triangle;
  L: Line;
  x,y: Real;
  Cr: Circle;
  Rad: Real;

begin

  WriteLn('Enter xA, yA: ');
  ReadLn(x,y);
  Tri.A.X:=x;
  Tri.B.Y:=y;

  WriteLn('Enter xB, yB: ');
  ReadLn(x,y);
  Tri.B.X:=x;
  Tri.B.Y:=y;

  WriteLn('Enter xC, yC: ');
  ReadLn(x,y);
  Tri.C.X:=x;
  Tri.C.Y:=y;

  WriteLn('Enter xH, yH: ');
  ReadLn(x,y);
  L.H.X:=x;
  L.H.Y:=y;

  WriteLn('Enter xK, yK: ');
  ReadLn(x,y);
  L.K.X:=x;
  L.K.Y:=y;

  WriteLn('Enter xO, yO: ');
  ReadLn(x,y);
  Cr.O.X:=x;
  Cr.O.Y:=y;

  WriteLn('Enter R: ');
  ReadLn(Rad);
  Cr.R:=Rad;

  WriteLn('AB=', GetDistance(Tri.A, Tri.B):0:2);
  WriteLn('BC=', GetDistance(Tri.B, Tri.C):0:2);
  WriteLn('AC=', getDistance(Tri.A, Tri.C):0:2);

  WriteLn('Perimeter=', GetTrPerimeter(Tri):0:2);
  WriteLn('Square=', GetTrSquare(Tri):0:2);

  WriteLn('Intersection=', Intersection(Tri, L));

  WriteLn('CircSquare=', GetCircSquare(Cr):0:2);
  WriteLn('CircLength=', GetCircLength(Cr):0:2);

  ReadLn();

end.

