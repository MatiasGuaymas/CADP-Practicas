{10. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program ejercicio10;
function vocal (c:char) :boolean;
begin
	case c of
        'a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U':
            vocal:= true;
        else
            vocal:= false;
    end;
end;
procedure cumpleA (var cumple: boolean);
var
	secuA: char;
begin
	writeln('Ingrese la secuencia A: ');
	readln(secuA);
	while (secuA<>'$') and (cumple) do
		begin
			if (not vocal(secuA)) then
				cumple:=false
			else
				readln(secuA);
		end;
end;
procedure cumpleB (var cumple: boolean);
var
	secuB: char;
begin
	writeln('Ingrese la secuencia B: ');
	readln(secuB);
	while (secuB<>'#') and (cumple) do
	    begin
			if (vocal(secuB)) then
				cumple:=false
			else
				readln(secuB);
		end;
end;
var
	cumple: boolean;
begin
	cumple:= true;
	cumpleA(cumple);
	if (cumple) then
        begin
            cumpleB(cumple);
            if (cumple) then
                writeln ('Se cumplieron los patrones.')
            else
                writeln ('No se cumplio el patron B.');
		end
	else
		writeln('No se cumplio el patron A.');
end.