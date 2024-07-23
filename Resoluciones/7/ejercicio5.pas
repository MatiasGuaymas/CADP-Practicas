{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).
Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program ejercicio5;

const
    cantCamiones = 10; {Deberían ser 100 por enunciado, pongo menos para probarlo}

type
    codigoCamion = 1..cantCamiones;
    
    camion = record         // Se dispone
        patente: string;
        anio: integer;
        capacidad: real;
    end;
    
    infoCamiones = array [codigoCamion] of camion; // Se dispone
    
    viaje = record
        codeV: integer;
        codeC: codigoCamion;
        dist: real;
        ciudad: string;
        anio: integer;
        dni: longint;
    end;
    
    lista =^nodo;
    nodo = record
        dato: viaje;
        sig: lista;
    end;

    vecSuma = array [codigoCamion] of real;

{ZONA DE MODULOS}    
procedure cargarUnCamion(var c: camion); // Se dispone
begin
    writeln;
    write('Ingrese patente: ');
    readln(c.patente);
    write('Ingrese año: ');
    readln(c.anio);
    write('Ingrese capacidad: ');
    readln(c.capacidad);
    writeln;
end;


procedure cargarCamiones (var vC: infoCamiones); // Se dispone
var
    i: integer;
    c: camion;

begin
    for i := 1 to cantCamiones do
    begin
        cargarUnCamion(c);
        vC[i] := c;
    end;
end;


procedure insertarOrdenado (var l: lista; v: viaje);
var
    nue: lista;
    act, ant: lista;

begin
    new(nue);
    nue^.dato := v;
    
    ant := l;
    act := l; 
    
    if (l = nil) then
        l := nue
    else
    begin

        while (act <> nil) and (v.codeC > act^.dato.codeC) do 
        begin
            ant := act;
            act := act^.sig;
        end;
    
    
        if (act = ant) then
        begin
            nue^.sig := l;
            l := nue;
        end
        else
        begin
            ant^.sig := nue;
            nue^.sig := act;
        end
    end;
end;


procedure cargarViaje (var v: viaje);
begin
    write('Ingrese codigo de viaje: ');
    readln(v.codeV);
    if (v.codeV <> -1) then
    begin
        write('Ingrese codigo de camion: ');
        readln(v.codeC);
        write('Ingrese distancia: ');
        readln(v.dist);
        write('Ingrese ciudad: ');
        readln(v.ciudad);
        write('Ingrese año: ');
        readln(v.anio);
        write('Ingrese dni: ');
        readln(v.dni);
    end;
end;


procedure cargarLista (var l: lista);
var
    v: viaje;
    
begin
    cargarViaje(v);
    writeln;
    while (v.codeV <> -1) do
    begin
        insertarOrdenado(l, v);
        cargarViaje(v);
        writeln;
    end;
end;


procedure imprimirViaje (v: viaje);
begin
    writeln;
    writeln('Codigo de camion: ', v.codeC);
    writeln('Codigo de viaje: ', v.codeV);
    writeln('Distancia: ', v.dist:2:2);
    writeln('Ciudad: ', v.ciudad);
    writeln('Año: ', v.anio);
    writeln('DNI: ', v.dni);
    writeln;
end;


procedure imprimirLista (l: lista);
begin
    while (l <> nil) do
    begin
        imprimirViaje(l^.dato);
        l := l^.sig;
    end;
end;


{1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.}
procedure actualizarMax (var maxKm: real; var maxPat: string; kmAct: real; patAct: string);
begin
    if (kmAct > maxKm) then
    begin
        maxKm := kmAct;
        maxPat := patAct;
    end;
end;


procedure actualizarMin(var minKm: real; var minPat: string; kmAct: real; patAct: string);
begin
    if (kmAct < minKm) then
    begin
        minKm:=kmAct;
        minPat:=patAct;
    end;
end;


{2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).}
function cumpleCondicionCapacidadyAntiguedad (c: camion; anioDelViaje: integer): boolean;
begin
    cumpleCondicionCapacidadyAntiguedad := (c.capacidad > 30.5) and (anioDelViaje - c.anio > 5);
end;  


{3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}
procedure informaCodeVdeDNIimpar (dni: longint; codeV: integer);
var 
    dig: integer;
    cumple : boolean;

begin
    cumple := true;
    while (dni <> 0) do 
    begin
        dig := dni MOD 10;
        if (dig MOD 2 <> 0) then
            cumple := false;
        dni := dni DIV 10;
    end;
    
    if (cumple) then
        writeln ('Codigo de viaje DNI impar: ', codeV);
    writeln;
end;


{Recorrer lista y recabar información}
procedure corteDeControl(l: lista; vecCamiones : infoCamiones);
var 
    camionActual: integer;
    sumaKms: real;
    patenteAct: string;

begin
    camionActual := l^.dato.codeC;
    
    while ((l <> nil) and (camionActual = l^.dato.codeC)) do
    begin
        
    end;
end;



{PROGRAMA PRINCIPAL}
var
    l: lista;
    vecCamiones: infoCamiones; // Se dispone

begin
    l := nil;
    
    cargarCamiones(vecCamiones); //Se dispone
    cargarLista(l);
    imprimirLista(l);
end.
