{. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}
program ejercicio11;
function verChar (letra: char; var cantA:integer): boolean;
begin
	verChar:= letra = '$';
	cantA:= cantA +1;
end;
function contarArroba (letra: char): integer;
begin
	if (letra = '@') then
		contarArroba:= contarArroba+1;
end;
var
	letra: char;
	partA, partB: boolean;
	cantChars, cant, cantArro: integer;
Begin
	partA:= false;
	partB:= false;
	cantArro:= 0;
	cant:= 0;
	cantChars:= 0;
	write('Ingresar un caracter: ');
	readln(letra);
	while(letra <> '%')do begin
		partA:= verChar(letra, cantChars);
		write('Ingresar un caracter: ');
		readln(letra);
	end;
	if (cantChars <> 0) then begin		// SI NO HUBO NINGUN DIGITO EN LA PRIMER SECUENCIA DEBERIA CORTAR AL INSTANTE
		write('Ingresar un caracter: ');
		readln(letra);
		cant:= cant+1;
		end
		else writeln('La parte B de la secuencia no se cumple al no tener al menos 3 arrobas.');
	while (letra <> '*') and (cant <> cantChars)AND (cantChars <> 0) do begin
		cantArro:= contarArroba(letra);
		cant:= cant+1;
		write('Ingresar caracter: ');
		readln(letra);
	end;
	if (cant <> cantChars) OR (cantArro <> 3) then		// VERIFICO SI HAY 3 arrobas en la secuencia y si hay la misma cantidad de digitos que en la parte A
		partB:= false;
	if (partA = true)then
		writeln('En la parte A de la secuencia no se cumplio la condicion.');
	if (partB = true)then
		writeln('En la parte B de la secuencia no se cumplio las condiciones.');
end.