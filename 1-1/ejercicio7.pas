{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
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
	codigo: Integer;
	preA,preN: Real;
begin

	repeat
		writeln('######################');
		writeln('Ingrese el CODIGO');
		readln(codigo);
		writeln('Ingrese el precio ACTUAL');
		readln(preA);
		writeln('Ingrese el precio NUEVO');
		readln(preN);
	
		if (preA * 1.1 < preN)  then 
			writeln('El aumento de precio del producto ', codigo, ' es superior al 10%')
		else
			writeln('El aumento del precio del producto ', codigo, ' no supera el 10%');
	until codigo = 32767;
	readln();
end.
