{5. Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.}

program ejercicio5;
var
    x, y, cant: integer;
    precio: real;
begin
    writeln('Ingrese la cantidad de caramelos');
    readln(x);
    writeln('Ingrese la cantidad de clientes');
    readln(y);
    cant:= x div y;
    precio:= cant * y * 1.60;
    writeln('La cantidad de caramelos que le correspondera a cada clientes es: ', cant);
    writeln('La cantidad de caramelos que se quedara el kiosquero para si mismo es: ', x mod y);
    writeln('El kiosquero cobrara un total de: ', precio:0:2);
end.