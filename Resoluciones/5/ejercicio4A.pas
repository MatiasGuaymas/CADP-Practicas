{4) a) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    pc^:= 'un nuevo texto';
    new(pc);
    writeln(pc^);
end.}

program ejercicio4A;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    pc^:= 'un nuevo texto';
    new(pc);
    writeln(pc^); //pc no está apuntando a ninguna dirección de memoria válida, ya que no se ha asignado ningun new, dando error cuando se accede al puntero para asignarle un string
end.