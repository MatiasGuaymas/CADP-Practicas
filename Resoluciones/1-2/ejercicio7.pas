{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejercicio7;
var
    nombre, nombreMin1, nombreMin2, nombreMax1, nombreMax2: string;
    tiempo, min1, min2, max1, max2: real;
    i: integer;
begin
    min1:= 999;
    min2:= 999;
    max1:= -1;
    max2:= -1;
    for i:= 1 to 5 do
        begin
            writeln('Ingrese el nombre del piloto');
            readln(nombre);
            writeln('Ingrese el tiempo total que le tomo a ', nombre, ' terminar la carrera');
            readln(tiempo);
            if(tiempo <= min1) then
                begin
                    min2:= min1;
                    min1:= tiempo;
                    nombreMin2:= nombreMin1;
                    nombreMin1:= nombre;
                end
            else
                begin
                    if(tiempo <= min2) then
                        begin
                            min2:= tiempo;
                            nombreMin2:= nombre;
                        end;
                end;
            if(tiempo >= max1) then
                begin
                    max2:= max1;
                    max1:= tiempo;
                    nombreMax2:= nombreMax1;
                    nombreMax1:= nombre;
                end
            else
                begin
                    if(tiempo >= max2) then
                        begin
                            max2:= tiempo;
                            nombreMax2:= nombre;
                        end;
                end;
        end;
    writeln('Los nombres de los pilotos que finalizaron en los primeros dos puestos son: ', nombreMin1, ' y ', nombreMin2);
    writeln('Los nombres de los pilotos que finalizaron en los ultimos dos puestos son: ', nombreMax2, ' y ', nombreMax1);
end.