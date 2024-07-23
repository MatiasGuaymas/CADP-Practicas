{2) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.
program punteros;
type
    cadena = string[9];
    producto = record
        codigo: integer;
        descripcion: cadena;
        precio: real;
    end;
    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes');
    writeln(sizeof(prod), ' bytes');
    new(p);
    writeln(sizeof(p), ' bytes');
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');
end.}

program ejercicio2;
type
    cadena = string[9];
    producto = record
        codigo: integer;
        descripcion: cadena;
        precio: real;
    end;
    puntero_producto = ^producto;
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(sizeof(p), ' bytes'); //4 bytes
    writeln(sizeof(prod), ' bytes'); //24 bytes
    new(p);
    writeln(sizeof(p), ' bytes'); //4 bytes
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes'); //24 bytes
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes'); //24 bytes
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes'); //24 bytes
end.