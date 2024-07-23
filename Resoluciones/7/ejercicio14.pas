{14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).
Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue
prestado. Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.}

program ejercicio14;
const
    DIMF = 3;
type
    subDia = 1..DIMF;
    prestamo = record
        nroPrestamo: integer;
        ISBN: integer;
        nroSocio: integer;
        dia: subDia;
    end;
    lista = ^nodo;
    libroISBN = record
        ISBN: integer;
        cantPrestamos: integer;
    end;
    nodo = record
        dato: libroISBN;
        sig: lista;
    end;
    vecDia = array[subDia] of integer;
procedure leerPrestamo(var p: prestamo);
begin
    writeln('Ingrese el ISBN del libro');
    readln(p.ISBN);
    if (p.ISBN <> -1) then begin
        writeln('Ingrese el numero de prestamo');
        readln(p.nroPrestamo);
        writeln('Ingrese el numero de socio');
        readln(p.nroSocio);
        writeln('Ingrese el dia del prestamo');
        readln(p.dia);
    end;
end;
procedure agregarAdelante(var l: lista; isbn, cantPrestamos: integer);
var
    nuevo: lista;
begin
    new(nuevo);
    nuevo^.dato.ISBN:= isbn;
    nuevo^.dato.cantPrestamos:= cantPrestamos;
    nuevo^.sig:= l;
    l:= nuevo;
end;
procedure cargarListaProcesar(var l: lista; var v: vecDia; var porcentaje: real);
var
    i: subDia;
    p: prestamo;
    isbnActual, cantPrestamos, totalPrestamos, totalCumpleCondicion: integer;
begin
    leerPrestamo(p);
    totalPrestamos:= 0;
    totalCumpleCondicion:= 0;
    while (p.ISBN <> -1) do begin
        isbnActual:= p.ISBN;
        cantPrestamos:= 0;
        while ((p.ISBN <> -1) and (p.ISBN = isbnActual)) do begin
            cantPrestamos:= cantPrestamos + 1;
            v[p.dia]:= v[p.dia] + 1;
            if ((p.nroPrestamo mod 2 = 1) and (p.nroSocio mod 2 = 0)) then
                totalCumpleCondicion:= totalCumpleCondicion + 1;
            leerPrestamo(p);
        end;
        totalPrestamos:= totalPrestamos + cantPrestamos;
        agregarAdelante(l, isbnActual, cantPrestamos);
    end;
    porcentaje:= totalCumpleCondicion / totalPrestamos * 100;
end;
procedure minimoVector(v: vecDia; var minDia: subDia);
var
    i: subDia;
    min: integer;
begin
    min:= 9999;
    for i:= 1 to DIMF do begin
        if (v[i] < min) then begin
            min:= v[i];
            minDia:= i;
        end;
    end;
end;
procedure inicializarVector(var v: vecDia);
var
    i: subDia;
begin
    for i:= 1 to DIMF do
        v[i]:= 0;
end;
procedure imprimirLista(l: lista);
begin
    while (l <> nil) do begin
        writeln('ISBN: ', l^.dato.ISBN, ' - Cantidad de prestamos: ', l^.dato.cantPrestamos);
        l:= l^.sig;
    end;
end;
var
    l: lista;
    v: vecDia;
    porcentaje: real;
    minDia: subDia;
begin
    l:= nil;
    porcentaje:= 0;
    inicializarVector(v);
    cargarListaProcesar(l, v, porcentaje);
    minimoVector(v, minDia);
    writeln('Dia con menos prestamos: ', minDia);
    writeln('Porcentaje de prestamos que cumplen la condicion: ', porcentaje:0:2);
    writeln('Lista de prestamos:');
    imprimirLista(l);
end.

