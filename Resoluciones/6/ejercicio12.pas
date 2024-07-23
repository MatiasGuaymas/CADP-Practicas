{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
la información disponible de todos los dispositivos e informe:
a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

//Registro de tipo celular con version, tamaño pantalla y memoria. Lista con elemento tipo celular ordenada por version android (Ya dispongo de la lista)
//a) Corte de control, mientras version actual = celular.version sumo 1 y recorro lista (dentro de este while se procesaran todos los datos)
//b) funcion booleana que verifica si memoria>3 and pantalla>=5
//c) Durante el recorrido de la lista sumo tamaños de pantalla y cuento cantidad de celulares. Luego al finalizar obtengo promedio.

program ejercicio12;
const
    ramCondicion=3;
    pantallaCondicion=5;
type
    celular=record
        version:real;
        pantalla:real;
        memoria:integer;
    end;
    
    ListaC=^nodoC;
    nodoC=record
        elemento:celular;
        sig:ListaC;
    end;

procedure leerRegistro(var c:celular);
begin
    writeln('Version: '); readln(c.version);
    if(c.version<>0) then begin
        writeln('Tamaño pantalla: '); readln(c.pantalla);
        writeln('Memoria RAM: '); readln(c.memoria);
    end;
    writeln('..........................');
end;

procedure armarNodo(var l:ListaC; c:celular);   //l:=nill en prog princ
var
    nuevo:ListaC;
begin
    new(nuevo);
    nuevo^.elemento:=c;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarLista(var l:ListaC);
var
    c:celular;
begin
    leerRegistro(c);
    while(c.version<>0)do begin
        armarNodo(l,c);
        leerRegistro(c);
    end;
end;

function condicionMemoriaYPantalla(cel:celular):boolean;
begin
    condicionMemoriaYPantalla:=((cel.memoria>ramCondicion) and (cel.pantalla>=pantallaCondicion));
end;

procedure procesarDatos(l:ListaC; var cantDispCond:integer; var promedioPantalla:real);
var
    cantCelular,cantVersion:integer;
    sumaTamanios,versionActual:real;
begin
    cantCelular:=0;
    sumaTamanios:=0;
    while(l<>nil) do
    begin
        cantVersion:=0;
        versionActual:=l^.elemento.version;
        while((l<>nil) and (l^.elemento.version=versionActual)) do
        begin
            if(condicionMemoriaYPantalla(l^.elemento)) then cantDispCond:=cantDispCond+1;
            cantCelular:=cantCelular+1;
            sumaTamanios:=sumaTamanios+l^.elemento.pantalla;
            cantVersion:=cantVersion+1;
            l:=l^.sig;
        end;
        writeln('La version de Android ',versionActual:1:2,' cuenta con ',cantVersion,' dispositivos.');
    end;
    promedioPantalla:=sumaTamanios/cantCelular;
end;

var
    listaCelulares:ListaC;
    cantDispositivosCondicion:integer;
    promedioTamanioPantalla:real;
begin
    generarLista(listaCelulares);
    procesarDatos(listaCelulares, cantDispositivosCondicion, promedioTamanioPantalla);
    writeln('La cantidad de dispositivos con mas de 3GB de RAM y 5 pulgadas es de ',cantDispositivosCondicion);
    writeln('El promedio de tamaño de pantalla es de ',promedioTamanioPantalla:1:2);
end.