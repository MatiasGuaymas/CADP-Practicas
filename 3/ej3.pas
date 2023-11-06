{El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
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

program ej3;
const
    proporcionRef=23.435;
type
    escuela=record
        cue:integer;
        nombre:string;
        localidad:string;
        alumnos:integer;
        docentes:integer;
    end;

    escuelaMin=record
        cueMin:integer;
        nombreMin:string;
        relacionMin:real;
    end;

procedure leer(var e:escuela);
begin
    writeln('Ingrese el CUE: '); readln(e.cue);
    writeln('Ingrese el nombre: '); readln(e.nombre);
    writeln('Ingrese la localidad: '); readln(e.localidad);
    writeln('Ingrese cantidad de alumnos: '); readln(e.alumnos);
    writeln('Ingrese cantidad de docentes: '); readln(e.docentes);
end;

function relacionAluDoc(cantAlu:integer; cantDoc:integer):real;
begin
    relacionAluDoc:=(cantAlu/cantDoc);
end;

function CantEscuelaLaPlata(ciudad:string; rel:real):boolean;
begin
    CantEscuelaLaPlata:=((ciudad='La Plata') and (rel>proporcionRef));
end;

procedure MenorRelacion(codigo:integer; nombreEsc:string; relacion:real; var eMin1:escuelaMin; var eMin2:escuelaMin);
begin
    if(relacion<eMin1.relacionMin) then
    begin
        eMin2.relacionMin:=eMin1.relacionMin;
        eMin1.relacionMin:=relacion;

        eMin2.cueMin:=eMin1.cueMin;
        eMin1.cueMin:=codigo;

        eMin2.nombreMin:=eMin1.nombreMin;
        eMin1.nombreMin:=nombreEsc;
    end

    else if(relacion<eMin2.relacionMin) then
    begin
        eMin2.relacionMin:=relacion;
        eMin2.cueMin:=codigo;
        eMin2.nombreMin:=nombreEsc;
    end;
end;

var
    institucion:escuela;
    instMin1,instMin2:escuelaMin;
    relacion_alumno_docente:real;
    cantEscuelaLP, i:integer;
begin
    cantEscuelaLP:=0;
    instMin1.relacionMin:=999;
    instMin1.cueMin:=0;
    instMin1.nombreMin:='';

    for i:=0 to 2400 do
    begin
        leer(institucion);
        relacion_alumno_docente:= relacionAluDoc(institucion.alumnos,institucion.docentes); //Guardo el valor retornado por la funcion
        MenorRelacion(institucion.cue,institucion.nombre,relacion_alumno_docente,instMin1,instMin2);

        if(CantEscuelaLaPlata(institucion.localidad,relacion_alumno_docente)) then
            cantEscuelaLP:=cantEscuelaLP+1;
    end;

    writeln('Cantidad de escuelas de La Plata con mayor relacion a la recomendada: ',cantEscuelaLP);
    writeln('Codigos de escuelas con mejor relacion: ',instMin1.cueMin,' y ',instMin2.cueMin);
    writeln('Nombre de escuelas con mejor relacion: ',instMin1.nombreMin,' y ',instMin2.nombreMin);

end.