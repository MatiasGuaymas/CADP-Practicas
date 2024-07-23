{1. Implemente un programa que lea por teclado dos números enteros e imprima en pantalla los
valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe mostrar el
mensaje: Se ingresaron los valores 8 y 4}

program ejercicio1;
procedure intercambiar(var n1, n2: integer);
var
    aux: integer;
begin
    aux:= n1;
    n1:= n2;
    n2:= aux;
end;
var
    num1, num2: integer;
begin
    writeln('Ingrese un primer numero');
    readln(num1);
    writeln('Ingrese un segundo numero');
    readln(num2);
    writeln('Primer numero: ', num1, ' Segundo numero: ', num2);
    intercambiar(num1, num2);
    writeln('Primer numero: ', num1, ' Segundo numero: ', num2);
end.