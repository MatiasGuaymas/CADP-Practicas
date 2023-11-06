{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program ejercicio2;
	var
		num1: Real;
begin
	writeln('Ingrese un numero real');
	readln(num1);
	if num1 < 0 then
	begin
		writeln('El valor absoluto es: ', -1*num1:2:0);
	end
	else
		writeln('El valor absoluto es: ', num1:2:0);
	readln;
end.

 