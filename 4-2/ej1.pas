{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program ej1;
const
    DF=500;
type
    vectorEnteros=array[1..DF] of integer;

procedure CargarVector(var v:vectorEnteros; var DL:integer); //Este procedimiento es para probar el programa. El enunciado me dice que el vector viene cargado
var
    valor:integer;
begin
    DL:=0;
    writeln('Ingrese valores enteros: ');
    readln(valor);
    while((DL<DF) and (valor<>-1)) do
    begin
        DL:=DL+1;
        v[DL]:=valor;
        if (DL<DF) then readln(valor);
    end;
end;

function BusquedaNumeroDesordenada(vec:vectorEnteros; DimL:integer; n:integer):boolean;
var
    condicion:boolean;
    pos:integer;
begin
    condicion:=false;
    pos:=1;
    while((pos<=DimL) and (not condicion)) do
    begin
        writeln('Posicion: ',pos);
        if(vec[pos]=n) then condicion:=true
        else
            pos:=pos+1;
    end;

    BusquedaNumeroDesordenada:=condicion;
end;

function BusquedaNumeroMejorada(ve:vectorEnteros; DimenL:integer; numero:integer):boolean;
var
    pos:integer;
begin
    pos:=1;
    while((pos<=DimenL) and (ve[pos]<numero)) do
    begin
        writeln('Posicion: ',pos);
        pos:=pos+1;
    end;

    if((pos<=dimenL) and (ve[pos]=numero)) then BusquedaNumeroMejorada:=true
    else
        BusquedaNumeroMejorada:=false;
end;

function BusquedaNumeroBinaria(vector:vectorEnteros; dimLog:integer; valor:integer):boolean;
var
    inf, sup, medio:integer;
begin
    inf:=1;
    sup:=dimLog;
    medio:=(inf+sup) DIV 2;

    while((inf<=sup) and (valor<>vector[medio])) do
    begin
        writeln('Posicion: ',medio);
        if (valor<vector[medio]) then
            sup:=medio-1
        else
            inf:=medio+1;
        medio:=(inf+sup) DIV 2;
    end;

    BusquedaNumeroBinaria:=((inf<=sup) and (valor=vector[medio]));
end;

var
    Enteros:vectorEnteros;
    num,DimLogica:integer;
begin
    CargarVector(Enteros, DimLogica);
    writeln('Numero buscado: '); readln(num);
    
    {if(BusquedaNumeroDesordenada(Enteros, DimLogica, num)) then writeln('El numero fue encontrado')
    else 
        writeln('No se encuentra el numero');}

    {if(BusquedaNumeroMejorada(Enteros, DimLogica, num)) then writeln('El numero fue encontrado')
    else 
        writeln('No se encuentra el numero');}

    if(BusquedaNumeroBinaria(Enteros, DimLogica, num)) then writeln('El numero fue encontrado')
    else 
        writeln('No se encuentra el numero');
end.