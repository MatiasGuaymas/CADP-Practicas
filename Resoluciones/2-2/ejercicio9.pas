{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program ejercicio9;
procedure leerAlumno(var num: integer; var ap, nom: string);
begin
    writeln('Ingrese el numero de inscripcion del alumno');
    readln(num);
    writeln('Ingrese el apellido del alumno');
    readln(ap);
    writeln('Ingrese el nombre del alumno');
    readln(nom);
end;
procedure min(num: integer; ap: string; var apMin1, apMin2: string; var min1, min2: integer);
begin
    if(num <= min1) then
        begin
            min2:= min1;
            min1:= num;
            apMin2:= apMin1;
            apMin1:= ap;
        end
    else
        if(num <= min2) then
            begin
                min2:= num;
                apMin2:= ap;
            end;
end;
procedure max(num: integer; nom: string; var nomMax1, nomMax2: string; var max1, max2: integer);
begin
    if(num >= max1) then
        begin
            max2:= max1;
            max1:= num;
            nomMax2:= nomMax1;
            nomMax1:= nom;
        end
    else
        if(num >= max2) then
            begin
                max2:= num;
                nomMax2:= nom;
            end;
end;
procedure leerTodosAlumnos;
var
    ap, nom, apMin1, apMin2, nomMax1, nomMax2: string;
    num, cantPares, min1, min2, max1, max2, cant: integer;
begin
    min1:= 9999;
    min2:= 9999;
    max1:= -1;
    max2:= -1;
    cant:= 0;
    cantPares:= 0;
    repeat
        leerAlumno(num, ap, nom);
        min(num, ap, apMin1, apMin2, min1, min2);
        max(num, nom, nomMax1, nomMax2, max1, max2);
        cant:= cant + 1;
        if(num mod 2 = 0) then
            cantPares:= cantPares + 1;
    until num = 1200;
    writeln('Los apellidos de los dos alumnos con numero de inscripcion mas chico son: ', apMin1, ' y ', apMin2);
    writeln('Los nombres de los dos alumnos con numero de inscripcion mas grande son: ', nomMax1, ' y ', nomMax2);
    writeln('El porcentaje de alumnos con nro de inscripcion par es: ', ((cantPares/cant)*100):0:2, '%');
end;
begin
    leerTodosAlumnos;
end.