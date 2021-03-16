uses crt;
var
    s , ans : array[0..1000000] of string;
    str : string;
    n , m  , res , u : longint;
    x : char;

procedure enter;
var
        i : longint;
  begin
    clrscr;
    Textbackground(10);
    writeln('BIOLOGY 12 @@ VIET DO VERSION qrweaa@gmail.com ');
    Textbackground(0);
    writeln('Hay Nhap Phep Lai : ');
    writeln;
    writeln;
    write('   Gen 1 : ');
    readln(s[1]);
    write('   Gen 2 : ');
    readln(s[2]);
    if (length(s[1]) = 0) or (length(s[1]) mod 2 = 1 ) or (upcase(s[1])<>upcase(s[2])) then
      begin
        writeln;
        writeln('Khong the xu li duoc ');
        textcolor(12);
        Write('Chuong trinh se tu dong thoat sau   ');
        for i:=5 downto 1 do
          begin
            randomize;
            textcolor(random(15+1));
            GotoXY(WhereX-1,wherey);
            write(i);
            delay(600);
          end;
        halt;
      end;
    writeln;
    textcolor(11);
    Write('Progressing');
    for i:=1 to 4 do
      begin
        write(' . .');
        delay(300);
      end;
    writeln('');
    textcolor(0);
    writeln;

  end;

procedure quick_sort(l,r : longint);
var
    i , j : longint;
    key , temp : string;
  begin
    key:=ans[(l+r) div 2];
    i:=l; j:=r;
    repeat
      while ans[i]<key do inc(i);
      while ans[j]>key do dec(j);
      if i<=j then
        begin
          temp:=ans[i];
          ans[i]:=ans[j];
          ans[j]:=temp;
          inc(i);
          dec(j);
        end;
    until i>j;
    if i<r then quick_sort(i,r);
    if l<j then quick_sort(l,j);
  end;

procedure get_result;
var
    i : longint;
  begin
    inc(res);
    ans[res]:=str;
  end;

procedure qq(k : longint );
var
    i , j : longint;
  begin
    for i:=0 to 1 do
       begin
         str[k]:=s[1][k+i];
         for j:=0 to 1 do
           begin
              str[k+1]:=s[2][k+j];
              if (k=m-1) then get_result else qq(k+2);
           end;
       end;
  end;

procedure check_all;
var
    i , j : longint;
    ch : char;
  begin
    for i:=1 to res do
        for j:=1 to m div 2 do
            begin
              if ans[i][2*j]<ans[i][2*j-1] then
                begin
                    ch :=ans[i][2*j-1];
                    ans[i][2*j-1]:=ans[i][2*j];
                    ans[i][2*j]:=ch;
                end;
            end;
  end;

procedure process;
var
    i , j  : longint;
  begin
    res:=0;
    str := s[1];
    m := length(s[1]);
    qq(1);
    check_all;
    quick_sort(1,res);
  end;

procedure print_result;
var
    k , i , j : longint;
  begin
    write('    ');
    textbackground(5);
    write('P  : ',s[1],' x ',s[2]);
    textbackground(0);   write(' '); writeln();
    textcolor(15);
    write('    F1 : ');
    k:=1;
    for i:=1 to res do
      begin
        if ans[i]=ans[i+1] then inc(k)
        else
          begin
            textcolor(4);
            if trunc(k/res*100)<>k/res*100 then
              begin
                if trunc(k/res*100*2)=k/res*100*2 then
                   write(k/res*100:0:1,'%')
                else
                   write(k/res*100:0:2,'%');
              end
            else
                write(k/res*100:0:0,'%');
            textcolor(15);
            write(ans[i],' ');
            k:=1;
          end;
      end;
    writeln;
    writeln;
  end;

begin
    X:='P';
    REPEAT
    if (x = 'Y') or (x = 'y') then
      begin
        clrscr;
        writeln();
        textcolor(12);
        Write('       He thong dang lam moi ');
        for u:=1 to 3 do
          begin
            write(' . ');
            delay(500);
          end;
      end;
    clrscr;
    textcolor(15);
    enter;
    process;
    print_result;
    write('Ban co muon thu lai ?  ( Y / N )    ');
    readln(x);
    UNTIL (X <> 'Y') and (X <> 'y');
end.
