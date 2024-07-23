{4) d) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio. 
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun);
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^);
    cambiarTexto(pc);
    writeln(pc^);
end.}

program ejercicio4D;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    new(pun);
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^); //Un texto
    cambiarTexto(pc);
    writeln(pc^); //Un texto. Ahora el contenido no se vio modificado, ya que dentro del procedimiento se hizo un new, por ende la copia de la variable apunta a otra direccion de memoria distinta a donde apuntaba originalmente, no modificando la del programa principal. Una vez vuelve, la copia se destruye.
end.