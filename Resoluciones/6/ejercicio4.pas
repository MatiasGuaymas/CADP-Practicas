{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de
elementos de la lista que son múltiplos de A.}

program ejercicio4;
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
function maximoLista(l: lista): integer;
var
	max: integer;
begin
	max:= -1;
	while(l <> nil) do
		begin
			if(l^.num > max) then	
				max:= l^.num;
			l:= l^.sig;
		end;
	maximoLista:= max;
end;
function minimoLista(l: lista): integer;
var
	min: integer;
begin
	min:= 9999;
	while(l <> nil) do
		begin
			if(l^.num < min) then	
				min:= l^.num;
			l:= l^.sig;
		end;
	minimoLista:= min;
end;
function multiplosLista(l: lista; a: integer): integer;
var
	cant: integer;
begin
	cant:= 0;
	while(l <> nil) do
		begin
			if(l^.num mod a = 0) then
				cant:= cant + 1;
			l:= l^.sig;
		end;
	multiplosLista:= cant;
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
    {writeln('Ingrese un valor');
    readln(valor);
    writeln('Lista actualizada:');
    incrementarLista(pri, valor);
    imprimirLista(pri);}
    writeln('El elemento de valor maximo en la lista es: ', maximoLista(pri));
    writeln('El elemento de valor minimo en la lista es: ', minimoLista(pri));
    writeln('Ingrese un valor entero A');
    readln(valor);
    writeln('La cantidad de elementos de la lista que son multiplos de A es: ', multiplosLista(pri, valor));
end.
