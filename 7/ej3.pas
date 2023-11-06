{Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020.
De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de destino y
kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código de auto y
para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número de
viaje.}

//Ya se dispone la lista.
//Registro viaje con numero, codigo, direccion origen, direccion destino y kilometros recorridos. Lista con elemento tipo viaje ordenada por
//codigo(puede haber mas de un viaje para un mismo codigo)

//a) Utilizando corte de control, sumo kilometros recorridos por cada auto(ordenado por codigo) y comparo con dos maximos (por cada vez que salgo
// del corte de control, para evitar utilizar otra variable)
//b) Utilizo un modulo insertar ordenado (por numero de viaje) donde ingreso solo aquellos nodos cuyos viajes >5km

program ej3;
const    
    kilometrosCondicion=5;
type
    viaje=record
        numero:integer;
        codigo:integer;
        direccionOrigen:string;
        direccionDestino:string;
        kilometros:real;
    end;

    listaV=^nodoV;
    nodoV=record
        elemento:viaje;
        sig:listaV;
    end;

    maxViaje=record
        maxCodigo:integer;
        maxKilometros:real;
    end;

procedure leerRegistro(var v:viaje);
begin
    writeln('INGRESO DE DATOS: ');
    writeln('Numero viaje: '); readln(v.numero);
    if(v.numero<>0) then begin
        writeln('Codigo auto: '); readln(v.codigo);
        writeln('Direccion origen: '); readln(v.direccionOrigen);
        writeln('Direccion destino: '); readln(v.direccionDestino);
        writeln('Kilometros recorridos: '); readln(v.kilometros);
    end;
    writeln('------------------------');
end;

procedure insertarOrdenadoCodigo(var pri:listaV; v:viaje);
var
    nuevo,actual,anterior:listaV;
begin
    new(nuevo);
    nuevo^.elemento:=v;
    nuevo^.sig:=nil;
    if(pri=nil) then pri:=nuevo
    else begin
        actual:=pri;
        while((actual<>nil) and (actual^.elemento.codigo<nuevo^.elemento.codigo)) do begin
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

procedure insertarOrdenadoNumeroViaje(var pri:listaV; v:viaje);
var
    nuevo,actual,anterior:listaV;
begin
    new(nuevo);
    nuevo^.elemento:=v;
    nuevo^.sig:=nil;
    if(pri=nil) then pri:=nuevo
    else begin
        actual:=pri;
        while((actual<>nil) and (actual^.elemento.codigo<nuevo^.elemento.numero)) do begin
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

procedure generarLista(var l:listaV);
var
    v:viaje;
begin
    leerRegistro(v);
    while(v.numero<>0) do begin
        insertarOrdenadoCodigo(l,v);
        leerRegistro(v);
    end;
end;

procedure informarLista(l:listaV);
begin
    while(l<>nil) do begin
        writeln('Auto ',l^.elemento.codigo);
        writeln('- ',l^.elemento.numero);
        writeln('- ',l^.elemento.kilometros:1:2);
        l:=l^.sig;
        writeln('.............');
    end;
end;

procedure dosMaximos(cod:integer; kilom:real; var maxCod1:maxViaje; var maxcod2:maxViaje);
begin
    if(kilom>maxcod1.maxKilometros) then begin
        maxcod2:=maxCod1;
        maxCod1.maxCodigo:=cod;
        maxCod1.maxKilometros:=kilom;
    end
    else if(kilom>maxcod2.maxKilometros) then begin
        maxcod2.maxCodigo:=cod;
        maxcod2.maxKilometros:=kilom;
    end;
end;

procedure procesarDatos(pri:listaV; var priN:listaV; var maxCodigo1:maxViaje; var maxCodigo2:maxViaje);
var
    codigoActual:integer;
    sumaKilometros:real;
begin
    //maxCodigo1.maxCodigo:=-1;
    maxCodigo1.maxKilometros:=-1;
    while(pri<>nil) do begin
        codigoActual:=pri^.elemento.codigo;
        sumaKilometros:=0;
        while((pri<>nil) and (pri^.elemento.codigo=codigoActual)) do begin
            if(pri^.elemento.kilometros>kilometrosCondicion) then insertarOrdenadoNumeroViaje(priN,pri^.elemento);
            sumaKilometros:=sumaKilometros+pri^.elemento.kilometros;
            pri:=pri^.sig;
        end;
        dosMaximos(codigoActual,sumaKilometros,maxCodigo1,maxCodigo2);
    end;
end;

var
    listaViajes, listaViajesNueva:listaV;
    codigoMaximo1, codigoMaximo2:maxViaje;
begin
    listaViajes:=nil;
    listaViajesNueva:=nil;
    generarLista(listaViajes);
    procesarDatos(listaViajes, listaViajesNueva, codigoMaximo1, codigoMaximo2);
    writeln('LISTA ORIGINAL: ');
    informarLista(listaViajes);
    writeln('----------------------');
    writeln('LISTA NUEVA: ');
    informarLista(listaViajesNueva);
    writeln('----------------------');
    writeln('Los dos autos con mayor kilometraje tiene el codigo: ');
    writeln('> Auto: ',codigoMaximo1.maxCodigo,' > Kilometros: ',codigoMaximo1.maxKilometros:1:2);
    writeln('> Auto: ',codigoMaximo2.maxCodigo,' > Kilometros: ',codigoMaximo2.maxKilometros:1:2);
end.
