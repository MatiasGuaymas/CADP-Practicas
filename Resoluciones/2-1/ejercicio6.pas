{6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}

program ejercicio6;
procedure leerNumeros;
var
    num, numParMax: integer;
begin
    writeln('Ingrese un numero entero');
    readln(num);
    numParMax:= -9999;
    while(num > 0) do
        begin
            if ((num mod 2) = 0) and (num > numParMax) then
                numParMax:= num;
            writeln('Ingrese un numero entero');
            readln(num);
        end;
    writeln('El numero par mas alto fue: ', numParMax);
end;
begin
    leerNumeros;
end.