{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la
lista queden ordenados de manera ascendente (insertar ordenado).}

program ejercicio8;
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
var
	l: lista;
begin
	l:= nil;
	cargarLista(l);
	imprimirLista(l);
end.