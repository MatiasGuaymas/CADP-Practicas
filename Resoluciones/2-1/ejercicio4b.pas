program alcance4b;
procedure uno;
begin
    a := 1;
    writeln(a); //No imprime nada, a no esta definida
end;
var 
    a,b: integer;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a); //Imprime 2 1 : variables locales
end.