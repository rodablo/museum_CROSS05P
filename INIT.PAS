{ | procedure INICIALIZAR                 Global |
  | Version: 1                  Creado: 20/11/87 |
  |                        Ultima mod.: 20/11/87 |
  |                                              |
  | Inicializa el code_arr y la variable ram     |
  |                                              | }

procedure inicializar;
var
  loc  : addr_val;
  nom  : string[14];
begin
  e_base    := NIL;
  a_base    := NIL;
  error_war := 0;
  error_fat := 0;
  ram       := memavail;
  nom       := fuente_nom+fuente_typ;
  for loc := 0 to length(nom)-1        do code_arr[loc] := ord(nom[loc+1]);
  for loc := length(nom) to $7F        do code_arr[loc] := 32;
  for loc := $80  to addr_top          do code_arr[loc] := 0;
  for loc := $785 to $7F7              do code_arr[loc] := 32;
end;