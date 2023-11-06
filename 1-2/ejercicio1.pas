{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program ejercicio1;
var
    numero, i, suma, mayoresQue5: integer;
begin
    suma:= 0;
    for i:= 1 to 10 do
    begin
        write('Ingrese un numero ');
        readln(numero);
        if (numero > 5) then
            mayoresQue5:= mayoresQue5 + 1;
        suma:= suma + numero;
    end;
    write('El resultado de la suma es: ', suma);
    write(' ');
    write('La cantidad de numeros mayores a 5 es :' , mayoresQue5);
end.