{1. Dado el siguiente programa:
program Registros;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;
procedure leer(var alu : alumno);
begin
    writeln(‘Ingrese el código del alumno’);
    read(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln(‘Ingrese el nombre del alumno’); read(alu.nombre);
        writeln(‘Ingrese el promedio del alumno’); read(alu.promedio);
    end;
end;
// declaración de variables del programa principal 
var
a : alumno;
// cuerpo del programa principal 
begin
...
end.
a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.
b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio. }

program ejercicio1;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;
procedure leer(var alu : alumno);
begin
    writeln('Ingrese el codigo del alumno');
    readln(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno'); readln(alu.nombre);
        writeln('Ingrese el promedio del alumno'); readln(alu.promedio);
    end;
end;
procedure maximo(prom: real; var max: real; nombre: string; var maxNom: string);
begin
    if(prom > max) then
        begin
            max:= prom;
            maxNom:= nombre;
        end;
end;
procedure contarAlumnos(var cant: integer; var maxNom: string);
var
    a: alumno;
    max: real;
begin
    leer(a);
    max:= -1;
    while(a.codigo <> 0) do
        begin
            maximo(a.promedio, max, a.nombre, maxNom);
            cant:= cant + 1;
            leer(a);
        end;
end;
// declaración de variables del programa principal 
var
    a : alumno;
    cant: integer;
    maxNom: string[20];
// cuerpo del programa principal 
begin   
    cant:= 0;
    contarAlumnos(cant, maxNom);
    writeln('La cantidad de alumnos leidos es: ', cant);
    writeln('El nombre del alumno con mejor promedio es: ', maxNom);
end.