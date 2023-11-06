{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota.}

program ejercicio3;
type
	rangoNota = 1..10;
var
    cantAprobados, cantAlumCon7: integer;
    notaEpa: rangoNota;
    nombre: string;
begin   
    cantAprobados:= 0;
    cantAlumCon7:= 0;
    repeat
        begin
            writeLn('Ingrese el nombre del alumno');
            readLn(nombre);
            writeLn('Ingrese la nota obtenida en el modulo EPA: ');
            readLn(notaEpa);
            if(notaEpa >= 8) then
                cantAprobados := cantAprobados + 1
            else if(notaEpa = 7) then
                cantAlumCon7 := cantAlumCon7 + 1;
        end;
    until nombre = 'Zidane Zinedine';
    writeLn('La cantidad de alumnos aprobados con nota 8 o mayor son: ', cantAprobados, ' alumnos');
    writeLn('La cantidad de alumnos con nota 7 son: ', cantAlumCon7, ' alumnos');
end.