{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}

//Registro de alumnos con nro alumno, nombre, apellido, cant asistencias. Vector de 1000 posiciones de registro alumnos
//El enunciado indica que el vector ya se encuentra cargado. Para poder probar el codigo, se cargará manualmente

program ej4;
const
    cantAlumnos=1000;
type
    rangoCantAlumnos=1..cantAlumnos;
    str30=string[30];

    alumno=record
        numero:integer;
        nombre:str30;
        apellido:str30;
        asistencias:integer;
    end;

    vectorAlumnos=array[rangoCantAlumnos] of alumno;

procedure leerAlumno(var a:alumno);
begin
    writeln('Numero: '); readln(a.numero);
    if(a.numero<>0) then begin
        writeln('Nombre: '); readln(a.nombre);
        writeln('Apellido: '); readln(a.apellido);
        writeln('Asistencias: '); readln(a.asistencias);
    end;
end;

procedure leerVectorAlumnos(var va:vectorAlumnos; var DL:rangoCantAlumnos);
var
    alu:alumno;
begin
    DL:=0;
    leerAlumno(alu);
    while((DL<cantAlumnos) and (alu.numero<>0)) do
    begin
        DL:=DL+1;
        va[DL]:=alu;
        if(DL<cantAlumnos) then leerAlumno(alu);
    end;
end;

//Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
function EncontrarPosicionAlumno(alus:vectorAlumnos; nroAlu:integer; dimL:rangoCantAlumnos):integer;
var
    pos:integer;
begin
    pos:=1;
    while((pos<=dimL) and (alus[pos].numero<nroAlu)) do
    begin
        pos:=pos+1;
    end;
    if((pos<=dimL) and (alus[pos].numero=nroAlu)) then EncontrarPosicionAlumno:=pos
    else EncontrarPosicionAlumno:=-1;
end;

//Un módulo que reciba un alumno y lo inserte en el vector.
procedure InsertarAlumno(var alumns:vectorAlumnos; var dimLog:rangoCantAlumnos; var pude:boolean; alu:alumno; insPos:rangoCantAlumnos);
var
    k:rangoCantAlumnos;
begin
    pude:=false;
    if(((dimLog+1)<=cantAlumnos) and (insPos>=1) and (insPos<=dimLog)) then
    begin
        for k:=dimLog downto insPos do
            alumns[k+1]:=alumns[k];

        pude:=true;
        alumns[insPos]:=alu;
        dimLog:=dimLog+1;
    end;
end;

//Un módulo que reciba la posición de un alumno dentro del vector y lo elimine
procedure EliminarAlumnoPorPosicion(var alus:vectorAlumnos; var dLog:rangoCantAlumnos; var condicion:boolean; elimPos:rangoCantAlumnos);
var
    i:rangoCantAlumnos;
begin
    condicion:=false;
    if((elimPos>=1) and (elimPos<=dLog)) then
    begin
        for i:=elimPos to (dLog-1) do
            alus[i]:=alus[i+1];
        
        condicion:=true;
        dLog:=dLog-1;
    end;
end;

//Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
procedure EliminarAlumnoPorNumero(var alums:vectorAlumnos; var diLog:rangoCantAlumnos; var completado:boolean; nroElim:integer);
var
    h:rangoCantAlumnos;
    pos:integer;
begin
    completado:=false;
    pos:=EncontrarPosicionAlumno(alums, nroElim, diLog);
    if(pos<>-1) then
    begin
        for h:=pos to (diLog-1) do
            alums[h]:=alums[h+1];

        completado:=true;
        diLog:=diLog-1;
    end;
end;

//Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
procedure EliminarAlumnoSinAsistencias(var als:vectorAlumnos; var dimenLog:rangoCantAlumnos);
var
    j:rangoCantAlumnos;
    contador:integer;
begin
    contador:=0;

    for j:=1 to dimenLog do
    begin
        if(als[j].asistencias=0) then contador:=contador+1
        else if (contador>0) then als[j-contador]:=als[j];
    end;

    dimenLog:=dimenLog-contador;
end;

var
    alumnosCatedra:vectorAlumnos;
    datosAlumno:alumno;
    dimensionLogica:rangoCantAlumnos;
    condCompletada:boolean;
    posicion, m:rangoCantAlumnos;
    numero, posNum:integer;
begin
    leerVectorAlumnos(alumnosCatedra, dimensionLogica);

    writeln('Ingrese el numero de alumno buscado'); readln(numero);
    posNum:=EncontrarPosicionAlumno(alumnosCatedra, numero, dimensionLogica);
    writeln('El alumno estaba en la posicion: ',posNum);
    
    writeln(' ');
    writeln('Ingrese el alumno a insertar: '); leerAlumno(datosAlumno);
    writeln('Ingrese la posicion a insertar: '); readln(posicion);
    InsertarAlumno(alumnosCatedra, dimensionLogica, condCompletada, datosAlumno, posicion);
    if(condCompletada) then writeln('Se ha insertado satisfactoriamente')
    else writeln('No se ha podido insertar');

    writeln(' ');
    writeln('Ingrese la posicion del alumno a eliminar: '); readln(posicion);
    EliminarAlumnoPorPosicion(alumnosCatedra, dimensionLogica, condCompletada, posicion);
    if(condCompletada) then writeln('Se ha eliminado satisfactoriamente')
    else writeln('No se ha podido eliminar');

    writeln(' ');
    writeln('Ingrese el numero del alumno a eliminar: '); readln(numero);
    EliminarAlumnoPorNumero(alumnosCatedra, dimensionLogica, condCompletada, numero);
    if (condCompletada) then writeln('Se ha eliminado satisfactoriamente')
    else writeln('No se ha podido eliminar');

    EliminarAlumnoSinAsistencias(alumnosCatedra, dimensionLogica);
end.
