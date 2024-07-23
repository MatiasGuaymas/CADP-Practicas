{6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program ejercicio6;
procedure leerUnProducto(var precio: real; var codigo: integer; var tipo: string);
begin
    writeln('Ingrese un precio de producto');
    readln(precio);
    writeln('Ingrese un codigo de producto');
    readln(codigo);
    writeln('Ingrese un tipo de producto');
    readln(tipo);
end;
procedure minimos(precio: real; codigo: integer; var codMin1, codMin2: integer; var min1, min2: real);
begin
    if(precio <= min1) then
        begin
            min2:= min1;
            min1:= precio;
            codMin2:= codMin1;
            codMin1:= codigo;
        end
    else    
        if(precio <= min2) then
            begin
                min2:= precio;
                codMin2:= codigo;
            end;
end;
procedure maximo(precio: real; codigo: integer; tipo: string; var max: real; var codMax: integer);
begin
    if(tipo = 'pantalon') and (precio >= max) then
        begin
            max:= precio;
            codMax:= codigo;
        end;
end;
procedure leerProductos;
var
    i, codigo, codMin1, codMin2, codMax: integer;
    tipo: string;
    precio, min1, min2, max, total: real;
begin
    codMin1:= 0;
    codMin2:= 0;
    min1:= 9999;
    min2:= 9999;
    max:= -1;
    for i:= 1 to 100 do
        begin
            leerUnProducto(precio, codigo, tipo);
            minimos(precio, codigo, codMin1, codMin2, min1, min2);
            maximo(precio, codigo, tipo, max, codMax);
            total:= total + precio;
        end;
    writeln('Los codigos de los dos productos mas baratos son: ', codMin1, ' y ' codMin2);
    writeln('El codigo del producto de tipo pantalon mas caro es: ', codMax);
    writeln('El precio promedio es: ', (total/100):0:2);
end;
begin
    leerProductos();
end.