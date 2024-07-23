{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su
descubrimiento.
A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.
B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares}

program ejercicio6;
type

    cat = 1..7;
    str40 = string[40];
    
    cantXCate = array [cat] of integer;
    
    objeto = record
        codigo: integer;
        categoria: cat;
        nombre: str40;
        distancia: real;
        nombreDesc: str40;
        anio: integer;
    end;
    
    lista=^nodo;
    nodo = record
        dato: objeto;
        sig: lista;
    end;



procedure agregarAtras (var L, ult: lista; o: objeto);
var
    nue: lista;

begin
    new(nue);
    nue^.dato := o;
    
    if (L = nil) then
        L := nue
    else
        ult^.sig:=nue;
    ult:=nue;
end;


procedure cargarObjeto (var o: objeto);
begin
    write('Ingrese codigo: ');
    readln(o.codigo);
    if (o.codigo <> -1) then
    begin
        write('Ingrese categoria: ');
        readln(o.categoria);
        write('Ingrese nombre: ');
        readln(o.nombre);
        write('Ingrese distancia: ');
        readln(o.distancia);
        write('Ingrese nombre del descubridor: ');
        readln(o.nombreDesc);
        write('Ingrese año de descubrimiento: ');
        readln(o.anio);
    end;
    writeln;
end;


procedure cargarLista (var L: lista);
var
    o: objeto;
    ult: lista;

begin
    cargarObjeto(o);
    while (o.codigo <> -1) do
    begin
        agregarAtras(l, ult, o);
        cargarObjeto(o);
    end;
end;


procedure imprimirObjeto (o: objeto);
begin
    write('Codigo: ');
    writeln(o.codigo);
    write('Categoria: ');
    writeln(o.categoria);
    write('Nombre: ');
    writeln(o.nombre);
    write('Distancia: ');
    writeln(o.distancia:2:2);
    write('Nombre del descubridor: ');
    writeln(o.nombreDesc);
    write('Año de descubrimiento: ');
    writeln(o.anio);
    writeln;
end;


procedure imprimirLista (l: lista);
begin
    while (l <> nil) do
    begin
        imprimirObjeto(l^.dato);
        l:= l^.sig;
    end;
end;


procedure masLejanos (l: lista; var max1, max2: real; var cMax1, cMax2: integer);
begin
    if (l^.dato.distancia > max1) then
    begin
        max2:=max1;
        cMax2:=cMax1;
        max1:= l^.dato.distancia;
        cMax1:= l^.dato.codigo;
    end
    else if (l^.dato.distancia > max2) then
    begin
        max2:= l^.dato.distancia;
        cMax2:= l^.dato.codigo; 
    end;
end;


procedure Galileo (descubridor: str40; var contador: integer);
begin
    if (descubridor = 'Galileo Galilei') then
        contador := contador + 1;
end;


procedure inicializarContCatEn0 (var v: cantXCate);
var
    i: integer;

begin
    for i := 1 to 7 do
        v[i]:= 0;
end;


procedure contarCategorias (c: integer; var v: cantXCate);
begin
    v[c] := v[c] + 1;
end;


procedure imprimirVector (v: cantXCate);
var
    i: integer;

begin
    for i := 1 to 7 do
    begin
        write(i, ': ');
        writeln(v[i]);
    end;
end;


{procedure masPqI (c: integer; var Lmpi: lista);
var
    contI, contP: integer;
    aux: integer;
    nue: lista;
begin
    contP, contI:=0;
    
    while (c <> 0) do 
    begin
        aux:= c mod 2;
        if (aux = 0) then
            contP:=contP+1;
        else
            contI:=contI + 1;
        c := c div 10;
    end;
    
    if (contP > contI) then
        new(nue);
        
end;}


procedure realizarInforme (l: lista);
var
    max1, max2: real;
    cMax1, cMax2: integer;
    contGG: integer;
    contCate: cantXCate;

begin
    writeln('INFORMANDO...');
    
    max1:= -1;
    contGG:= 0;
    inicializarContCatEn0(contCate);
    
    while (l <> nil) do 
    begin
        masLejanos(l, max1, max2, cMax1, cMax2);
        Galileo(l^.dato.nombreDesc, contGG);
        contarCategorias(l^.dato.categoria, contCate);
        l:= l^.sig;
    end;
    
    writeln('Los objetos más lejanos son los de codigo ', cMax1, ' y ', cMax2);
    writeln;
    
    writeln('Se ingresaron ', contGG, ' objetos descubiertos por Galileo Galilei');
    writeln;
    
    writeln('La cantidad de objetos ingresados por categría, son: ');
    imprimirVector(contCate);
    writeln; 
end;



{ Programa principal }
var
    l: lista;

begin
    l:=nil;
    cargarLista(l);
    imprimirLista(l);
    realizarInforme(l);
    writeln('Falta resolver inciso D');
end.
