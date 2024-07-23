{4) c) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.
program punteros;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
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

program ejercicio4C;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
procedure cambiarTexto(pun: puntero_cadena);
begin
    pun^:= 'Otro texto';
end;
var
    pc: puntero_cadena;
begin
    new(pc);
    pc^:= 'Un texto';
    writeln(pc^); //Un texto
    cambiarTexto(pc);
    writeln(pc^); //Otro texto. Al ser punteros, el contenido apuntado siempre se ve modificado a pesar de que el parametro haya sido pasado por valor. La copia apunta a la misma direccion de memoria
end.