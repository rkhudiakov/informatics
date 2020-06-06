program lab2;

uses
  SysUtils;

type
  Data = record
    Time: Integer;
    Id: Integer;
    Enters: Integer;
  end;

var
  T: array [1..100] of TextFile;                        //Массив файловых переменных
  Mas: array [1..100] of Data;
  TF: TextFile;
  I, J, N, Num, Imax: Integer;
  S: String;
  EndOF: Boolean;
  Max: Data;

function Take(SS: String): Data;                         //Конвертирует строку в Integer
var
  I: Integer;
  S1: String;
  begin
    S1:= SS;
    for I:=1 to Length(SS) do
      if SS[I] = ' ' then
        break;
    Take.Time:= StrToInt(copy(S1,1,I-1));
    Delete(S1,1,I);

    for I:=1 to Length(SS) do
      if SS[I] = ' ' then
        break;
    Take.Id:= StrToInt(copy(S1,1,I));
    Delete(S1,1,I);
    WriteLn(' ');
    Take.Enters:= StrToInt(copy(S1,2,Length(S1)-1));
  end;

procedure Clear(out Per: Data);
  begin
    Per.Time:= 0;
    Per.Id:= 0;
    Per.Enters:= 0;
  end;

begin
  Write('Enter files count: ');
  ReadLn(Num);
  for I:=1 to Num do
    begin
      S:= 'txt'+IntToStr(I)+'.txt';
      Assign(T[I],S);
      Reset(T[I]);
      WriteLn(S);
    end;

  Assign(TF, 'EndFile.txt');
  Rewrite(TF);
  N:= 1;                                  //Количество файлов, доступных для сортировки
  EndOF:= false;
  WriteLn;

  for I:=1 to Num do
    begin
      ReadLn(T[I],S);
      Mas[I]:= Take(S);
    end;

  While EndOF = false do
    begin
      Clear(Max);
      for I:=1 to Num do
        if Mas[I].Enters > Max.Enters then
          begin
            Max:= Mas[I];
            Imax:= I;
          end;
      S:= IntToStr(Max.Time)+' '+IntToStr(Max.Id)+' '+IntToStr(Max.Enters);
      WriteLn(S);
      Write(TF,S);

  if EOF(T[Imax])=true then                            //Если файл закончился, то его нужно закрыть, иначе считать следующую строку
    begin
      CloseFile(T[Imax]);
      Clear(Mas[Imax]);
    end
  else
    begin
      ReadLn(T[Imax],S);
      Mas[Imax]:= Take(S);
    end;

  for J:=1 to Num do
    if Mas[J].Enters > 0 then
      N:= N+1;
    if N = 0 then
      EndOF:= true;
    N:= 0;
    if EndOF = false then
      WriteLn(TF);                               //Переносим курсор на следующую строку в конечном файле
  end;

  CloseFile(TF);
  ReadLn;
end.


