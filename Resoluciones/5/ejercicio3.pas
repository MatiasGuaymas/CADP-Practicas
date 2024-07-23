{3) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
program punteros;
type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;
var
    n: puntero_numeros;
    num: numeros;
    i:integer;
begin
    writeln(sizeof(n), ' bytes');
    writeln(sizeof(num), ' bytes');
    new(n);
    writeln(sizeof(n^), ' bytes');
    for i:= 1 to 5000 do
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes');
end.}

program ejercicio3;
type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;
var
    n: puntero_numeros;
    num: numeros;
    i:integer;
begin
    writeln(sizeof(n), ' bytes'); //4 bytes
    writeln(sizeof(num), ' bytes'); //DIMF * TIPO DE DATO = 10000 * 2 = 20000 bytes
    new(n);
    writeln(sizeof(n^), ' bytes'); //20000 bytes
    for i:= 1 to 5000 do
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes'); //20000 bytes
end.