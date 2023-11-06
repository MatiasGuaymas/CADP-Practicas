{Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}
program ejercicio10;
function esVocal (letra: char): boolean;
begin
	esVocal:= (letra = 'A') OR (letra = 'a') OR (letra ='e') OR (letra= 'E') OR (letra = 'i') OR (letra = 'I') OR (letra = 'u') OR (letra = 'U') OR (letra = 'O') or (letra = 'o');
end;
var
	ok, partA, partB: boolean;
	letra: char;
Begin
	partA:= false;
	partB:= false;
	write('Ingresar una letra: ');
	readln(letra);
	ok:= esVocal(letra);
	while (letra <> '$') do begin		// Ingreso secuencia de caracteres para la parte A
		if (ok <> false)then
			partA:= true;
		write('Ingresar una letra: ');
		readln(letra);
		ok:= esVocal(letra);
	end;
	write('Ingresar una letra: ');
	readln(letra);
	ok:= esVocal(letra);
	while(letra <> '#')do begin			// Ingreso secuencia de caracteres para la parte B
		if (ok <> true)then
			partB:= true;
		write('Ingresar una letra: ');
		readln(letra);
		ok:= esVocal(letra);
	end;
	if (partA = true)then
		writeln('La secuencia de la parte A no se cumplio.');
	if (partB = true) then
		writeln('La secuencia de la parte B no se cumplio.');
end.