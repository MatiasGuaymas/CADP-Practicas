{La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

//Registro primario con campos: codigo, titulo, docente, cantidad alumnos, nombre escuela, localidad.
//Registro secundario tipo docente con campos: dni, nombre, apellido, email.
//Una misma localidad puede tener mas de una escuela, la escuela mas de un proyecto.
//Contador total de escuelas. Contador individual por localidad.
//Dos maximos por alumno, guarda nombre escuela
//Evaluacion localidad (Daireaux) y digitos del codigo

program ej8;
type
    docente=record
        dni:integer;
        nombre:string;
        apellido:string;
        email:string;
    end;

    proyecto=record
        codigo:integer;
        titulo:string;
        profesor:docente;
        alumnos:integer;
        escuela:string;
        localidad:string;
    end;

    escuelaMax=record
        nombreEscuela:string;
        cantAlumnos:integer;
    end;

procedure leerProfesor(var p:docente);
begin
    writeln('Nombre docente: '); readln(p.nombre);
    writeln('Apellido docente: '); readln(p.apellido);
    writeln('DNI docente: '); readln(p.dni);
    writeln('Email docente: '); readln(p.email);
end;

procedure leerProyecto(var pr:proyecto);
begin
    writeln('Codigo proyecto: '); readln(pr.codigo);
    if(pr.codigo<>-1) then
    begin
        writeln('Titulo proyecto: '); readln(pr.titulo);
        leerProfesor(pr.profesor);
        writeln('Cantidad de alumnos: '); readln(pr.alumnos);
        writeln('Escuela: '); readln(pr.escuela);
        writeln('Localidad: '); readln(pr.localidad);
        writeln('.......................');
    end;
end;

procedure EscuelaConMasAlumnos(escNombre:string; totalAlumnos:integer; var escMayor1:escuelaMax; var escMayor2:escuelaMax);
begin
    if(totalAlumnos>escMayor1.cantAlumnos) then
    begin
        escMayor2:=escMayor1;
        escMayor1.nombreEscuela:=escNombre;     //Inicializado en el programa principal
        escMayor1.cantAlumnos:=totalAlumnos;    //Inicializado en el programa principal
    end
    else if(totalAlumnos>escMayor2.cantAlumnos) then
    begin
        escMayor2.nombreEscuela:=escNombre;
        escMayor2.cantAlumnos:=totalAlumnos;
    end;
end;

procedure DigitosCodigo(code:integer; var dPar:integer; var dImpar:integer);
begin
    dPar:=0;
    dImpar:=0;

    while(code<>0) do
    begin
        if(code MOD 2=0) then
            dPar:=dPar+1
        else 
            dImpar:=dImpar+1;
        code:=code DIV 10;
    end;
end;

function CondicionLocalidad(nombreCiudad:string; digitoPar:integer; digitoImpar:integer):boolean;
begin
    CondicionLocalidad:=((nombreCiudad='Daireaux') and (digitoPar=digitoImpar));
end;

var
    trabajo:proyecto;
    ctAlumnos, cantPar, cantImpar, totalEscuelas, cantEscuelaLocalidad:integer;
    EscuelaMayor1, EscuelaMayor2:escuelaMax;
    localidadActual, escuelaActual:string;
begin
    totalEscuelas:=0;   //Total general de escuelas, inicializo al principio para conocer totalidad
    EscuelaMayor1.nombreEscuela:='';
    EscuelaMayor1.cantAlumnos:=-1;

    leerProyecto(trabajo);

    while(trabajo.codigo<>-1) do    //Todos los proyectos
    begin
        localidadActual:=trabajo.localidad;
        cantEscuelaLocalidad:=0;    //Inicializo aca para reiniciar con cada cambio de localidad

        while((trabajo.codigo<>-1) and (trabajo.localidad=localidadActual)) do  //Todos los proyectos de escuelas de una misma localidad
        begin
            ctAlumnos:=0;   //Inicializo aca para reiniciar con cada cambio de escuela
            escuelaActual:=trabajo.escuela;
            cantEscuelaLocalidad:=cantEscuelaLocalidad+1;

            while((trabajo.codigo<>-1) and (trabajo.localidad=localidadActual) and (trabajo.escuela=escuelaActual)) do  //Todos los proyectos de una misma localidad y escuela
            begin
                ctAlumnos:=ctAlumnos+trabajo.alumnos;

                if(trabajo.localidad='Daireaux') then
                begin
                    DigitosCodigo(trabajo.codigo, cantPar, cantImpar);
                    if(cantPar=cantImpar) then begin
                        writeln('Localidad Daireaux, titulo proyecto: ',trabajo.titulo);
                        writeln('.......................');
                    end;
                end;

                leerProyecto(trabajo);
            end;

            EscuelaConMasAlumnos(escuelaActual, ctAlumnos, EscuelaMayor1, EscuelaMayor2);   //Calculo mayor cuando cambio de escuela, pues ya tengo total alumnos

        end;

        totalEscuelas:=totalEscuelas+cantEscuelaLocalidad;  //La cantidad total de escuelas viene de la suma de las escuelas de cada localidad

        writeln('La localidad ',localidadActual,' tiene ',cantEscuelaLocalidad,' escuela/s participando.');

    end;

    writeln('Cantidad total de escuelas: ',totalEscuelas);
    writeln('Las dos escuelas con mas alumnos participantes son: ',EscuelaMayor1.nombreEscuela,' y ',EscuelaMayor2.nombreEscuela);

end.