{11. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program ejercicio11;
procedure verificarPatronA(var cumple: boolean; var cant: integer);
var
    car: char;
begin
    writeln('Ingrese la secuencia A');
    readln(car);
    while(car <> '%') and (cumple) do
        begin
            if(car = '$') then
                cumple:= false
            else
                begin
                    cant:= cant + 1;
                    readln(car);
                end;
        end;
end;
procedure verificarPatronB(var cumple: boolean; cant: integer);
var
    car: char;
    aux, arroba: integer;
begin
    writeln('Ingrese la secuencia B');
    readln(car);
    aux:= 0;
    arroba:= 0;
    while(car <> '*') and (cumple) do
        begin
            aux:= aux + 1;
            if(car = '@') then
                arroba:= arroba + 1;
            readln(car);
        end;
    cumple:= (aux = cant) and (arroba <= 3);
end;
procedure verificarPatrones;
var
    cumple: boolean;
    cantA: integer;
begin
    cumple:= true;
    cantA:= 0;
    verificarPatronA(cumple, cantA);
    if(cumple) then
        begin
            verificarPatronB(cumple, cantA);
            if(cumple) then
                writeln('Se cumplieron todos los patrones')
            else
                writeln('No se cumplio el patron B');
        end
    else
        writeln('No se cumplio el patron A');
end;
begin
	verificarPatrones;
end.