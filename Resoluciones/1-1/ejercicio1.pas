{1. Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”.}

program ejercicio1;
var
    num1, num2: integer;
begin
    writeln('Ingrese un primer numero');
    readln(num1);
    writeln('Ingrese un segundo numero');
    readln(num2);
    if(num1 > num2) then
        writeln(num1 ,' es mas grande que ', num2)
    else if (num2 > num1) then
        writeln(num2, ' es mas grande que ', num1)
    else
        writeln('Los numeros leidos son iguales');
end.