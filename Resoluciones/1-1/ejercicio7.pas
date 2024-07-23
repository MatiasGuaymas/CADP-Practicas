{7. Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”}

program ejercicio7;
var
    codigo: integer;
    precioAct, nuevoPrecio: real;
begin
    repeat
        begin
            writeln('Ingrese un codigo');
            readln(codigo);
            writeln('Ingrese el precio actual');
            readln(precioAct);
            writeln('Ingrese el precio nuevo');
            readln(nuevoPrecio);
            if(precioAct*1.10 < nuevoPrecio) then
                writeln('El nuevo precio del producto supera en un 10% al precio anterior')
            else
                writeln('El nuevo precio del producto no supera en un 10% al precio anterior');
        end;
    until (codigo = 32767);
end.