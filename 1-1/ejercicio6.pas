{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
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
menor al valor 2500 (en el ejemplo anterior se debería informar 0%)}

program ejercicio6;
var
    legajo,cantAlumnos,cantAlumnosDestacados:integer;
    promedio, porcentaje:real;
begin
    cantAlumnos:=0;
    cantAlumnosDestacados:=0;
    writeln('Ingrese el legajo del alumno');
    readln(legajo);
    while (legajo <> -1) do begin
        writeln('Ingrese el promedio del alumno');
        readln(promedio);
        cantAlumnos:=cantAlumnos+1;
        if (promedio > 6.5) then begin
            cantAlumnosDestacados:=cantAlumnosDestacados+1;
        end;
        if (promedio > 8.5) and (legajo < 2500) then begin
            porcentaje:=porcentaje+1;
        end;
        writeln('Ingrese el legajo del alumno');
        readln(legajo);
    end;
    porcentaje:=(porcentaje/cantAlumnos)*100;
    writeln('La cantidad de alumnos leida es: ',cantAlumnos);
    writeln('La cantidad de alumnos cuyo promedio supera 6.5 es: ',cantAlumnosDestacados);
    writeln('El porcentaje de alumnos destacados cuyo legajo es menor a 2500 es: ',porcentaje:2:2,'%');
end.