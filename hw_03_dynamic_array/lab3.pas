program lab3;

var
  Numb, I, J, H, W, Vitok, MaxVit, Ctr: Integer;
  UpYes: Boolean;
  Mas: array of array of Integer;


procedure UpDo;
  begin
    if Numb = 9 then
      UpYes:= false;
    if Numb = 1 then
      UpYes:= true;
    if UpYes = true then
      begin
        Numb:= Numb+1;
      end
  else
    begin
      Numb:= Numb-1;
    end;
  end;

begin

  Write('Enter height: ');
  ReadLn(H);
  Write('Enter width: ');
  ReadLn(W);
  SetLength(Mas,H);
  for I:=0 to H-1 do
    Setlength(Mas[I],W);
  I:= 0;
  J:= 0;
  Numb:= 1;

  if H < W then
    MaxVit:= H div 2
  else
    MaxVit:= W div 2;

  if (H mod 2 = 1) and (W mod 2 = 1) then
    Ctr:= 1;

  for Vitok:=0 to MaxVit-1 do

  begin

    for J:= Vitok to W-1-Vitok do              //По верхнему ряду
       begin
         Mas[I,J]:= Numb;
         UpDo;
       end;
    Write(' ');

    for I:= 1+Vitok to H-1-Vitok do                //По правому ряду
      begin
        Mas[I,J]:= Numb;
        UpDo;
      end;
    Write(' ');

    for J:= W-2-Vitok DownTo Vitok do                //По нижнему ряду
      begin
        Mas[I,J]:= Numb;
        UpDo;
      end;
    Write(' ');

    for I:= H-2-Vitok DownTo 1+Vitok do                    //По левому ряду
      begin
        Mas[I,J]:= Numb;
        UpDo;
      end;
    Write(' ');

  end;

  if Ctr = 1 then                               //Заполняем пустой элемент
    begin
    if W = H  then
      begin
      Vitok:= Vitok+1;
      Mas[Vitok,Vitok]:= Numb;
    end
  else
    if W < H   then
      begin
        J:= J+1;
        for I:=1+Vitok to H-2-Vitok do
          begin
            Mas[I,J]:= Numb;
            UpDo;
         end
     end
  else
    if W > H   then
      for J:=1+vitok to W-2-Vitok do
        begin
          Mas[I,J]:= Numb;
          UpDo;
        end;

    end;

  WriteLn;

  for I:=0 to H-1 do
    begin
    for J:=0 to W-1 do
      Write(mas[I,J],' ');
    WriteLn;
    end;

  ReadLn;

end.

