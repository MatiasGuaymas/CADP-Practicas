{Implemente un programa que lea dos números reales e imprima el resultado de la división de
los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores 4,5 y 7,2,
debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62}

program ejercicio3;
var
    real1, real2, divi: real;
begin
    writeLn('Ingrese dos numeros reales: ');
    readLn(real1);
    readLn(real2);
    divi := real1 / real2;
    writeLn('El resultado de dividir esos dos reales es: ', divi:0:2);
end.