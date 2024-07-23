{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

//Registro alumno con numero alumno, apellido y promedio. Lista con elemento tipo alumno
//Leer lista hasta numero alumno 0. Puedo agregar adelante, ya que no especifica.
//Vector df 10 de tipo alumno para guardar maximos. Recorro lista guardando maximo promedio y desplazando (maximo 1 en posicion 1)

program ejercicio11;
const
    alumnosMaxPromedio=5;
type
    alumno=record
        numero:integer;
        apellido:string;
        promedio:real;
    end;

    listaA=^nodoA;
    nodoA=record
        elemento:alumno;
        sig:listaA;
    end;

    maximosPromedios=array[1..alumnosMaxPromedio] of alumno;

procedure leerRegistro(var a:alumno);
begin
    writeln('Numero: '); readln(a.numero);
    if(a.numero<>0) then begin
        writeln('Apellido: '); readln(a.apellido);
        writeln('Promedio: '); readln(a.promedio);
    end;
    writeln('..................');
end;

procedure armarNodo(var l:listaA; al:alumno);
var
    nuevo:listaA;
begin
    new(nuevo);
    nuevo^.elemento:=al;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarLista(var l:listaA);   //l:=nil en prog princ
var
    a:alumno;
begin
    leerRegistro(a);
    while(a.numero<>0) do begin
        armarNodo(l, a);
        leerRegistro(a);
    end;
end;

procedure inicializarMaximos(var v:maximosPromedios);
var
    h:integer;
begin
    for h:=1 to alumnosMaxPromedio do
        v[h].promedio:=-1;
    v[1].numero:=0;
    v[1].apellido:='';
end;

procedure informarMaximos(v:maximosPromedios);
var
    m:integer;
begin
    for m:=1 to alumnosMaxPromedio do
        if(v[m].promedio<>-1) then begin
            writeln('El alumno ',v[m].apellido,', numero ',v[m].numero,', recibira el premio.');
        end;
end;

procedure procesarDatos(lis:listaA; var maxProms:maximosPromedios);
var
    posProm,posCorrimiento:integer;
    guardeMaximo:boolean;
begin
    while(lis<>nil) do
    begin
        posProm:=1;
        guardeMaximo:=false;
        while((posProm<=alumnosMaxPromedio) and (not guardeMaximo)) do
        begin
            if(lis^.elemento.promedio>maxProms[posProm].promedio) then
            begin
                for posCorrimiento:=(alumnosMaxPromedio-1) downto posProm do
                    maxProms[posCorrimiento+1]:=maxProms[posCorrimiento];
                maxProms[posProm]:=lis^.elemento;
                guardeMaximo:=true;
            end
            else posProm:=posProm+1;
        end;
        lis:=lis^.sig;
    end;
end;

var
    listaAlumnos:listaA;
    aluMaxPromedios:maximosPromedios;
begin
    listaAlumnos:=nil;
    inicializarMaximos(aluMaxPromedios);
    generarLista(listaAlumnos);
    procesarDatos(listaAlumnos, aluMaxPromedios);
    informarMaximos(aluMaxPromedios);
end.