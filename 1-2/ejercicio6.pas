{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program ejercicio6;
type
    codigo200 = 1..200;
var
    codigo: codigo200;
    precio, min1, min2: real;
    i, prod16PesosPar, codmin1, codmin2: integer;
begin
    prod16PesosPar:= 0;
    codmin1:= 0;
    codmin2:= 0;
    min1:= 9999;
    min2:= 9999;
    for i:= 1 to 3 do
        begin
            writeln('Ingrese el codigo del producto: ');
            readln(codigo);
            writeln('Ingrese el precio del producto: ');
            readln(precio);
            if precio <= min1 then
            begin
                min2:= min1;
                codmin2:= codmin1;
                min1:= precio;
                codmin1:= codigo;
            end
            else if precio <= min2 then
                min2:= precio;
                codmin2:= codigo;
            if(precio > 16) and ((codigo MOD 2) = 0) then
                prod16PesosPar:= prod16PesosPar + 1;
        end;
    writeln('Los codigos de los productos mas baratos son: ', min1:0:2, ' con codigo ', codmin1, ' y ', min2:0:2, ' con codigo ', codmin2);
    write('La cantidad de productos de mas de 16 pesos con codigo par son: ', prod16PesosPar);
end.
