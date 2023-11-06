{Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”
a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}

program ejercicio2;
const
	Df = 10;
var
	num, max, i, pos: Integer;	
begin
	max:= -1;

	for i := 1 to Df do 
	begin
		write('Ingrese un numero: ');
		readln(num);

		if num > max then 
		begin
			max:= num;
			pos:= i;
		end;
	end;
	writeln('El mayor numero leido fue el ', max, ' en la posicion: ', pos);
	readln();
end.