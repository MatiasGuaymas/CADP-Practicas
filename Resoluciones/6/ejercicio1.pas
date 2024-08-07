{1. Dado el siguiente programa:
program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;
var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln(‘Ingrese un numero’);
    read(valor);
    while (valor <> 0) then begin
    armarNodo(pri, valor);
    writeln(‘Ingrese un numero’);
    read(valor);
end;
. . . imprimir lista 
end.
a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la
lista.}

{a. El programa agrega numeros enteros a una lista, utilizando el modulo de agregarAdelante, hasta ingresar el 
numero 0, que no debe procesarse.
b. 48 - 13 - 21 - 10}

program JugamosConListas;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;
procedure armarNodo(var L: lista; v: integer);
var
    aux : lista;
begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do 
        begin
            writeln(l^.num);
            l:= l^.sig;
        end;
end;
procedure incrementarLista(l: lista; num: integer);
begin
    while(l<>nil) do
        begin
            l^.num:= l^.num + num;
            l:= l^.sig;
        end;
end;
var
    pri : lista;
    valor : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
    read(valor);
    end;
    imprimirLista(pri);
    writeln('Ingrese un valor');
    readln(valor);
    writeln('Lista actualizada:');
    incrementarLista(pri, valor);
    imprimirLista(pri);
end.
