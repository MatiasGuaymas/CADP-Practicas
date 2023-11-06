{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).}

program ejercicio4;
var
    x, num: real;
begin
    writeln('Ingrese un numero real');
    readln(x);
    writeln('Ingrese un numero real');
    readln(num);
    while (num <> x*2) do
    begin
        writeln('Ingrese un numero real');
        readln(num);
    end;
end.