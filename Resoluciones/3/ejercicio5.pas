{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program ejercicio5;
type
    auto = record
        marca: string;
        modelo: string;
        precio: real;
    end;
procedure leerAuto(var a: auto);
begin
    writeln('Ingrese la marca del auto');
    readln(a.marca);
    if(a.marca <> 'ZZZ') then
        begin
            writeln('Ingrese el modelo del auto');
            readln(a.modelo);
            writeln('Ingrese el precio del auto');
            readln(a.precio);
        end;
end;
procedure maximo(a: auto; var autoMax: auto);
begin
    if(a.precio >= autoMax.precio) then
        autoMax:= a;
end;
procedure concesionaria();
var
    a, autoMax: auto;
    cantAutos: integer;
    precioTotal: real;
    marcaActual: string;
begin
    leerAuto(a);
    autoMax.precio:= -1;
    while(a.marca <> 'ZZZ') do
        begin
            cantAutos:= 0;
            precioTotal:= 0;
            marcaActual:= a.marca;
            while(a.marca <> 'ZZZ') and (a.marca = marcaActual) do
                begin
                    cantAutos:= cantAutos + 1;
                    precioTotal:= precioTotal + a.precio;
                    maximo(a, autoMax);
                    leerAuto(a);
                end;
            writeln('El precio promedio de la marca ', marcaActual, ' es: ', (precioTotal/cantAutos):0:2, '$');
        end;
    writeln('El modelo del auto mas caro es: ', autoMax.modelo, ' y su marca es: ', autoMax.marca);
end;
begin
    concesionaria;
end.