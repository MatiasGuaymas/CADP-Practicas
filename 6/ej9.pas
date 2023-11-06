{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.}

program ej9;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

procedure armarNodo(var pi: lista; var pf:lista; v: integer);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if(pi=nil) then begin
        pi:=nuevo;
        pf:=nuevo;
    end
    else begin
        pf^.sig:=nuevo;
        pf:=nuevo;
    end;
end;

procedure generarLista(var pi:lista; var pf:lista);
var
    valor:integer;
begin
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin 
        armarNodo(pi, pf, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
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

function estaOrdenado(l:lista):boolean;
var
    anterior:lista;
    condicion:boolean;
begin
    condicion:=true;
    while((l^.sig<>nil) and (condicion)) do begin   //Verifica que la dirección del nodo siguiente no sea nil
        anterior:=l;
        if(l^.sig^.num<anterior^.num) then condicion:=false //Compara el numero actual con el del nodo siguiente. Este debe ser mayor
        else l:=l^.sig;
    end;
    estaOrdenado:=condicion;
end;

procedure eliminarElemento(var l:lista; var pude:boolean; valor:integer);
var
    actual, anterior:lista;
begin
    pude:=false;
    actual:=l;
    while((actual<>nil) and (actual^.num<>valor)) do
    begin
        anterior:=actual;
        actual:=actual^.sig;
    end;

    if(actual<>nil) then begin
        if(actual=l) then l:=l^.sig
        else anterior^.sig:=actual^.sig;
        pude:=true;
    end;
    dispose(actual);
end; 

procedure subListaDesordenada(l:lista; valorA:integer; valorB:integer; var sublista:lista);
var
    sublistaUlt:lista;
    iteraciones:integer;
begin
    sublista:=nil;
    iteraciones:=0;
    while(l<>nil) do
    begin
        if((l^.num>valorA) and (l^.num<valorB)) then armarNodo(sublista, sublistaUlt, l^.num);
        l:=l^.sig;
        iteraciones:=iteraciones+1;
    end;
    writeln('Iteraciones desordenada: ',iteraciones);
end;        

procedure subListaAscendente(l:lista; valorA:integer; valorB: integer; var sublista:lista);
var
    sublistaUlt:lista;
    iteraciones:integer;
begin
    sublista:=nil;
    iteraciones:=0;
    while((l<>nil) and (l^.num<valorB)) do begin
        if(l^.num>valorA) then armarNodo(sublista, sublistaUlt, l^.num);
        l:=l^.sig;
        iteraciones:=iteraciones+1;
    end;
    writeln('Iteraciones ascendente: ', iteraciones);
end;

procedure sublistaDescendente(l:lista; valorA:integer; valorB:integer; var sublista:lista);
var 
    sublistaUlt:lista;
    iteraciones:integer;
begin
    sublista:=nil;
    iteraciones:=0;
    while((l<>nil) and (l^.num>valorA)) do begin
        if(l^.num<valorB) then armarNodo(sublista, sublistaUlt, l^.num);
        l:=l^.sig;
        iteraciones:=iteraciones+1;
    end;
    writeln('Iteraciones Descendente: ', iteraciones);
end;

var
    pri, ult, sublista:lista;
    valorEliminado, A, B:integer;
    eliminado:boolean;
begin
    pri:= nil;
    generarLista(pri, ult);
    imprimirLista(pri);
    
    if(estaOrdenado(pri)) then writeln('Esta ordenado')
    else writeln('Esta desordenado');
    
    writeln('Ingrese el valor a eliminar'); readln(valorEliminado);
    eliminarElemento(pri, eliminado, valorEliminado);
    if(eliminado) then writeln('El elemento fue eliminado');
    imprimirLista(pri);

    writeln('Ingrese un valor A: '); readln(A);
    writeln('Ingrese un valor B: '); readln(B);
    subListaDesordenada(pri, A, B, sublista);
    imprimirLista(sublista);
    sublistaDescendente(pri, A, B, sublista); 
    //subListaAscendente(pri, A, B, sublista);
    imprimirLista(sublista);
end.