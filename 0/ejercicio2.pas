{Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional}

Program ejercicio2;
var
  num1, num2, suma: Integer;
begin
    WriteLn('Ingrese dos numeros enteros');
    ReadLn(num1);
    ReadLn(num2);
    suma:= num1 + num2;
    WriteLn('La suma entre los dos numeros enteros es de: ', suma);
    WriteLn('La suma entre los dos numeros enteros es de: ', num1 + num2);
end.