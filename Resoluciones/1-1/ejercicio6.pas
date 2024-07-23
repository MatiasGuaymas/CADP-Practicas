{6. Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}

program ejercicio6;
var
    legajo, cantTotal, cantMayorProm, cantDestacados: integer;
    prom: real;
begin
    writeln('Ingrese un numero de legajo');
    readln(legajo);
    cantTotal:=0;
    cantMayorProm:=0;
    cantDestacados:= 0;
    while(legajo <> -1) do
        begin
            writeln('Ingrese un promedio');
            readln(prom);
            cantTotal:= cantTotal+1;
            if(prom > 6.5) then
                cantMayorProm:= cantMayorProm + 1;
            if(prom > 8.5) and (legajo < 2500) then
                cantDestacados:= cantDestacados + 1;
            writeln('Ingrese un numero de legajo');
            readln(legajo);
        end;
    writeln('La cantidad de alumnos leidas es: ', cantTotal);
    writeln('La cantidad de alumnos cuyo promedio supera 6.5 es: ', cantMayorProm);
    writeln('El porcentaje de alumnos destacados cuyo legajo sea menor al valor 2500 es: ', ((cantDestacados/cantTotal)*100):0:2, '%');
end.