{4. Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2).}

program ejercicio4;
const
    pi = 3.14;
var
    diametro, radio: real;
begin
    writeln('Ingrese el diametro del circulo');
    readln(diametro);
    radio:= diametro/2;
    writeln('El radio del circulo es: ', radio:0:2);
    writeln('El area del circulo es: ', (pi*(radio*radio)):0:2);
    writeln('El perimetro del circulo es: ', (pi*radio*2):0:2);
end.