{Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8
Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)
Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)
Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al menos
el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se entrega
en tiempo y forma y con al menos el 40% de respuestas correctas}

program ejercicio2;
var
    legajo, nota, i, aprobadosTotal, cantAlumnos65, aluCero, aluRec, aluIng, max1, max2, max3, max4, legMax1, legMax2, legMax3, legMax4, notasTotal, cantCero, cantDiez, presentes, recursantes, ingresantes: integer;
    prom: real;
    condicion: char;
begin
    aprobadosTotal:= 0;
    cantAlumnos65:= 0;
    aluCero:= 0;
    aluRec:= 0;
    recursantes:= 0;
    aluIng:= 0;
    ingresantes:= 0;
    max1:= -1;
    max2:= -1;
    max3:= -1;
    max4:= -1;
    writeln('Ingrese el legajo del alumno');
    readln(legajo);
    while(legajo <> -1) do
        begin
            writeln('Ingrese la condicion del alumno');
            readln(condicion);
            notasTotal:= 0;
            cantCero:= 0;
            cantDiez:= 0;
            presentes:= 0;
            for i:= 1 to 5 do
                begin
                    writeln('Ingrese la nota de la autoevualuacion');
                    readln(nota);
                    notasTotal:= notasTotal + nota;
                    if(nota = 0) then
                        cantCero:= cantCero + 1
                    else
                        if(nota > 4) then
                            presentes:= presentes + 1;
                    if(nota = 10) then
                        cantDiez:= cantDiez + 1;
                end;
            if(cantDiez > max1) then
                begin
                    max2:= max1;
                    max1:= cantDiez;
                    legMax2:= legMax1;
                    legMax1:= legajo;
                end
            else
                if(cantDiez > max2) then
                    begin
                        max2:= cantDiez;
                        legMax2:= legajo;
                    end;
            if(cantCero > max3) then
                begin
                    max4:= max3;
                    max3:= cantCero;
                    legMax4:= legMax3;
                    legMax3:= legajo;
                end
            else
                if(cantCero > max4) then
                    begin
                        max4:= cantCero;
                        legMax4:= legajo;
                    end;
            prom:= notasTotal/5;
            if(presentes = 5) then
                aprobadosTotal:= aprobadosTotal + 1;
            if(prom > 6.5) then
                cantAlumnos65:= cantAlumnos65 + 1;
            if(cantCero >= 1) then
                aluCero:= aluCero + 1;
            if(condicion = 'R') then
                begin
                    aluRec:= aluRec + 1;
                    if(presentes >= 4) then
                        recursantes:= recursantes + 1;
                end
            else
                begin
                    aluIng:= aluIng + 1;
                    if(presentes >= 4) then
                        ingresantes:= ingresantes + 1;
                end;
            writeln('Ingrese el numero de legajo');
            readln(legajo);
        end;
    writeln('La cantidad de alumnos INGRESANTES en condiciones de rendir el parcial es: ', ingresantes, ' y el porcentaje sobre el total de alumnos INGRESANTES es: %', ((ingresantes/aluIng)*100):0:2);
    writeln('La cantidad de alumnos RECURSANTES en condiciones de rendir el parcial es: ', recursantes, ' y el porcentaje sobre el total de alumnos INGRESANTES es: %', ((recursantes/aluRec)*100):0:2);
    writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ', aprobadosTotal);
    writeln('La cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es: ', cantAlumnos65);
    writeln('La cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion es: ', aluCero);
    writeln('Los codigos de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) son: ', legMax2, ' y ', legMax1);
    writeln('Los codigos de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) son: ', legMax4, ' y ', legMax3);
end.