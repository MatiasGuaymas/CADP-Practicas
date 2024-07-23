{10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program ejercicio10;
const 
    DIMF = 20;
type
    cultivo = record
        tipo: string;
        cantHectareas: integer;
        cantMeses: integer;
    end;
    empresa = record
        codigo: integer;
        nombre: string;
        tipo: string;
        ciudad: string;
        cultivos: array[1..DIMF] of cultivo;
        cantCultivos: integer;
    end;
    lista = ^nodo;
    nodo = record
        dato: empresa;
        sig: lista;
    end;
procedure leerCultivo(var c: cultivo);
begin
    writeln('Ingrese la cantidad de hectareas');
    readln(c.cantHectareas);
    if (c.cantHectareas <> 0) then begin
        writeln('Ingrese el tipo de cultivo');
        readln(c.tipo);
        writeln('Ingrese la cantidad de meses');
        readln(c.cantMeses);
    end;
end;
procedure cargarEmpresa(var e: empresa);
var
    c: cultivo;
begin
    writeln('Ingrese el codigo de la empresa');
    readln(e.codigo);
    if (e.codigo <> -1) then begin
        writeln('Ingrese el nombre de la empresa');
        readln(e.nombre);
        writeln('Ingrese el tipo de empresa');
        readln(e.tipo);
        writeln('Ingrese la ciudad');
        readln(e.ciudad);
        e.cantCultivos:= 0;
        leerCultivo(c);
        while ((c.cantHectareas <> 0) and (e.cantCultivos < DIMF)) do begin
            e.cantCultivos+= 1;
            e.cultivos[e.cantCultivos]:= c;
            leerCultivo(c);
        end;
    end;
end;
procedure agregarAdelante(var l: lista; e: empresa);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := e;
    nuevo^.sig := l;
    l := nuevo;
end;
procedure cargarLista(var l: lista);
var
    e: empresa;
begin
    cargarEmpresa(e);
    while (e.codigo <> -1) do begin
        agregarAdelante(l, e);
        cargarEmpresa(e);
    end;
end;
function cumpleCodigo(codigo: integer): boolean;
var
    cantCeros: integer;
begin
    cantCeros:= 0;
    while ((codigo <> 0) and (cantCeros < 2)) do begin
        if (codigo mod 10 = 0) then
            cantCeros+= 1;
        codigo:= codigo div 10;
    end;
    cumpleCodigo:= cantCeros = 2;
end;
procedure maximo(tiempo: integer; nom: string; var max: integer; var nomMax: string);
begin
    if (tiempo > max) then begin
        max:= tiempo;
        nomMax:= nom;
    end;
end;
procedure procesarLista(l: lista);
var
    totalHectareas, totalHectareasSoja, totalTiempoMaiz, max, i: integer;
    cumpleTrigo: boolean;
    e: empresa;
    nomMax: string;
begin
    totalHectareas:= 0;
    totalHectareasSoja:= 0;
    max:= -1;
    while (l <> nil) do begin
        e:= l^.dato;
        cumpleTrigo:= false;
        totalTiempoMaiz:= 0;
        for i:= 1 to e.cantCultivos do begin
            if(e.cultivos[i].tipo = 'trigo') then
                cumpleTrigo:= true
            else if (e.cultivos[i].tipo = 'soja') then
                totalHectareasSoja := totalHectareasSoja + e.cultivos[i].cantHectareas
            else if (e.cultivos[i].tipo = 'maiz') then
                totalTiempoMaiz := totalTiempoMaiz + e.cultivos[i].cantMeses
            else if (e.cultivos[i].tipo = 'girasol') and (e.tipo <> 'estatal') and (e.cultivos[i].cantHectareas < 5) then
                l^.dato.cultivos[i].cantMeses+= 1;
            totalHectareas:= totalHectareas + e.cultivos[i].cantHectareas;
        end;
        if((cumpleTrigo) and (cumpleCodigo(e.codigo)) and (e.ciudad = 'San Miguel del Monte')) then
            writeln('Empresa que cumple con los requisitos: ', e.nombre);
        maximo(totalTiempoMaiz, l^.dato.nombre, max, nomMax);
        l:= l^.sig;
    end;
    writeln('Porcentaje de hectareas dedicadas al cultivo de soja sobre el total: ', (totalHectareasSoja / totalHectareas * 100):0:2);
    writeln('Empresa que dedica mas tiempo al cultivo de maiz: ', nomMax);
end;    
procedure imprimirLista(l: lista);
var
    i: integer;
begin
    while (l <> nil) do begin
        write('COD= ', l^.dato.codigo, ' NOM= ', l^.dato.nombre, ' TIPO= ', l^.dato.tipo, ' CIUDAD= ', l^.dato.ciudad);
        writeln();
        for i:= 1 to l^.dato.cantCultivos do
            writeln(' TIPO= ', l^.dato.cultivos[i].tipo, ' HECTAREAS= ', l^.dato.cultivos[i].cantHectareas, ' MESES= ', l^.dato.cultivos[i].cantMeses);
        l:= l^.sig;
    end;
end;
var
    l: lista;
begin
    l:= nil;
    cargarLista(l);
    imprimirLista(l);
    procesarLista(l);
    imprimirLista(l);
end.
