{ | procedure CHECKIO;                    Global |
  | Version: 1                  Creado: 25/11/87 |
  |                         Ultima mod.:25/11/87 |
  |                                              |
  | Realiza el analisis de las operaciones de I/O|
  |                                              | }

procedure checkio;
var
  error : byte;
begin
  error := ioresult;
  case error of
      0: exit;
      1:writeln(fuente_nom+fuente_typ,' No existe ..');
     22:writeln('Fuente = archivo logico ..');
    $F0:writeln('Error de disco ..');
    $F1:writeln('Directorio completo ..');
   else writeln('Error del PASCAL #',error);
  end;{case}
  halt;
end;


