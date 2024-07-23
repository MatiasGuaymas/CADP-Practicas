{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program ejercicio1;
var
    i, cantNum5, num: integer;
begin
    cantNum5:= 0;
    for i:= 1 to 10 do
        begin
            writeln('Ingrese un numero entero');
            readln(num);
            if(num > 5) then
                cantNum5:= cantNum5 + 1;
        end;
    writeln('La cantidad de numeros mayores a 5 es: ', cantNum5);
end.