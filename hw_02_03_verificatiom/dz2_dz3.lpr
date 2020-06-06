program dz2_dz3;

var
  Ng, I: Integer;
  NumS: array of Integer;
  GrpN: array of String;
  T: TextFile;
  Name, C: String;
  Y: Boolean;

procedure GroupCheck(out P: String);
var
  S: String;
  N: Integer;
  begin
    ReadLn(T,S);
    for N:=Length(S) DownTo 1 do
      if S[N] = ';' then
        break;
    S:= copy(S,N+1,Length(S)-N);
    P:= S;
  end;

begin
  WriteLn('Enter filename: ');
  ReadLn(Name);
  {Name:= 'students.txt';}
  AssignFile(T,Name);
  Reset(T);
  GroupCheck(C);
    Ng:= 1;
    SetLength(NumS,Ng);
    SetLength(GrpN,Ng);
    NumS[Ng]:= 1;
    GrpN[I]:= C;

  While  1 > 0 do
    begin
      GroupCheck(C);
      for I:=0 to Ng-1 do
        if C = GrpN[I] then
          begin
            Y:= true;
            NumS[I]:= NumS[I]+1;
            GrpN[I]:= C;
            break;
          end;
        if Y = false then
          begin
            Ng:= Ng+1;
            SetLength(NumS,Ng);
            SetLength(GrpN,Ng);
            NumS[Ng-1]:= 1;
            GrpN[Ng-1]:= C;
          end;
        Y:= false;
        if EOF(T) = true then
          break;
    end;

   for I:=0 to Ng-1 do
      WriteLn(GrpN[I], ': ', NumS[I]);
   CloseFile(T);
   ReadLn;
end.
