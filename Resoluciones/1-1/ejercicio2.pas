{2. Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program ejercicio2;
var
    num1: real;
begin
    writeln('Ingrese un numero real');
    readln(num1);
    if(num1 < 0) then
        writeln('El valor absoluto de ', num1:0:2, ' es: ', (-1*num1):0:2)
    else
        writeln('El valor absoluto de ', num1:0:2, ' es: ', num1:0:2);
end.