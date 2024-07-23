{1. Dado el siguiente programa, indicar qué imprime} 

program alcance1;
var 
    a,b: integer;
procedure uno;
var 
    b: integer;
begin
    b := 3;
    writeln(b); //Imprime 3
end;
begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, ' ', a); //Imprime 2 1
end.