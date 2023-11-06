{a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program ejercicio7;
procedure evaluarNum (num: integer; var cantDig, suma: integer);
var
	dig: integer;
begin
	while (num<> 0) do begin
		cantDig:= cantDig+1;
		dig:= num MOD 10;
		num:= num DIV 10;
		suma:= suma+dig;
	end;
	writeln('La cantidad de digitos del numero es: ',cantDig);
	writeln('La suma de sus digitos es: ',suma);
end;
var
	num, cantDig, suma: integer;
Begin
	repeat
		cantDig:= 0;
		suma:= 0;
		write('Ingresar un numero a evaluar: ');
		readln(num);
		evaluarNum(num, cantDig,suma);
	until (suma = 10);		// INCISO B, se repite el ingreso de numeros hasta que uno sume 10 exactos
end.