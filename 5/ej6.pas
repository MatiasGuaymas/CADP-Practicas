{6) Realizar un programa que ocupe 50 KB de memoria en total. Para ello:
a) El programa debe utilizar sólo memoria estática
b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
c) El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4
bytes)}


{100% memoria estática}
program ej6;
type
    dosReales=record
        r1:real;
        r2:real;
    end;

    vectorDeReales=array[1..3200] of dosReales;
var
    vec:vectorDeReales;
begin
    writeln('La variable ocupa un espacio de ',SizeOf(vec),' bytes.');
end.

{50% memoria estática, 50% memoria dinámica}
program ej6;
type
    vectorReales=array[1..3200] of real;
    punteroVector=^vectorReales;
var
    vec1:vectorReales;
    vec2:punteroVector;
    ocupado:real;
begin
    writeln('En memoria estatica se ocupan ',SizeOf(vec1),' bytes.');
    new(vec2);
    writeln('En memoria dinamica se ocupan ',SizeOf(vec2^),' bytes.');
    ocupado:=(SizeOf(vec1) + SizeOf(vec2^))/1024;
    writeln('Sumados dan un total de ',ocupado:1:2,' KB.');
    dispose(vec2);
end.

{4 bytes memoria estática, resto dinámica}
program ej6;
type
   dosReales=record
        r1:real;
        r2:real;
    end;

    vectorDeReales=array[1..3200] of dosReales;
var
    punteroVector:^vectorDeReales;
begin
    new(punteroVector);
    writeln('El espacio ocupado en memoria estatica es de ',SizeOf(punteroVector),' bytes');
    writeln('En memoria dinamica se ocuparon ',SizeOf(punteroVector^)/1024:1:2,' KB');
    dispose(punteroVector);
end.