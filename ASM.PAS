{ | programa ASM                Cuerpo principal |
  | Version: 2              Ultima mod.:19/11/87 |
  |                                              |
  | Contiene las declaraciones de las variables  |
  | y funciones globales la impresion del encabe_|
  | zamiento y la ejecucion de pasada_1 y 2.     |
  | Tambien Imprime los resultados del ensamblado|
  |                                              | }

{$R+}
program asembler_705;

{>>>> COMIENZO DEL AREA DE TIPOS DE ASM     <<<<}

type

{>> para el codigo objeto <<}

  addr_val = 0..$7FF;           {>> addres validos    <<}
  data_val = 0..$7F;            {>> area de ram e I/O <<}
  code_val = $80..$7FF;         {>> area de codigo    <<}
  sele_val = (DTA,COD);
  mode_arr = array[sele_val] of addr_val;
  mode_cnj = set of sele_val;

{>> para el manejo de datos }

  dato_set = (CHA,N08,E08,N11,E11,N16,E16,EID,ERR,OVF);

{>> Tipos para el manejo de las listas de etiquetas y argumentos <<}

  etiq_nom = string[7];
  etiq_ptr = ^etiq_rec;
  etiq_rec = record
               nom : etiq_nom;
               dat : integer;
               typ : dato_set;
               sta : boolean;
     {         lin : integer;          Revisar }
               prx : etiq_ptr;
             end;
  argu_typ = (A08,A11,A16,REL,BIT,LAB,PER);
  argu_ptr = ^argu_rec;
  argu_rec = record
               nom : etiq_nom;
               lin : integer;
               col : byte;
               prx : argu_ptr;
               case typ: argu_typ of
                 A08,A11,A16,REL,
                 BIT: (adr: code_val);
                 LAB: (pnt: etiq_ptr);
             end;{record}

{>> para funcion BASE <<}

  base_str = string[3];

const

  dire_top = $FF;
  addr_top = $7FF;

{>>>> COMIENZO DEL AREA DE VARIABLES DE ASM <<<<}

var

{>> Punteros para el manejo de las listas de etiquetas y argumentos <<}

  e_base : etiq_ptr;                       {>> BASE lista de etiquetas }
  e_punt : etiq_ptr;                       {>> Puntero de la lista     }
  e_last : etiq_ptr;                       {>> TOP dela lista          }
  d_punt : etiq_ptr;                       {>> Buffer para el EQU LAB  }

  a_base : argu_ptr;                       {>> BASE lista de argumentos}
  a_punt : argu_ptr;                       {>> Puntero de la lista     }
  a_last : argu_ptr;                       {>> TOP dela lista          }

{>> para el codigo objeto <<}

  code_arr   : array[addr_val] of byte;
  code_off   : integer;
  loc        : mode_arr;
  free       : mode_arr;
  usad       : mode_arr;
  min        : mode_arr;
  max        : mode_arr;
  full       : array[sele_val] of boolean;
  modo       : sele_val;
  offset_dat : addr_val;
  ram        : integer;

{>> para el manejo de archivos fuente <<}

  fuente     : text;
  fuente_nom : string[8];
  fuente_typ : string[4];
  fuente_end : boolean;
  linea_cnt  : integer;

{>> para el manejo de archivos objeto <<}

  objeto     : file;{ of byte;}
  objeto_b   : boolean;
{>> para el manejo de errores <<}

  error_war  : integer;
  error_fat  : integer;

{>>>> COMIENZO DEL AREA DE FUNCIONES Y PROCEDIMIENTOS DE ASM <<<<}

{$I checkio.pas }
{$I abre.pas }
{$I init.pas }
{$I buscaet.pas }
{$I base.pas }
{$I offset.pas }

{>> procedimiento PASADA_1 <<}
procedure pasada_1;

{$I declar.p1}
{$I creaar.p1}
{$I creaet.p1}
{$I buscanem.p1}
{$I anal3.p1}
{$I anadat2.p1}
{$I anaarg.p1}
{$I error.p1}
{$I check.p1}
{$I anaoff.p1}
{$I anabit.p1}
{$I anadir.p1}
{$I actual.p1}
{$I anarmb.p1}

begin
{$I p1.p1}
end;

{>> procedimiento PASADA_2 <<}

{$I pas2.p2}

{>>>> COMIENZO DEL AREA DE PROGRAMA DE ASM <<<<}

begin
  writeln(#10+'Motorola 68705 ASSEMBLER Ver 1.0');
  writeln(    '(c) Pablo Rodriguez. 25 nov 1987'+#10+#13);

  abre;
  inicializar;
  pasada_1;
  pasada_2;

  writeln(#10,'Errores ',error_fat+error_war:7,' (',error_fat:2,' Fatales)');
  writeln(#10,'Eprom   ',base(min[COD]),'-',base(max[COD]),' Total ',usad[COD]:6,' bytes');
  writeln(    'Ram     ',base(min[DTA]),'-',base(max[DTA]),  ' Total ',usad[DTA]:6,' bytes');
  writeln(    'Uso     ',RAM-MEMAVAIL:7,                     ' Free  ',memavail:6, ' bytes');
end.