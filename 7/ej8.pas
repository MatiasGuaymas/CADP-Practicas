{8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada
transferencia se conoce: número de cuenta origen, DNI de titular de cuenta origen, número de cuenta
destino, DNI de titular de cuenta destino, fecha, hora, monto y el código del motivo de la transferencia
(1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios). Esta estructura
no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe estar
ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares}

//Ya se dispone la lista
//Registro transferencia con numero origen, dni origen, numero destino, dni destino, fecha(mes y dia), hora, monto, codigo motivo(1-7).
//Lista con elemento tipo transferencia sin orden alguno.
//Vector df 7 para contar cantidad transferencias por cada motivo. Debo crear modulo para inicializarlo

//a) Desarrollar modulo insertar ordenado por numero origen. verificar if(numero origen<>numero destino).
//b) Corte de control por numero origen actual, sumo monto y al salir del bucle lo informo
//c) Dentro del mismo bucle, sumo uno al vector contador de transferencias por motivo. Luego calculo un maximo
//d) evaluo if(transferencia.fecha.mes=6 and pares<impares) sumo uno a contador cantidad.

program ej8;
const
    meses=11;
    motivos=7;
type
    rangoMeses=1..meses;
    rangoDias=1..31;
    rangoMotivos=1..motivos;

    periodo=record
        mes:rangoMeses;
        dia:rangoDias;
    end;
    
    transferencia=record
        numOrigen:integer;
        dniOrigen:integer;
        numDestino:integer;
        dniDestino:integer;
        fecha:periodo;
        hora:integer;
        monto:real;
        codigoMotivo:rangoMotivos;
    end;
    listaT=^nodoT;
    nodoT=record
        elemento:transferencia;
        sig:listaT;
    end;

    contadorMotivos=array[rangoMotivos] of integer;

procedure leerRegistro(var t:transferencia);
begin
    writeln('[INGRESO DATOS]: ');
    writeln('Numero cuenta origen: '); readln(t.numOrigen);
    if(t.numOrigen<>-1) then begin
        writeln('DNI cuenta origen: '); readln(t.dniOrigen);
        writeln('Numero cuenta destino: '); readln(t.numDestino);
        writeln('DNI cuenta destino: '); readln(t.dniDestino);
        writeln('Mes: '); readln(t.fecha.mes);
        writeln('Dia: '); readln(t.fecha.dia);
        writeln('Hora: '); readln(t.hora);
        writeln('Monto: '); readln(t.monto);
        writeln('Codigo motivo: '); readln(t.codigoMotivo);
    end;
    writeln('----------------------------');
end;

procedure armarNodo(var l:listaT; t:transferencia);
var
    nuevo:listaT;
begin
    new(nuevo);
    nuevo^.elemento:=t;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarListaOriginal(var l:listaT);
var
    t:transferencia;
begin
    leerRegistro(t);
    while(t.numOrigen<>-1) do begin
        armarNodo(l,t);
        leerRegistro(t);
    end;
end;

procedure insertarOrdenado(var pri:listaT; t:transferencia);
var
    nuevo,actual,anterior:listaT;
begin
    new(nuevo);
    nuevo^.elemento:=t;
    nuevo^.sig:=nil;
    if(pri=nil) then pri:=nuevo
    else begin
        actual:=pri;
        while((actual<>nil) and (actual^.elemento.numOrigen<nuevo^.elemento.numOrigen)) do begin
            anterior:=actual;
            actual:=actual^.sig;
        end;
        if(actual=pri) then begin
            nuevo^.sig:=pri;
            pri:=nuevo;
        end
        else begin
            anterior^.sig:=nuevo;
            nuevo^.sig:=actual;
        end;
    end;
end;

procedure generarListaNueva(var priN:listaT; pri:listaT);
begin
    while(pri<>nil) do begin
        if((pri^.elemento.numOrigen) <> (pri^.elemento.numDestino)) then insertarOrdenado(priN, pri^.elemento);
        pri:=pri^.sig;
    end;
end;

procedure inicializarContadorMotivos(var vm:contadorMotivos);
var
    i:rangoMotivos;
begin
    for i:=1 to motivos do
        vm[i]:=0;
end;

procedure maximoMotivo(var maxCodigo:rangoMotivos; contMotivos:contadorMotivos);
var
    k:rangoMotivos;
    maxCantMotivos:integer;
begin
    maxCantMotivos:=-1;
    for k:=1 to motivos do begin
        if(contMotivos[k]>maxCantMotivos) then begin
            maxCantMotivos:=contMotivos[k];
            maxCodigo:=k;
        end;
    end;
end;

function digitosParesImpares(numDestino:integer):boolean;
var
    par,impar:integer;
begin
    par:=0;
    impar:=0;
    while(numDestino<>0) do begin
        if((numDestino MOD 2)=0) then par:=par+1
        else impar:=impar+1;
        numDestino:=numDestino DIV 10;
    end;
    digitosParesImpares:=(par<impar);
end;

procedure procesarDatos(l:listaT; var maxCode:rangoMotivos; var cantTransfTerceros:integer);
var
    sumaMontos:real;
    motivosContador:contadorMotivos;
    numOrgActual:integer;
begin
    cantTransfTerceros:=0;
    inicializarContadorMotivos(motivosContador);
    while(l<>nil) do begin
        sumaMontos:=0;
        numOrgActual:=l^.elemento.numOrigen;
        while((l<>nil) and (l^.elemento.numOrigen=numOrgActual)) do begin
            if(l^.elemento.fecha.mes=6) then begin
                if(digitosParesImpares(l^.elemento.numDestino)) then cantTransfTerceros:=cantTransfTerceros+1;
            end;
            motivosContador[l^.elemento.codigoMotivo]:=motivosContador[l^.elemento.codigoMotivo]+1;
            sumaMontos:=sumaMontos+l^.elemento.monto;
            l:=l^.sig;
        end;
        writeln('MONTO DE CADA CUENTA CON TRANSFERENCIA A TERCEROS');
        writeln('> Numero cuenta origen: ',numOrgActual);
        writeln('> Monto: ',sumaMontos:1:2);
        writeln('.................');
    end;

    maximoMotivo(maxCode, motivosContador);
end;

procedure informarLista(l:listaT);
begin
    while(l<>nil) do begin
        writeln('- Numero origen: ',l^.elemento.numOrigen);
        writeln('- Numero destino: ',l^.elemento.numDestino);
        writeln('--------------------');
        l:=l^.sig;
    end;
end;

var
    listaTransferencias, listaTransfNueva:listaT;
    codigoMaximo:rangoMotivos;
    cantTransfCondicion:integer;
begin
    listaTransferencias:=nil;
    listaTransfNueva:=nil;
    generarListaOriginal(listaTransferencias);
    generarListaNueva(listaTransfNueva, listaTransferencias);
    procesarDatos(listaTransfNueva, codigoMaximo, cantTransfCondicion);
    writeln('Codigo de motivo con mas transferencias: ',codigoMaximo);
    writeln('Cantidad de transferencias en junio con mas digitos impares que pares: ',cantTransfCondicion);
end.