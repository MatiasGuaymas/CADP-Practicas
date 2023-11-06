{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una nueva
película, para ello se debe leer y almacenar la información de las personas que desean participar de
dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de género de actuación
que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura finaliza cuando llega
una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.
}

program ej1;
const
    DNICorte=3355;
    generos=5;
type
    rangoGeneros=1..generos;

    actor=record
        dni:integer;
        apellido:string;
        nombre:string;
        edad:integer;
        genero:rangoGeneros;
    end;

    listaA=^nodoA;
    nodoA=record
        elemento:actor;
        sig:listaA;
    end;

    vectorGeneros=array[rangoGeneros] of integer;

procedure leerRegistro(var a:actor);
begin
    writeln('DNI: '); readln(a.dni);
    writeln('Apellido: '); readln(a.apellido);
    writeln('Nombre: '); readln(a.nombre);
    writeln('Edad: '); readln(a.edad);
    writeln('Genero de actuacion: '); readln(a.genero);
    writeln('..............');
end;

procedure armarNodo(var l:listaA; a:actor);
var
    nuevo:listaA;
begin
    new(nuevo);
    nuevo^.elemento:=a;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarLista(var l:listaA);
var
    a:actor;
begin
    repeat
        leerRegistro(a);
        armarNodo(l,a);
    until(a.dni=DNICorte);
end;

function DNIConMasPares(dni:integer):boolean;
var
    par,impar:integer;
begin
    par:=0;
    impar:=0;
    while(dni<>0) do begin
        if((dni MOD 2)=0) then par:=par+1
        else impar:=impar+1;
        dni:=dni DIV 10;
    end;
    DNIConMasPares:=(par>impar);
end;

procedure dosGenerosMaximos(contGen:vectorGeneros; var maxGenero1:rangoGeneros; var maxGenero2:rangoGeneros);
var
    cantGenero1, cantGenero2:integer;
    i:rangoGeneros;
begin
    cantGenero1:=-1;
    for i:=1 to generos do begin
        if(contGen[i]>cantGenero1) then begin
            cantGenero2:=cantGenero1;
            maxGenero2:=maxGenero1;
            maxGenero1:=i;
            cantGenero1:=contGen[i];
        end
        else if(contGen[i]>cantGenero2) then begin
            cantGenero2:=contGen[i];
            maxGenero2:=i;
        end;
    end;
end;

procedure eliminarDNI(var pri:listaA; dniAEliminar:integer);
var
    actual,anterior:listaA;
begin
    actual:=pri;
    while((actual<>nil) and (actual^.elemento.dni<>dniAEliminar)) do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual<>nil) then begin
        if(actual=pri) then pri:=pri^.sig
        else anterior^.sig:=actual^.sig;
        dispose(actual);
    end;
end;

procedure inicializarVectorGeneros(var vg:vectorGeneros);
var
    k:rangoGeneros;
begin
    for k:=1 to generos do
        vg[k]:=0;
end;

procedure informarLista(l:listaA);
begin
    writeln('Lista actualizada: ');
    while(l<>nil) do begin
        writeln('DNI: ',l^.elemento.dni);
        writeln('Apellido: ',l^.elemento.apellido);
        writeln('----------');
        l:=l^.sig;
    end;
end;

procedure procesarDatos(l:listaA; var cantActDniPar:integer; var maxGen1:rangoGeneros; var maxGen2:rangoGeneros);
var
    contGeneros:vectorGeneros;
begin
    inicializarVectorGeneros(contGeneros);
    cantActDniPar:=0;
    while(l<>nil) do begin
        if(DNIConMasPares(l^.elemento.dni)) then cantActDniPar:=cantActDniPar+1;
        contGeneros[l^.elemento.genero]:=contGeneros[l^.elemento.genero]+1;
        l:=l^.sig;
    end;
    dosGenerosMaximos(contGeneros, maxGen1, maxGen2);
end;

var
    listaActores:listaA;
    cantActoresDNIPar:integer;
    generoMaximo1,generoMaximo2:rangoGeneros;
    dniParaEliminar:integer;
begin
    listaActores:=nil;
    generarLista(listaActores);
    procesarDatos(listaActores, cantActoresDNIPar, generoMaximo1, generoMaximo2);
    writeln('Ingrese DNI a eliminar: '); readln(dniParaEliminar);
    eliminarDNI(listaActores,dniParaEliminar);

    writeln('Cantidad de actores con DNI par: ',cantActoresDNIPar);
    writeln('Generos maximos: ',generoMaximo1,' y ',generoMaximo2);
    writeln('............');
    informarLista(listaActores);
end.