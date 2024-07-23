{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}

program ejercicio3;
const
    relacion = 23.435;
    //dim = 2400;
    dim = 4;
type
    establecimiento = record
        cue: integer;
        nombre: string;
        cantDocentes: integer;
        cantAlumnos: integer;
        localidad: string;
    end;
procedure leerEstablecimiento(var e: establecimiento);
begin
    writeln('Ingrese el CUE');
    readln(e.cue);
    writeln('Ingrese el nombre del establecimiento');
    readln(e.nombre);
    writeln('Ingrese la cantidad de docentes totales en el establecimiento');
    readln(e.cantDocentes);
    writeln('Ingrese la cantidad de alumnos totales en el establecimiento');
    readln(e.cantAlumnos);
    writeln('Ingrese la localidad del establecimiento');
    readln(e.localidad);
end;
function relDocenteAlumno(cantAlu: integer; cantDoc: integer): real;
begin
    relDocenteAlumno:= cantAlu / cantDoc;
end;
procedure maximo(relDocAlu: real; cue: integer; nombre: string; var max1, max2: real; var cueMax1, cueMax2: integer; var nomMax1, nomMax2: string);
begin
    if(relDocAlu >= max1) then
        begin
            cueMax2:= cueMax1;
            cueMax1:= cue;
            nomMax2:= nomMax1;
            nomMax1:= nombre;
            max2:= max1;
            max1:= relDocAlu;
        end
    else
        if(relDocAlu >= max2) then
            begin
                max2:= relDocAlu;
                cueMax2:= cue;
                nomMax2:= nombre;
            end;
end;
procedure relevamientoPrimarias(var escuelasLP, cueMax1, cueMax2: integer; var nomMax1, nomMax2: string);
var
    e: establecimiento;
    relDocAlu, max1, max2: real;
    i: integer;
begin
    max1:= -1;
    max2:= -1;
    for i:= 1 to dim do
        begin
            leerEstablecimiento(e);
            relDocAlu := relDocenteAlumno(e.cantAlumnos, e.cantDocentes);
            if(e.localidad = 'La Plata') and (relDocAlu > relacion) then
                escuelasLP:= escuelasLP + 1;
            maximo(relDocAlu, e.cue, e.nombre, max1, max2, cueMax1, cueMax2, nomMax1, nomMax2);
        end;
end;
var
    escuelasLP, cueMax1, cueMax2: integer; 
    nomMax1, nomMax2: string;
begin
    escuelasLP:= 0;
    relevamientoPrimarias(escuelasLP, cueMax1, cueMax2, nomMax1, nomMax2);
    writeln('La cantidad de escuelas de La Plata con una relacion de alumnos por docente superior a la sugerida por UNESCO es: ', escuelasLP);
    writeln('Escuelas con mejor relacion entre docentes y alumnos:');
    writeln('1. ', ' CUE=', cueMax2, ' Nombre=', nomMax2);
    writeln('2. ', ' CUE=', cueMax1, ' Nombre=', nomMax1);
end.