{c+}
procedure wait;
begin
 while port[$30]>127 do writeln('w');
end ;
var
  a   : char;
begin
  port[$30]:= $3C;
  wait;
  port[$30]:= $0f;
  wait;
  while true do
  begin
    read(kbd,a);
    wait;
    case a of
      #01 : port[$30]:= $18;                                 { sh l }
      #03 : exit;                                            { ^C   }
      #08 : begin
              port[$30]:= $0c;
              wait;
              port[$30]:= $10;
              wait;
              port[$31]:= $20;
              wait;
              port[$30]:= $10;
              wait;
              port[$30]:= $0F;
            end;
      #11 : port[$30]:= 2;                                   { home }
      #12 : port[$30]:= 1;                                   { cls  }
      #13 : port[$30]:= (port[$30] and $C0) or $80;          { enter}
      #19 : port[$30]:= $1C;                                 { sh r }

      #28 : port[$30]:= $14;                                 { cr }
      #29 : port[$30]:= $10;                                 { cl }
      #30 : port[$30]:= ((port[$30] and $7F)-64) or $80;     { cu }
      #31 : port[$30]:= ((port[$30] and $7F)+64) or $80;     { cd }

      else port[$31]:= ord(a);
    end;{case}
  end;
end.