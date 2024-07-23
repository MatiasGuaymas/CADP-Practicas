{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o
false en caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si
existe). Nota: la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista
con todos los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
de manera descendente.}

program ejercicio9;
type
	lista = ^nodo;
	nodo = record
		dato: integer;
		sig: lista;
	end;
procedure armarNodo(var l: lista; num: integer);
var
	aux, ant, act: lista;
begin
	new(aux);
	aux^.sig:= nil;
	aux^.dato:= num;
	if(l = nil) then l:= aux
	else
		begin
			act:= l; 
			ant:= l;
			while(act <> nil) and (act^.dato < aux^.dato) do
				begin
					ant:= act;
					act:= act^.sig;
				end;
			if(act = l) then
				begin
					aux^.sig:= l;
					l:= aux;
				end
			else
				begin
					ant^.sig:= aux;
					aux^.sig:= act;
				end;
		end;
end;
procedure cargarLista(var l: lista);
var
	num: integer;
begin
	writeln('Ingrese un numero entero');
	readln(num);
	while(num <> 0) do
		begin
			armarNodo(l, num);
			writeln('Ingrese un numero entero');
			readln(num);
		end;
end;
procedure imprimirLista(l: lista);
begin
    while(l<>nil) do 
        begin
            write(l^.dato, ' - ');
            l:= l^.sig;
        end;
end;
function EstaOrdenada(l: lista): boolean;
var
    act: lista;
begin
    if (l = nil) or (l^.sig = nil) then
    begin
        EstaOrdenada := true;
        exit; //Funcion de Pascal para salir automaticamente del modulo sin ejecutar las siguientes lineas
    end;
    act := l;
    while act^.sig <> nil do
    begin
        if act^.dato > act^.sig^.dato then
        begin
            EstaOrdenada := false;
            Exit;
        end;
        act := act^.sig;
    end;
    EstaOrdenada := True;
end;
procedure Eliminar(var l: lista; num: integer);
var
	act,ant:lista;
begin
	act:=l; 	
	while (act <> nil) and (act^.dato <> num) do begin
		ant:=act; 
		act:= act^.sig;
	end;
	if (act <> nil) then begin
		if (act = l) then 
			l:= l^.sig
		else
			ant^.sig:= act^.sig;
		dispose (act);
	end;
end;
procedure agregarAdelante(var l: lista; num: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.sig:= l;
	l:= aux;
	aux^.dato:= num;
end;
procedure Sublista(l: lista; numA, numB: integer; var lisNueva: lista);
begin
	while(l <> nil) do
		begin
			if(l^.dato > numA) and (l^.dato < numB) then
				agregarAdelante(lisNueva, l^.dato);
			l:= l^.sig;
		end;
end;
procedure SublistaOrdAsc(l: lista; numA, numB: integer; var lisNueva: lista);
begin
	while((l <> nil) and (l^.dato < numB)) do
		begin
			if(l^.dato > numA) then
				agregarAdelante(lisNueva, l^.dato);
			l:= l^.sig;
		end;
end;
procedure SublistaOrdDesc(l: lista; numA, numB: integer; var lisNueva: lista);
begin
	while((l <> nil) and (l^.dato > numA)) do
		begin
			if(l^.dato < numB) then
				agregarAdelante(lisNueva, l^.dato);
			l:= l^.sig;
		end;
end;
var
	l, lisNueva1, lisNueva2, lisNueva3: lista;
	num, numA, numB: integer;
begin
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
	writeln('La lista esta ordenada: ', EstaOrdenada(l));
	writeln('Ingrese un numero a eliminar de la lista:');
	readln(num);
	Eliminar(l, num);
	imprimirLista(l);
    writeln();
	writeln('Ingrese un numero A');
	readln(numA);
	writeln('Ingrese un numero B');
	readln(numB);
	lisNueva1:= nil;
	lisNueva2:= nil;
	lisNueva3:= nil;
	writeln('Sublista 1');
	Sublista(l, numA, numB, lisNueva1);
	imprimirLista(lisNueva1);
    writeln();
	writeln('Sublista 2');
	Sublista(l, numA, numB, lisNueva2);
	imprimirLista(lisNueva2);
    writeln();
	writeln('Sublista 3');
	Sublista(l, numA, numB, lisNueva3);
	imprimirLista(lisNueva3);
end.