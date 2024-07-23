{2. Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional}

program ejercicio2;
procedure intercambiar(var n1, n2, suma: integer);
var
    aux: integer;
begin
    suma:= n1 + n2;
    aux:= n1;
    n1:= n2;
    n2:= aux;
end;
var
    num1, num2, suma: integer;
begin
    suma:= 0;
    writeln('Ingrese un primer numero');
    readln(num1);
    writeln('Ingrese un segundo numero');
    readln(num2);
    writeln('Primer numero: ', num1, ' Segundo numero: ', num2);
    intercambiar(num1, num2, suma);
    writeln('Primer numero: ', num1, ' Segundo numero: ', num2);
    writeln('Suma total=', suma); //A
    writeln('Suma total=', num1+num2); //B
end.