{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene: 
código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 
5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha 
estructura no posee orden alguno. 
Se pide: a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se 
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI 
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura finaliza 
cuando se lee el código de película -1 y la información viene ordenada por código de película.  
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.  
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares 
que impares en su DNI. 
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe como 
parámetro (el mismo puede no existir). }

program ejercicio9;
type
    subCod = 1..8;
    pelicula = record
        codPelicula: integer;
        titulo: string;
        codGenero: subCod;
        puntaje: real;
    end;
    criticas = record
        DNI: integer;
        apellido: string;
        nombre: string;
        codPelicula: integer;
        puntaje: real;
    end;
    lista = ^nodo;
    nodo = record
        dato: pelicula;
        sig: lista;
    end;
    vecPuntajes = array[subCod] of real;
procedure leerPelicula(var p: pelicula);
begin
    writeln('Ingrese el codigo de la pelicula');
    readln(p.codPelicula);
    if (p.codPelicula <> -1) then begin
        writeln('Ingrese el titulo de la pelicula');
        readln(p.titulo);
        writeln('Ingrese el codigo de genero');
        readln(p.codGenero);
        writeln('Ingrese el puntaje promedio');
        readln(p.puntaje);
    end;
end;
procedure agregarAdelante(var l: lista; p: pelicula);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato := p;
    nuevo^.sig := l;
    l := nuevo;
end;
procedure cargarLista(var l: lista);
var
    p: pelicula;
begin
    leerPelicula(p);
    while (p.codPelicula <> -1) do begin
        agregarAdelante(l, p);
        leerPelicula(p);
    end;
end;
procedure leerCritica(var c: criticas);
begin
    writeln('Ingrese el codigo de la pelicula');
    readln(c.codPelicula);
    if (c.codPelicula <> -1) then begin
        writeln('Ingrese el DNI del critico');
        readln(c.DNI);
        writeln('Ingrese el apellido del critico');
        readln(c.apellido);
        writeln('Ingrese el nombre del critico');
        readln(c.nombre);
        writeln('Ingrese el puntaje');
        readln(c.puntaje);
    end;
end;
procedure busqueda(l: lista; codigo: integer; puntaje: real);
begin
    while (l <> nil) and (l^.dato.codPelicula <> codigo) do
        l := l^.sig;
    if (l <> nil) then
        l^.dato.puntaje := puntaje;
end;
function cumple(dni: integer): boolean;
var
    pares, impares: integer;
begin
    pares:= 0;
    impares:= 0;
    while(dni <> 0) do begin
        if((dni mod 10) mod 2 = 0) then
            pares:= pares + 1
        else
            impares:= impares + 1;
        dni:= dni div 10;
    end;
    cumple:= pares = impares;
end;
procedure actualizarLista(l: lista);
var
    c: criticas;
    puntaje: real;
    codigoActual, cantCriticas: integer;
    aux: lista;
begin
    leerCritica(c);
    while(c.codPelicula <> -1) do begin
        cantCriticas:= 0;
        puntaje:= 0;
        codigoActual:= c.codPelicula;
        while((c.codPelicula <> -1) and (c.codPelicula = codigoActual)) do begin
            if(cumple(c.DNI)) then
                writeln('El critico ', c.nombre, ' ', c.apellido, ' cumple con la condicion');
            puntaje:= puntaje + c.puntaje;
            cantCriticas:= cantCriticas + 1;
            leerCritica(c);
        end;
        busqueda(l, codigoActual, puntaje/cantCriticas)
    end;
end;
procedure procesarLista(l: lista; var v: vecPuntajes);
begin
    while (l <> nil) do begin
        v[l^.dato.codGenero]:= v[l^.dato.codGenero] + l^.dato.puntaje;
        l:= l^.sig;
    end;
end;
procedure eliminarPelicula(var l: lista; codigo: integer);
var
    act, ant: lista;
begin
    act:= l;
    while(act <> nil) and (act^.dato.codPelicula <> codigo) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil) then begin
        if(act = l) then
            l:= l^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;
procedure inicializarVector(var v: vecPuntajes);
var
    i: subCod;
begin
    for i:= 1 to 8 do
        v[i]:= 0;
end;
procedure imprimirVector(v: vecPuntajes);
var
    i: subCod;
begin
    for i:= 1 to 8 do
        writeln('El genero ', i, ' tiene un puntaje de ', v[i]:0:2);
end;
procedure maximoVector(v: vecPuntajes; var codMax: subCod);
var
    i: subCod;
    max: real;
begin
    max:= -1;
    for i:= 1 to 8 do begin
        if(v[i] > max) then begin
            max:= v[i];
            codMax:= i;
        end;
    end;
end;
procedure imprimirLista(l: lista);
begin
    while (l <> nil) do begin
        writeln('CODPELI: ', l^.dato.codPelicula, ' TITULO: ', l^.dato.titulo, ' CODGENERO: ', l^.dato.codGenero, ' PUNTAJE: ', l^.dato.puntaje:0:2);
        l:= l^.sig;
    end;
end;
var
    l: lista;
    v: vecPuntajes;
    codMax: subCod;
    cod: integer;
begin
    l:= nil;
    cargarLista(l);
    inicializarVector(v);
    actualizarLista(l);
    procesarLista(l, v);
    imprimirVector(v);
    maximoVector(v, codMax);
    writeln('El genero con mas puntaje es: ', codMax);
    imprimirLista(l);
    writeln('Ingrese el codigo de la pelicula a eliminar');
    readln(cod);
    eliminarPelicula(l, cod);
    imprimirLista(l);
end.
