{4) b) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes');
    writeln(pc^);
    dispose(pc);
    pc^:= 'otro nuevo nombre';
end.}

program ejercicio4B;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'un nuevo nombre';
    writeln(sizeof(pc^), ' bytes'); //51 bytes
    writeln(pc^); //un nuevo nombre
    dispose(pc);
    pc^:= 'otro nuevo nombre'; //Esta linea da error, ya que se libero la posicion de memoria apuntada por pc, al haber hecho en la linea anterior el dispose de este, no pudiendo acceder a esta direccion
end.