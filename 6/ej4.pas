{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

program ej4;
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

procedure imprimirLista(L:lista);
begin
    writeln('............');
    while(L<>nil) do
    begin
        writeln(L^.num);
        L:=L^.sig;
    end;
end;

function elementoMaximo(lis:lista):integer;
var
    max:integer;
begin
    max:=-32768;
    while(lis<>nil) do
    begin
        if(lis^.num>max) then
            max:=lis^.num;
        lis:=lis^.sig;
    end;
    elementoMaximo:=max;
end;

function elementoMinimo(lis:lista):integer;
var
    min:integer;
begin
    min:=32767;
    while(lis<>nil) do
    begin
        if(lis^.num<min) then
            min:=lis^.num;
        lis:=lis^.sig;
    end;
    elementoMinimo:=min;
end;

function cantidadMultiplos(l:lista; valor:integer):integer;
var
    contador:integer;
begin
    contador:=0;
    while(l<>nil) do
    begin
        if((l^.num MOD valor)=0) then contador:=contador+1;
        l:=l^.sig;
    end;
    cantidadMultiplos:=contador;
end;

var
    pri: lista;
    valor: integer;
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

    writeln('Ingrese un valor: '); readln(valor);
    writeln('La cantidad de multiplos de ', valor, ' es de ',cantidadMultiplos(pri, valor));

    writeln('El elemento maximo fue: ',elementoMaximo(pri));
    writeln('El elemento minimo fue: ',elementoMinimo(pri));
end.