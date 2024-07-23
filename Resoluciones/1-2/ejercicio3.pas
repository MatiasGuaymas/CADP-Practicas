{3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota.}

program ejercicio3;
type
    subNota = 1..10;
var
    nombre: string;
    nota: subNota;
    cantAprobados, cantAlumnos7: integer;
begin
    cantAprobados:= 0;
    cantAlumnos7:= 0;
    repeat
        writeln('Ingrese un nombre de alumno');
        readln(nombre);
        writeln('Ingrese la nota obtenida en el modulo de EPA');
        readln(nota);
        if(nota >= 8) then
            cantAprobados:= cantAprobados + 1;
        if(nota = 7) then
            cantAlumnos7:= cantAlumnos7 + 1;
    until (nombre = 'Zidane Zinedine');
    writeln('La cantidad de alumnos aprobados es: ', cantAprobados);
    writeln('La cantidad de alumnos que obtuvieron un 7 como nota es: ', cantAlumnos7);
end.