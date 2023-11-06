{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era, usando la estructura de control if. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}

program ejercicio8;
var
	car1,car2,car3: Char;
begin
	writeln('ingrese un caracter');
	readln(car1);
	writeln('ingrese un caracter');
	readln(car2);
	writeln('ingrese un caracter');
	readln(car3);

	if ((car1 = 'a') or (car1 = 'e') or (car1 = 'i') or (car1 = 'o') or (car1 = 'u'))
		and ((car2 = 'a') or (car2 = 'e') or (car2 = 'i') or (car2 = 'o') or (car2 = 'u'))
		and ((car3 = 'a') or (car3 = 'e') or (car3 = 'i') or (car3 = 'o') or (car3 = 'u')) then
	begin
		writeln('Los tres caracteres son vocales');
	end
	else
		if ((car1 = 'a') or (car1 = 'e') or (car1 = 'i') or (car1 = 'o') or (car1 = 'u'))
			or ((car2 = 'a') or (car2 = 'e') or (car2 = 'i') or (car2 = 'o') or (car2 = 'u'))
			or((car3 = 'a') or (car3 = 'e') or (car3 = 'i') or (car3 = 'o') or (car3 = 'u')) then
			begin
				writeln('al menos hay una vocal en los caracteres ingresados');
			end;
	readln();

end.