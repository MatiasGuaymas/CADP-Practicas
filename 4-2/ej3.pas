{Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viaje realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viaje (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viaje realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viaje realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viaje cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

//Estructura con dia, monto y distancia: registro. 200 de estas en vector
//Modulo que lea campos del registro. Otro que guarde estos valores en el vector hasta distancia=0 (while)
//Recorro con un for utilizando la dimensión lógica. Sumo todos los montos para luego calcular el promedio. Minimo de dinero donde almaceno
//distancia y dia. Arreglo de 31 que guarde cantidad de viaje por dia
//Modulo para eliminar elementos en el vector 

program ej3;
const
    cantDias=31;
    cantViajes=200;
    condicionKM=100.00;
type
    rangoDias=1..cantDias;
    rangoViajes=1..cantViajes;

    viaje=record
        dia:rangoDias;
        monto:real;
        distancia:real;
    end;

    vectorViajes=array[rangoViajes] of viaje;
    vectorDias=array[rangoDias] of integer;

procedure leerRegistro(var reg:viaje);
begin
    writeln('Distancia realizada: '); readln(reg.distancia);
    if(reg.distancia<>0) then begin
        writeln('Dia: '); readln(reg.dia);
        writeln('Dinero transportado: '); readln(reg.monto);
    end;
    writeln('.......................');
end;

procedure leerViajes(var v:vectorViajes; var dL:rangoViajes);
var
    regis:viaje;
begin
    dL:=0;
    leerRegistro(regis);
    while((dL<cantViajes) and (regis.distancia<>0)) do
    begin
        dL:=dL+1;
        v[dL]:=regis;
        if(dL<cantViajes) then leerRegistro(regis);
    end;
end;

procedure InicializarVector(var vector:vectorDias);
var
    i:rangoDias;
begin
    for i:=1 to cantDias do
        vector[i]:=0;
end;

procedure InformarVector(v:vectorDias);
var
    h:rangoDias;
begin
    for h:=1 to cantDias do
        writeln('El dia ',h,' se realizaron ',v[h],' viajes');
end;

procedure MenorDinero(dViajes:viaje; var minViajeMonto:viaje);   //minViajeMonto inicializado fuera del modulo
begin
    if(dViajes.monto<minViajeMonto.monto) then
        minViajeMonto:=dViajes;
end;

procedure DatosViajes(vec:vectorViajes; dimL:rangoViajes);
var
    viajeMinimo:viaje;
    totalMonto, promedioMonto:real;
    viajesMes:vectorDias;
    j:rangoViajes;
begin
    viajeMinimo.monto:=32767;
    totalMonto:=0;
    InicializarVector(viajesMes);

    for j:=1 to dimL do
    begin
        totalMonto:=totalMonto+vec[j].monto;
        MenorDinero(vec[j], viajeMinimo);
        viajesMes[vec[j].dia]:=viajesMes[vec[j].dia] + 1;
    end;

    promedioMonto:=totalMonto/dimL;

    writeln('El promedio de dinero transportado es de: $',promedioMonto:1:2);
    writeLn('El dia ', viajeMinimo.dia,' se recorrieron ', viajeMinimo.distancia:1:2,'kM, transportando $',viajeMinimo.monto:1:2);
    writeln('.......................');
    InformarVector(viajesMes);
end;
    
procedure EliminarElemento(var vect:vectorViajes; var dimLog:rangoViajes; var contador:rangoViajes);
var
    k:rangoViajes;
begin
    contador:=0;
    for k:=1 to dimLog do
    begin
        if(vect[k].distancia=condicionKM) then
            contador:=contador+1
        else if (contador>0) then vect[k-contador]:=vect[k];
    end;
    dimLog:=dimLog-contador;
end;

var
    viajes:vectorViajes;
    dimLogica, eliminados:rangoViajes;
    i:integer;
begin
    leerViajes(viajes, dimLogica);
    DatosViajes(viajes, dimLogica);
    EliminarElemento(viajes, dimLogica, eliminados);

    writeln('La cantidad de recorridos eliminados fueron de: ',eliminados);
end.