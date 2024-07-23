{6) Realizar un programa que ocupe 50 KB de memoria en total. Para ello:
a) El programa debe utilizar sólo memoria estática
b) El programa debe utilizar el 50% de memoria estática y el 50% de memoria dinámica
c) El programa debe minimizar tanto como sea posible el uso de la memoria estática (a lo sumo, 4
bytes}


//--------------------------------A--------------------------------
program ejercicio6A;
type
    dosReales=record
        r1:real;
        r2:real;
    end;

    vectorDeReales=array[1..3200] of dosReales;
var
    vec:vectorDeReales;
begin
    writeln('La variable ocupa un espacio de ', SizeOf(vec),' bytes.'); //51200 bytes = 50KB
end.

//--------------------------------B--------------------------------
program ejercicio6B;
type
    vectorReales=array[1..3200] of real;
    punteroVector=^vectorReales;
var
    vec1:vectorReales;
    vec2:punteroVector; //4 bytes de memoria estatica
begin
    writeln('En memoria estatica se ocupan ',SizeOf(vec1),' bytes.'); //25600 bytes = 25KB (de memoria estatica)
    new(vec2);
    writeln('En memoria dinamica se ocupan ',SizeOf(vec2^),' bytes.'); //25600 bytes = 25KB (de memoria dinamica) + 25KB (de memoria estatica) = 50KB memoria
    dispose(vec2);
end.

//--------------------------------C--------------------------------
program ejercicio6C;
type
   dosReales=record
        r1:real;
        r2:real;
    end;

    vectorDeReales=array[1..3200] of dosReales;
var
    punteroVector:^vectorDeReales; //4 bytes de memoria estatica
begin
    new(punteroVector);
    writeln('El espacio ocupado en memoria estatica es de ',SizeOf(punteroVector),' bytes'); //51200 bytes = 50KB (de memoria dinamica)
    dispose(punteroVector);
end.