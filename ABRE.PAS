{ | procedure ABRE;                       Global |
  | Version: 1                  Creado: 25/11/87 |
  |                         Ultima mod.:25/11/87 |
  |                                              |
  | Forma el nombre del fuente y setea los swicht|
  |                                              | }
procedure abre;
var
  parn: byte;
  pars: string[2];
  opcion: boolean;
begin
  objeto_b := true;
  if paramcount = 0
    then begin
           writeln(#10,'No especifico fuente ..');
           halt
         end;
  fuente_typ := '.705';
  if pos('.',paramstr(1)) = 0
    then fuente_nom := paramstr(1)
    else begin
           fuente_nom := copy(paramstr(1),1,pos('.',paramstr(1))-1);
           fuente_typ := copy(paramstr(1),pos('.',paramstr(1)),4);
         end;
  assign(fuente,fuente_nom+fuente_typ);
  for parn := 2 to paramcount               { se ejecuta solo si es >= 2 }
    do begin
         pars := paramstr(parn);
         if pars[1] = '+' then opcion := true
                          else opcion := false;
         case pars[2] of
           'o': objeto_b := opcion;
         end;{case}
       end;{for}
end;