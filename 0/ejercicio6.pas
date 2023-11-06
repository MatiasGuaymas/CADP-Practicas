{Realice un programa que informe el valor total en pesos de una transacción en dólares. Para
ello, el programa debe leer el monto total en dólares de la transacción, el valor del dólar al día
de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la transacción. Por
ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor 189,32 pesos y el
banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 1968,93 pesos argentinos
(resultado de multiplicar 10*189,32 y adicionarle el 4%)}

program ejercicio6;
var
    montoTotal, valorDolar, comision, transaccion: real;
begin
    writeLn('Ingrese el monto total en dolares para la transaccion: ');
    readLn(montoTotal);
    writeLn('Ingrese el valor del dolar al dia de la fecha: ');
    readLn(valorDolar);
    writeLn('Ingrese el porcentaje (en pesos) de la comision que cobra el banco por la transaccion: ');
    readLn(comision);
    transaccion:= (montoTotal *  valorDolar) + (montoTotal *  valorDolar * comision) / 100;
    writeLn(transaccion:0:2);
end.