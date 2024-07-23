{Actividad 3: Ventas de tanques de agua
Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos}

program ejercicio3;
var
    tipo: char;
    ancho, largo, alto, radio, volumen, recTotal, circTotal, max1, max2: real;
    rec, cir, menor140, menor800: integer;
begin
    writeln('Ingrese el tipo de tanque');
    readln(tipo);
    rec:= 0;
    cir:= 0;
    recTotal:= 0;
    circTotal:= 0;
    menor140:= 0;
    menor800:= 0;
    max1:= -1;
    max2:= -1;
    while(tipo <> 'Z') do
        begin
            if(tipo = 'R') then
                begin
                    writeln('Ingrese el ancho del tanque rectangular');
                    readln(ancho);
                    writeln('Ingrese el largo del tanque rectangular');
                    readln(largo);
                    writeln('Ingrese el alto del tanque rectangular');
                    readln(alto);
                    volumen:= ancho * largo * alto;
                    rec:= rec + 1;
                    recTotal:= recTotal + volumen;
                end
            else
                begin
                    writeln('Ingrese el radio del tanque cilindrico');
                    readln(radio);
                    writeln('Ingrese el alto del tanque cilindrico');
                    readln(alto);
                    volumen:= 3.14 * (radio * radio) * alto;
                    cir:= cir + 1;
                    circTotal:= circTotal + volumen;
                end;
            if(alto < 1.40) then
                menor140:= menor140 + 1;
            if(volumen < 800) then
                menor800:= menor800 + 1;
            if(volumen > max1) then
                begin
                    max2:= max1;
                    max1:= volumen;
                end
            else
                if(volumen > max2) then
                    max2:= volumen;
            writeln('Ingrese el tipo de tanque');
            readln(tipo);
        end;
    writeln('Los volumenes de los dos mayores tanques vendidos son: ', max1:0:2, ' y ', max2:0:2);
    writeln('El volumen promedio de todos los tanques cilindricos es: ', (circTotal/cir):0:2);
    writeln('El volumen promedio de todos los tanques rectangulares vendidos es: ', (recTotal/rec):0:2);
    writeln('La cantidad de tanques cuyo alto sea menor a 1.40 metros es: ', menor140);
    writeln('La cantidad de tanques cuyo volumen sea menor a 800 metros cubicos es: ', menor800);
end.