procedure disp;
var loop : integer;
begin
  writeln(#10);
  for loop := min[COD] to max[COD] do write(base(loop),'_',base(code_arr[loop]),#9);
end;