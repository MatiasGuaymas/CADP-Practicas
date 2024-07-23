{4. Dado los siguientes programas, explicar la diferencia.}

program alcance4a;
var 
    a, b: integer;
procedure uno;
begin
    a := 1;
    writeln(a); //Imprime 1
end;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, ' ', a); //Imprime 2 1 : variables globales
end.