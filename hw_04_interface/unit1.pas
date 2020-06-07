unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReadTEdit();
    procedure Clear();
  private

  public

  end;

var
  Form1: TForm1;
  A, B, C: TPoint;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ReadTEdit();
begin
  A.x:= StrToInt(Edit1.Text);
  A.y:= StrToInt(Edit2.Text);
  B.x:= StrToInt(Edit3.Text);
  B.y:= StrToInt(Edit4.Text);
  C.x:= StrToInt(Edit5.Text);
  C.y:= StrToInt(Edit6.Text);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ReadTEdit();
  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Color:= clBlue;
  Image1.Canvas.Pen.Width:= 1;

  Image1.Canvas.MoveTo(A);
  Image1.Canvas.LineTo(B);
  Image1.Canvas.LineTo(C);
  Image1.Canvas.LineTo(A);

  Image1.Canvas.Brush.Style:= bsSolid;
  Image1.Canvas.Brush.Color:= clBlack;
  Image1.Canvas.Pen.Width:= 0;

  Image1.Canvas.Ellipse(A.x-5,A.y-5,A.x+5,A.y+5);
  Image1.Canvas.Ellipse(B.x-5,B.y-5,B.x+5,B.y+5);
  Image1.Canvas.Ellipse(C.x-5,C.y-5,C.x+5,C.y+5);
end;

function LineLineIntersection(P1,P2,P3,P4: TPoint): TPoint;
var
  T: Real;
begin
  T:= ((P1.x-P3.x)*(P3.y-P4.y)-(P1.y-P3.y)*(P3.x-P4.x))/((P1.x-P2.x)*(P3.y-P4.y)-(P1.y-P2.y)*(P3.x-P4.x));
  LineLineIntersection.x:= round(P1.x+T*(P2.x-P1.x));
  LineLineIntersection.y:= round(P1.y+T*(P2.y-P1.y));
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  AB, BC, AC, nAB, nBC, nAC: TPoint;
  H1, H2, H3: TPoint;
  M, N, P: TPoint;

begin
  ReadTEdit;
  BC.x:= C.x-B.x;
  BC.y:= C.y-B.y;
  AB.x:= B.x-A.x;
  AB.y:= B.y-A.y;
  AC.x:= C.x-A.x;
  AC.y:= C.y-A.y;

  nAB.x:= -AB.y;
  nAB.y:= AB.x;
  nBC.x:= -BC.y;
  nBC.y:= BC.x;
  nAC.x:= -AC.y;
  nAC.y:= AC.x;

  H1.x:= C.x+nAB.x;
  H1.y:= C.y+nAB.y;
  H2.x:= A.x+nBC.x;
  H2.y:= A.y+nBC.y;
  H3.x:= B.x+nAC.x;
  H3.y:= B.y+nAC.y;

  M:= LineLineIntersection(A,B,C,H1);
  N:= LineLineIntersection(B,C,A,H2);
  P:= LineLineIntersection(C,A,B,H3);

  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Color:= rgbToColor(255,20,147);
  Image1.Canvas.Pen.Width:= 1;

  Image1.Canvas.MoveTo(A);
  Image1.Canvas.LineTo(N);
  Image1.Canvas.MoveTo(B);
  Image1.Canvas.LineTo(P);
  Image1.Canvas.MoveTo(C);
  Image1.Canvas.LineTo(M);

  Image1.Canvas.Brush.Style:= bsSolid;
  Image1.Canvas.Brush.Color:= clBlack;

  Image1.Canvas.Ellipse(A.x-5,A.y-5,A.x+5,A.y+5);
  Image1.Canvas.Ellipse(B.x-5,B.y-5,B.x+5,B.y+5);
  Image1.Canvas.Ellipse(C.x-5,C.y-5,C.x+5,C.y+5);

  Image1.Canvas.Brush.Color:= rgbToColor(0,255,0);

  Image1.Canvas.Ellipse(M.x-5,M.y-5,M.x+5,M.y+5);
  Image1.Canvas.Ellipse(N.x-5,N.y-5,N.x+5,N.y+5);
  Image1.Canvas.Ellipse(P.x-5,P.y-5,P.x+5,P.y+5);
end;

procedure TForm1.Clear();
begin
  Image1.Canvas.Pen.Width:= 1;
  Image1.Canvas.Pen.Style:= psSolid;
  Image1.Canvas.Pen.Color:= clBlack;

  Image1.Canvas.Brush.Style:= bsSolid;
  Image1.Canvas.Brush.Color:= clWhite;

  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  Clear();
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Clear();
end;



end.

