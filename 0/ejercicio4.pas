{Implemente un programa que lea el diámetro D de un círculo e imprima:
a. El radio (R) del círculo (la mitad del diámetro).
b. El área del círculo. Para calcular el área de un círculo debe utilizar la fórmula PI x R
2
c. El perímetro del círculo. Para calcular el perímetro del círculo debe utilizar la fórmula
D*PI (o también PI*R*2).}

program ejercicio4;
const
    pi= 3.14;
var
    radio, diametro, area, perimetro: real;
begin
    writeLn('Ingrese el diametro');
    readLn(diametro);
    radio:= diametro / 2;
    area:= pi * (radio * radio);
    perimetro:= diametro * pi;
    writeLn('El radio es: ', radio:0:2);
    writeLn('El area es: ', area:0:2);
    writeLn('El perimetro es: ', perimetro:0:2);
end.