unit Geometry;

interface

const
  pi=3.14;

type

  Point=record
    X,Y: Real;
  end;

  Triangle=record
    A,B,C: Point;
  end;

  Line=record
    H,K: Point;
  end;

  Circle=record
    O: Point;
    R: Real;
  end;

function CreatePoint(const X: Real; const Y: Real): Point;
function CreateTriangle(const A: Point; const B: Point; const C: Point): Triangle;
function CreateLine(const K: Point; const H: Point): Line;
function GetDistance(const P1: Point; const P2: Point): Real;
function GetTrPerimeter(const T: Triangle): Real;//P
function GetTrSquare(const T: Triangle): Real;//S
function GetCircSquare(const Krug: Circle): Real;
function GetCircLength(const Krug: Circle): Real;

function ScalarProd(const P1: Point; const P2: Point): Real;
function Cross(const vec: Point): Point;
function Length(const vec: Point): Real;
function UnitVec(const vec: Point): Point;
function Intersection(const M: Point; const N: Point; const L: Line): Boolean;
function Intersection(const T: Triangle; const L: Line): Boolean;

function GetLinesIntersection (const A: Line; const B: Line; var P: Point): Boolean;

implementation

function GetLinesIntersection (const A: Line; const B: Line; var P: Point): Boolean;
var
  S1, S2, S3, S4: Point;
  Int: Real;
  begin
    S1:= A.H;
    S2:= A.K;
    S3:= B.H;
    S4:= B.K;
    if ((S1.x-S2.x)*(S3.y-S4.y)-(S1.y-S2.y)*(S3.x-S4.x)=0) then
      exit(false)
    else
      begin
         Int:= ((S1.x-S3.x)*(S3.y-S4.y)-(S1.y-S3.y)*(S3.x-S4.x))/((S1.x-S2.x)*(S3.y-S4.y)-(S1.y-S2.y)*(S3.x-S4.x));
         P.x:= S1.x+Int*(S2.x-S1.x);
         P.y:= S1.y+Int*(S2.y-S1.y);
         exit(true);
      end;
  end;

function GetTrPerimeter(const T: Triangle): Real;
  begin
    GetTrPerimeter:=GetDistance(T.A, T.B)+GetDistance(T.B, T.C)+GetDistance(T.A, T.C);
  end;

procedure TrianglePerimeterAndSides(const T: Triangle; out AB: Real; out BC: Real; out AC: Real; out P: Real);
  begin
    AB:=GetDistance(T.A, T.B);
    BC:=GetDistance(T.B, T.C);
    AC:=GetDistance(T.A, T.C);
    P:=GetTrPerimeter(T);
  end;

function CreatePoint(const X: Real; const Y: Real): Point;
  begin
    CreatePoint.X:=X;
    Createpoint.Y:=Y;
  end;

function CreateTriangle(const A: Point; const B: Point; const C: Point): Triangle;
  begin
    CreateTriangle.A:=A;
    CreateTriangle.B:=B;
    CreateTriangle.C:=C;
  end;

function GetDistance(const P1: Point; const P2: Point): Real;
var
  Dis: Point;
  begin
    Dis.X:=P2.X-P1.X;
    Dis.Y:=P2.Y-P1.Y;
    GetDistance:=sqrt(Dis.X*Dis.X+Dis.Y*Dis.Y);
  end;

function GetTrSquare(const T: Triangle): Real;
var
  p: Real;
  AB,BC,AC: Real;
  begin
    TrianglePerimeterAndSides(T, AB, BC, AC, P);
    p:=P/2;
    GetTrSquare:=sqrt(p*(p-AB)*(p-BC)*(p-AC));
  end;

 function CreateLine(const K: Point; const H: Point): Line;
   begin
     CreateLine.K:=K;
     CreateLine.H:=H;
   end;

function ScalarProd(const P1: Point; const P2: Point): Real;
  begin
    ScalarProd:=P1.X*P2.X+P1.Y*P2.y;
  end;

function Cross(const vec: Point): Point;
  begin
    Cross.X:=-vec.Y;
    Cross.Y:=vec.X;
  end;

function Length(const vec: Point): Real;
  begin
    Length:=sqrt(ScalarProd(vec, vec));
  end;

function UnitVec(const vec: Point): Point;
  begin
    UnitVec.X:=vec.X/Length(vec);
    UnitVec.Y:=vec.Y/Length(vec);
  end;

function Intersection(const M: Point; const N: Point; const L: Line): Boolean;
var
  NormalLine: Point;
  DisM,DisN: Real;
  begin
    NormalLine:=UnitVec(Cross(CreatePoint(L.K.X-L.H.X, L.K.Y-L.H.Y)));
    DisM:=ScalarProd(NormalLine, CreatePoint(M.X-L.K.X, M.Y-L.K.Y));
    DisN:=ScalarProd(NormalLine, CreatePoint(N.X-L.K.X, N.Y-L.K.Y));
    if ((DisM>=0.0) and (DisN<=0.0)) then
      exit(true);
    if ((DisM<=0.0) and (DisN>=0.0)) then
      exit(true);
    exit(false);
  end;

function Intersection(const T: Triangle; const L: Line): Boolean;
  begin
    if Intersection(T.A, T.B, L) then
      exit(true);
    if Intersection(T.B, T.C, L) then
      exit(true);
    if Intersection(T.A, T.C, L) then
      exit(true);
    exit(false);
  end;

function GetCircSquare(const Krug: Circle): Real;
  begin
    GetCircSquare:=pi*(Krug.R)*(Krug.R);
  end;

function GetCircLength(const Krug: Circle): Real;
  begin
    GetCircLength:=2*pi*Krug.R;
  end;

end.
