{12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece:
1)Musculación, 2)Spinning, 3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla con
información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el
nombre, DNI, edad y tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción.
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a CrossFit o a
Todas las clases. Esta lista debe estar ordenada por DNI.}

program ejercicio12;
const
    DIMF=4;
type
    rangoSuscripcion = 1..DIMF;
    vecSuscripciones = array[rangoSuscripcion] of real;

    cliente=record
        nombre:string;
        dni:integer;
        edad:integer;
        tipoSuscripcion:rangoSuscripcion;
    end;

    lista=^nodo;
    nodo=record
        dato:cliente;
        sig:lista;
    end;

    cli = record
        nombre:string;
        dni:integer;
    end;

    listaCli = ^nodoCli;
    nodoCli = record
        dato:cli;
        sig:listaCli;
    end;

    vecCantClientes = array[rangoSuscripcion] of integer;
procedure cargarSuscripciones(var vs:vecSuscripciones);
var
    i:rangoSuscripcion;
begin
    for i:= 1 to DIMF do begin
        writeln('Ingrese costo de suscripcion ',i,': ');
        readln(vs[i]);
    end;
end;
procedure leerCliente(var c:cliente);
begin
    writeln('Ingrese el DNI del cliente:');
    readln(c.dni);
    if (c.dni <> 0) then begin
        writeln('Ingrese el nombre del cliente:');
        readln(c.nombre);
        writeln('Ingrese la edad del cliente:');
        readln(c.edad);
        writeln('Ingrese el tipo de suscripcion del cliente:');
        readln(c.tipoSuscripcion);
    end;
end;
procedure agregarAdelante(var l:lista; c:cliente);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.dato:=c;
    nuevo^.sig:=l;
    l:=nuevo;
end;
procedure cargarLista(var l:lista);
var
    c: cliente;
begin
    leerCliente(c);
    while (c.dni <> 0) do begin
        agregarAdelante(l,c);
        leerCliente(c);
    end;
end;
procedure inicializarVector(var vc:vecCantClientes);
var
    i:rangoSuscripcion;
begin
    for i:= 1 to DIMF do
        vc[i]:=0;
end;
procedure insertar(var l: listaCli; n:string; d:integer);
var
    ant, act, nuevo: listaCli;
begin
    new(nuevo);
    nuevo^.dato.nombre := n;
    nuevo^.dato.dni := d;
    act := l;
    ant := l;
    while (act <> nil) and (act^.dato.dni < d) do
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
procedure procesarLista(l:lista; var vc:vecCantClientes; vs:vecSuscripciones; var lc:listaCli; var gananciaTotal:real);
begin
    while(l<>nil) do
        begin
            gananciaTotal:= gananciaTotal + vs[l^.dato.tipoSuscripcion];
            vc[l^.dato.tipoSuscripcion]:= vc[l^.dato.tipoSuscripcion] + 1;
            if((l^.dato.edad > 40) and ((l^.dato.tipoSuscripcion = 3) or (l^.dato.tipoSuscripcion = 4))) then
                insertar(lc,l^.dato.nombre, l^.dato.dni);
            l:= l^.sig;
        end;
end;
procedure suscripcionesConMasClientes(vc:vecCantClientes; var posMax1, posMax2: rangoSuscripcion);
var
    i: rangoSuscripcion;
    max1, max2: integer;
begin
    max1:= -1;
    max2:= -1;
    for i:= 1 to DIMF do
        begin
            if(vc[i] > max1) then
                begin
                    max2:= max1;
                    posMax2:= posMax1;
                    max1:= vc[i];
                    posMax1:= i;
                end
            else
                if(vc[i] > max2) then
                    begin
                        max2:= vc[i];
                        posMax2:= i;
                    end;
        end;
end;
procedure imprimirLista(l:listaCli);
begin
    while(l<>nil) do
        begin
            writeln('Nombre: ',l^.dato.nombre,' DNI: ',l^.dato.dni);
            l:= l^.sig;
        end;
end;
var
    vs:vecSuscripciones;
    l:lista;
    vc:vecCantClientes;
    lc:listaCli;
    gananciaTotal:real;
    posMax1, posMax2: rangoSuscripcion;
begin
    l:=nil;
    lc:=nil;
    gananciaTotal:=0;
    cargarSuscripciones(vs);
    cargarLista(l);
    inicializarVector(vc);
    procesarLista(l,vc,vs,lc,gananciaTotal);
    writeln('La ganancia total de Fortaco''s es: ',gananciaTotal:0:2);
    suscripcionesConMasClientes(vc,posMax1,posMax2);
    writeln('Las dos suscripciones con mas clientes son: ', posMax1,' y ',posMax2);
    writeln('Lista de clientes mayores a 40 anios suscritos a CrossFit o a Todas las clases: ');
    imprimirLista(lc);
end.
