{7. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program ejercicio7;
procedure cantDigitosSuma(num: integer; var cant, suma: integer);
var
    dig: integer;
begin
    while(num > 0) do
        begin
            cant:= cant + 1;
            dig:= num mod 10;
            suma:= suma + dig;
            num:= num div 10;
        end;
end;
var
    num, cant, suma: integer;
begin
    repeat
        writeln('Ingrese una secuencia de numeros');
        readln(num);
        cant:= 0;
        suma:= 0;
        cantDigitosSuma(num, cant, suma);
        writeln('La cantidad total de digitos leidos es: ', cant);
    until suma = 10;
end.