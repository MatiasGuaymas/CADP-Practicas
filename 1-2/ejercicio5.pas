{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}

program ejercicio5;
var 
    num, max, min, suma: integer;
begin
    suma:= 0;
    max:= -9999;
    min:= 9999;
repeat
    writeln('Ingrese un numero entero: ');
    readln(num);
    if num >= max then
        max:= num;
    if num <= min then
        min:= num;   
    suma:= num + suma;
until num = 100;
    writeln('La suma de los numeros leidos es: ', suma);
	writeln('El numero maximo leido es: ', max);
	writeln('El numero minimo leido es: ', min);
	readln();
end.