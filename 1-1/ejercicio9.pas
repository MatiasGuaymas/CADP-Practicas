{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

program ejercicio9;
var
	car: Char;
	numRamd, resultado: Integer;
begin

	resultado:=0;
	
	write('Ingrese un caracter: ');
	readln(car);

	if ((car = '+') or (car = '-')) then 
	begin
		write('ingrese un numero: ');
		readln(numRamd);

		while numRamd <> 0 do 		
		begin

			if car = '+' then 
			begin
				resultado:= resultado + numRamd;
			end
			else if car = '-' then 
			begin
				resultado:= resultado - numRamd;
			end;

			write('ingrese un numero: ');
			readln(numRamd);
		end;
		write('El resultado de la operacion es: ', resultado);
	end
	else
		writeln('El caracter que ingresos no es valido: ');
	readln();


end.