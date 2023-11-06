{Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program ejercicio8;
procedure evaluarNum (num: integer; var cantDigImp, suma: integer);
var
	dig: integer;
begin
	while (num<> 0) do begin
		dig:= num MOD 10;
		if (dig MOD 2= 0) then
			suma:= suma+dig
		else
			cantDigImp:= cantDigImp+1;
		num:= num DIV 10;
	end;
	writeln('La cantidad de digitos impares del numero es: ',cantDigImp);
	writeln('La suma de sus digitos pares es: ',suma);
end;
var
	num, cantDigImp, suma: integer;
Begin
	write('Ingresar un numero: ');
	readln(num);
	while (num <> 123456) do begin	{Pascal tira error al usar '123456' porque se va de rango de enteros, si usas un numero mas pequeño anda todo}
		cantDigImp:= 0;
		suma:= 0;
		evaluarNum(num, cantDigImp, suma);
		write('Ingresar otro numero: ');
		readln(num);
	end;
end.