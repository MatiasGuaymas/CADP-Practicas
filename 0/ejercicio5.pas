{Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo cantidades
iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X), la
cantidad de clientes (Y), e imprima en pantalla un mensaje informando la cantidad de
caramelos que le corresponderá a cada cliente, y la cantidad de caramelos que se
quedará para sí mismo.
b. Imprima en pantalla el dinero que deberá cobrar el kiosquero si cada caramelo tiene un
valor de $1.60.}

program ejercicio5;
const precio = 1.6;
var caramelos, clientes : integer;
BEGIN
    writeln('Ingrese la cantidad de caramelos'); read(caramelos);
    writeln('Ingrese la cantidad de clientes'); read(clientes);
    writeln('Caramelos por cliente: ', caramelos DIV clientes);
    writeln('Caramelos para si mismo: ', caramelos MOD clientes);
    writeln('Dinero que debera cobrar: ', (caramelos - caramelos MOD clientes) * precio:0:2);
END.
