{ | funcion OFFSET                        Global |
  | Version: 1              Ultima mod.:17/11/87 |
  |                                              |
  | Calcula el offset entre origen y destino,    |
  | si todo Ok retorna true y el valor en la     |
  | variable global offset_dat, caso contrario   |
  | retorna false.                               |
  |                                              | }

function offset(origen: code_val;destino: code_val):boolean;
var
  resta : integer;
begin
  offset := true;
  resta  := destino-origen-1;
  case resta of
    -128..127: offset_dat := lo(resta);
         else  offset     := false;
  end;{case}
end;