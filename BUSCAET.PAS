{ | funcion BUSCAET                       Global |
  | Version: 1              Ultima mod.:19/11/87 |
  |                                              |
  | Busca un label (nombre), si existe actualiza |
  | retorna true y actualiza e_punt, sino        |
  | retorna false.                               |
  | Se agrego la verificacion de .sta            |
  |                                              | }

function buscaet(nombre: etiq_nom;verif: boolean):boolean;
begin
  e_punt  := e_base;
  buscaet := true;
  while e_punt <> NIL do
  begin
    if e_punt^.nom = nombre
      then begin
             if verif then buscaet := e_punt^.sta;
             exit;
           end;
    e_last := e_punt;                  {>> Este := actualiza para CREAET }
    e_punt := e_punt^.prx;
  end;
  buscaet := false;
end;