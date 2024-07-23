{11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales.
De cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2:
cine, 3: obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas
permitidas para el evento y costo de la entrada. Se pide:
1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.
2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.}

program ejercicio11;
const
    DIMF = 100;
type
    tipoEvento = 1..5;
    rango = 1..DIMF;
    venta = record
        codigoVenta: integer;
        numEvento: rango;
        DNI: integer;
        cantEntradas: integer;
    end;
    evento = record
        nombreEvento: string;
        tipo: tipoEvento;
        lugar: string;
        cantMaxPersonas: integer;
        costoEntrada: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: venta;
        sig: lista;
    end;
    eventos = array[1..DIMF] of evento;
procedure cargarVector(var v: eventos);
var
    i: rango;
begin
    for i := 1 to DIMF do
    begin
        writeln('Ingrese el nombre del evento: ');
        readln(v[i].nombreEvento);
        writeln('Ingrese el tipo de evento (1: musica, 2: cine, 3: obra de teatro, 4: unipersonal y 5: monologo): ');
        readln(v[i].tipo);
        writeln('Ingrese el lugar del evento: ');
        readln(v[i].lugar);
        writeln('Ingrese la cantidad maxima de personas permitidas para el evento: ');
        readln(v[i].cantMaxPersonas);
        writeln('Ingrese el costo de la entrada: ');
        readln(v[i].costoEntrada);
    end;
end;
procedure leerVenta(var v: venta);
begin
    writeln('Ingrese el codigo de venta: ');
    readln(v.codigoVenta);
    if (v.codigoVenta <> -1) then
    begin
        writeln('Ingrese el numero de evento: ');
        readln(v.numEvento);
        writeln('Ingrese el DNI del comprador: ');
        readln(v.DNI);
        writeln('Ingrese la cantidad de entradas adquiridas: ');
        readln(v.cantEntradas);
    end;
end;
procedure insertarOrdenado(var l: lista; v: venta);
var
    ant, act, nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := v;
    act := l;
    ant := l;
    while (act <> nil) and (act^.dato.numEvento < v.numEvento) do
    begin
        ant := act;
        act := act^.sig;
    end;
    if (ant = act) then
        l := nuevo
    else
        ant^.sig := nuevo;
    nuevo^.sig := act;
end;
procedure cargarLista(var l: lista);
var
    v: venta;
begin
    leerVenta(v);
    while (v.codigoVenta <> -1) do
    begin
        insertarOrdenado(l, v);
        leerVenta(v);
    end;
end;
function cumpleDNI(DNI: integer): boolean;
var
    cantPares, cantImpares, digito: integer;
begin
    cantPares:= 0;
    cantImpares:= 0;
    while (DNI <> 0)do
    begin
        digito:= DNI mod 10;
        if (digito mod 2 = 0) then
            cantPares:= cantPares + 1
        else
            cantImpares:= cantImpares + 1;
        DNI:= DNI div 10;
    end;
    cumpleDNI:= cantPares > cantImpares;
end;
procedure minimos(montoEvento: real; nomEvento: string; lugEvento: string; var min1, min2: real; var nomMin1, nomMin2, lugMin1, lugMin2: string);
begin
    if (montoEvento < min1) then
    begin
        min2:= min1;
        min1:= montoEvento;
        nomMin2:= nomMin1;
        nomMin1:= nomEvento;
        lugMin2:= lugMin1;
        lugMin1:= lugEvento;
    end
    else
        if (montoEvento < min2) then
        begin
            min2:= montoEvento;
            nomMin2:= nomEvento;
            lugMin2:= lugEvento;
        end;
end;
procedure procesarLista(l: lista; v: eventos);
var
    min1, min2, montoEvento: real;
    nomMin1, nomMin2, lugMin1, lugMin2: string;
    cantEntradasCumple: integer;
    eventoActual: rango;
begin
    min1:= 99999;
    min2:= 99999;
    nomMin1 := '';
    nomMin2 := '';
    lugMin1 := '';
    lugMin2 := '';
    cantEntradasCumple:= 0;
    while(l<>nil) do
        begin
            eventoActual:= l^.dato.numEvento;
            montoEvento:= 0;
            while ((l<>nil) and (l^.dato.numEvento = eventoActual)) do
                begin
                    montoEvento:= montoEvento + (l^.dato.cantEntradas * v[eventoActual].costoEntrada);
                    if(eventoActual = 50) then v[eventoActual].cantMaxPersonas:= v[eventoActual].cantMaxPersonas - l^.dato.cantEntradas;
                    if((cumpleDNI(l^.dato.DNI)) and (v[eventoActual].tipo = 3)) then cantEntradasCumple:= cantEntradasCumple + l^.dato.cantEntradas;
                    l:= l^.sig;
                end;
            minimos(montoEvento, v[eventoActual].nombreEvento, v[eventoActual].lugar, min1, min2, nomMin1, nomMin2, lugMin1, lugMin2);
        end;
    writeln('Los dos eventos que han tenido menos recaudacion son: ', nomMin1, ' en ', lugMin1, ' y ', nomMin2, ' en ', lugMin2);
    writeln('La cantidad de entradas vendidas cuyo comprador contiene en su DNI mas digitos pares que impares y que son para el evento de tipo "obra de teatro" es: ', cantEntradasCumple);
    writeln('La cantidad de entradas vendidas para el evento numero 50 alcanzo la cantidad maxima de personas permitidas: ', v[50].cantMaxPersonas = 0);
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do
        begin
            writeln('COD=', l^.dato.codigoVenta, ' NUM=', l^.dato.numEvento, ' DNI=', l^.dato.DNI, ' CANT=', l^.dato.cantEntradas);
            l:= l^.sig;
        end;
end;
var
    l: lista;
    v: eventos;
begin
    l:= nil;
    cargarVector(v);
    cargarLista(l);
    imprimirLista(l);
    procesarLista(l, v);
end.