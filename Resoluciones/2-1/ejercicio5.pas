{5. Dado el siguiente programa, indicar cuál es el error.}

program alcance4;
function cuatro: integer;
begin
    cuatro:= 4;
end;
var a: integer;
begin
    cuatro;
    writeln(a); //El error es que a no tiene ningun contenido, la idea era guardar el valor de la funcion en a, por eso se deberia hacer: a:= cuatro;
    writeln(cuatro);
end.