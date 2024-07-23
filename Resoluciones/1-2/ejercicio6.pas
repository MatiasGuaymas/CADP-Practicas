{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program ejercicio6;
type
    subCode = 1..200;
var
    i, codigo: subCode;
    codMin1, codMin2, cant16Par: integer;
    precio, min1, min2: real;
begin
    codMin1:= 0;
    codMin2:= 0;
    min1:= 999;
    min2:= 999;
    cant16Par:= 0;
    for i:= 1 to 5 do
        begin
            writeln('Ingrese el codigo del producto');
            readln(codigo);
            writeln('Ingrese el precio del producto');
            readln(precio);
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
            if(precio > 16) and ((codigo mod 2) = 0) then
                cant16Par:= cant16Par + 1;
        end;
    writeln('Los codigos de los dos mas baratos son: ', codMin1, ' y ', codMin2);
    writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ', cant16Par);
end.