{ | funcion BASE                          Global |
  | Version: 2              Ultima mod.:18/11/87 |
  |                                              |
  | Convierte el dato entero tipo addr_val en un |
  | string de largo fijo [3] equivalente al hexa |
  | Si el entero esta fuera de rango retorna --- |
  | para OVF negativo y +++ para OVF positivo.   |
  |                                              | }

function base(dato: integer):base_str;
var
  nib : byte;
  buf : base_str;
function hexa(dato:byte):char;    {>> local de HEX <<}
begin
  case dato of
    0..9: hexa := chr($30+dato);
  $A..$F: hexa := chr($37+dato);
  end;{case}
end;
begin
  if dato < 0    then begin base := '---'; exit end;
  if dato > $7FF then begin base := '+++'; exit end;
  buf := '';
  for nib := 2 downto 0
    do buf := buf+hexa((dato shr (4*nib)) and $000F);
  base := buf;
end;