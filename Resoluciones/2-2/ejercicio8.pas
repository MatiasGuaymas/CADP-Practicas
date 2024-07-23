{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program ejercicio8;
procedure leerNumero(var num: integer);
begin
    writeln('Ingrese un numero');
    readln(num);
end;
procedure evaluarNum(num: integer; var suma, impares: integer);
var
    dig: integer;
begin
    while(num <> 0) do
        begin
            dig:= num mod 10;
            if(dig mod 2 = 0) then
                suma:= suma + dig
            else
                impares:= impares + 1;
            num:= num div 10;
        end;
end;
procedure verificarNumeros;
var
    num, suma, impares: integer;
begin
    leerNumero(num);
    while(num <> 123456) do //Se excedee del numero maximo de Pascal
        begin
            suma:= 0;
            impares:= 0;
            evaluarNum(num, suma, impares);
            writeln('SumaDigPares=', suma, ' CantDigImpares=', impares);
            leerNumero(num);
        end;
end;
begin
    verificarNumeros;
end.