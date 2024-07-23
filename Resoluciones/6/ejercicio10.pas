{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado
por su número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de
clientes en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe
eliminarse de la lista de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero
llegarán todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se
los atenderá de a uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no
debe procesarse.}

program ejercicio10;
type
	cliente = record
		dni: integer;
		num: integer;
	end;
	lista = ^nodo;
	nodo = record
		dato: cliente;
		sig: lista;
	end;
procedure RecibirCliente(var pI, pU: lista; dni: integer);
var
	aux: lista;
begin
	new(aux);
	aux^.dato.dni:= dni;
	aux^.sig:= nil;
	if(pI = nil) then
		begin
			aux^.dato.num:= 1;
			pI:= aux;
			pU:= aux;
		end
	else
		begin
			aux^.dato.num:= pU^.dato.num + 1;
			pU^.sig:= aux;
			pU:= aux;
		end;
end;
procedure AtenderCliente(var l: lista; var num, dni: integer);
var
	aux: lista;
begin
	if(l <> nil) then
		begin
			num:= l^.dato.num;
			dni:= l^.dato.dni;
			aux:= l;
			l:= l^.sig;
			dispose(aux);
		end;
end;
procedure generarLista(var pI, pU: lista);
var
	dni: integer;
begin
	writeln('Ingrese el DNI del cliente');
	readln(dni);
	while(dni <> 0) do
		begin
			RecibirCliente(pI, pU, dni);
			writeln('Ingrese el DNI del cliente');
			readln(dni);
		end;
end;
procedure informarLista(l: lista);
begin
	while(l<>nil) do
		begin
			writeln('NUM=', l^.dato.num, ' DNI=', l^.dato.dni);
			l:= l^.sig;
		end;
end;
procedure vaciarLista(var l: lista);
var
    num, dni: integer;
begin
	while(l <> nil) do
		begin
			AtenderCliente(l, num, dni);
			writeln('Cliente atendido. DNI=', dni);
		end;
end;
var
	pI, pU: lista;
begin
	pI:= nil;
	pU:= nil;
	generarLista(pI, pU);
	informarLista(pI);
	vaciarLista(pI);
	informarLista(pI);
end.