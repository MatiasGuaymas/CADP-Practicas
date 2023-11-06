//Indica rque imprime

program ej2;
type
    cadena = string[9];
    producto = record
        codigo: integer;
        descripcion: cadena;
        precio: real;
    end;
    puntero_producto = ^producto;   //Puntero a registro producto
var
    p: puntero_producto;
    prod: producto;
begin
    writeln(SizeOf(prod));
    writeln(sizeof(p), ' bytes');   //Imprime 4 bytes (espacio de puntero en memoria estática)
    writeln(sizeof(prod), ' bytes');//Imprime 16 bytes (2 entero + 4 real + 10 cadena, suma de los campos)
    new(p);
    writeln(sizeof(p), ' bytes');   //Imprime 4 bytes, pues el espacio reservado es el mismo
    p^.codigo := 1;
    p^.descripcion := 'nuevo producto';
    writeln(sizeof(p^), ' bytes');  //Imprime 16 bytes, pues el puntero apunta al registro
    p^.precio := 200;
    writeln(sizeof(p^), ' bytes');  //Imprime 16 bytes. No importa si se le asigna valor a un campo del registro, el espacio reservado es el mismo
    prod.codigo := 2;
    prod.descripcion := 'otro nuevo producto';
    writeln(sizeof(prod), ' bytes');//Imprime 16 bytes

    //La cantidad impresa en el registro puede variar según el compilador o computadora, pero conceptualmente es la suma de sus campos
end.