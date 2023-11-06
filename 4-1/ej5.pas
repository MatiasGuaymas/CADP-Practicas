{Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program ej5;
const
    dimF=100;
type
    vRango=1..dimF;
    vector = array[1..dimF] of integer;

procedure LeerVector(var v:vector; var dimL:vRango);
var
    valor:integer;
begin
    dimL:=0;
    writeln('Ingrese numeros enteros');
    readln(valor);
    while((dimL<dimF) and (valor<>0)) do
    begin
        dimL:=dimL+1;
        v[dimL]:=valor;
        if(dimL<>dimF) then
            readln(valor);
    end;
end;

procedure IntercambiarValor(var vec:vector; x,y:vRango);
var
    aux:integer;
begin
    aux:=vec[x];
    vec[x]:=vec[y];
    vec[y]:=aux;
end;

procedure MaxElemento(vec:vector; var maxNum:integer; var maxPos:vRango; dimL:vRango);
var
    k:vRango;
begin
    maxNum:=-32768;
    for k:=1 to dimL do
    begin
        if(vec[k]>maxNum) then begin
            maxNum:=vec[k];
            maxPos:=k;
        end;
    end;
end;

procedure MinElemento(ve:vector; var minNum:integer; var minPos:vRango; dimL:vRango);
var
    h:vRango;
begin
    minNum:=32767;
    for h:=1 to dimL do
    begin
        if(ve[h]<minNum) then begin
            minNum:=ve[h];
            minPos:=h;
        end;
    end;
end;

var
    numeros:vector;
    dimLogica,pMin,pMax:vRango;
    nMax,nMin:integer;
begin
    LeerVector(numeros,dimLogica);
    MaxElemento(numeros, nMax, pMax, dimLogica);
    MinElemento(numeros, nMin, pMin, dimLogica);
    IntercambiarValor(numeros,pMax,pMin);

    writeln('El elemento maximo ', nMax,' que se encontraba en la posicion ',pMax,' fue intercambiado con el elemento minimo ',nMin,' que se encontraba en la posicion ',pMin);
end.
