{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que
fueron ingresados, manteniendo un puntero al último ingresado.}

program ejercicio3;
type
	lista = ^nodo;
	nodo = record
		dato : integer;
		sig : lista;
	end;
procedure armarNodo(var l: lista; elem: integer);
var
	nuevo, aux: lista;
begin
	new(nuevo);
	nuevo^.dato:= elem;
	nuevo^.sig:= nil;
	if(l = nil) then l:= nuevo
	else
		begin
			aux:= l;
			while(aux^.sig <> nil) do
				aux:= aux^.sig;
			aux^.sig:= nuevo;
		end;
end;
procedure armarNodoDosPunteros(var pI, pU: lista; num: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.dato:= num;
	aux^.sig:= nil;
	if(pI = nil) then
		begin
			pI:= aux;
			pU:= aux;
		end
	else
		begin
			pU^.sig:= aux;
			pU:= aux;
		end;
end;
procedure cargarLista1(var l: lista);
var
	num: integer;
begin
	writeln('Ingrese numero');
	readln(num);
	while(num <> 0) do
		begin
			armarNodo(l, num);
			writeln('Ingrese numero');
			readln(num);
		end;
end;
procedure cargarLista2(var l: lista);
var
	num: integer;
	pU: lista;
begin
	writeln('Ingrese numero');
	readln(num);
	while(num <> 0) do
		begin
			armarNodoDosPunteros(l, pU, num);
			writeln('Ingrese numero');
			readln(num);
		end;
end;
procedure imprimirLista(l: lista);
begin
	while(l<>nil) do
		begin
			writeln(l^.dato);
			l:= l^.sig;
		end;
end;
var
	l1, l2: lista;
begin
	l1:= nil;
	l2:= nil;
	cargarLista1(l1);
	cargarLista2(l2);
    writeln('Lista con un unico puntero');
	imprimirLista(l1);
    writeln('Lista con dos punteros');
	imprimirLista(l2);
end.