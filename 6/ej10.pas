{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

//Lista cuyo elemento es un registro cliente (dni y numero atencion).

//a) Definir la lista
//b) RecibirCliente recibirá la lista y el dni del cliente. Lo añadirá a la última posicion de la lista con el numero siguiente al del actual
//último cliente
//c) AtenderCliente recibirá la lista. De ella devolverá el dni y número del cliente en la primera posicion. Luego, lo elimina de la lista
//d) Realizar un módulo que implemente RecibirCliente hasta que dni=0 (no se procesa). Luego un bucle que implemente AtenderCliente hasta
//la lista sea nil

program ej10;
type
    cliente=record
        dni:integer;
        numero:integer;
    end;

    listaC=^nodoC;
    nodoC=record
        elemento:cliente;
        sig:listaC;
    end;

procedure RecibirCliente(var pI:listaC; var pF:listaC; dni:integer);
var
    nuevo:listaC;
begin
    new(nuevo);
    nuevo^.elemento.dni:=dni;
    nuevo^.sig:=nil;

    if(pI=nil) then begin
        nuevo^.elemento.numero:=1;
        pI:=nuevo;
        pF:=nuevo;
    end
    else begin
        nuevo^.elemento.numero:=pF^.elemento.numero+1;
        pF^.sig:=nuevo;
        pF:=nuevo;
    end;
end;

procedure AtenderCliente(var lista:listaC);
var
    aux:listaC;
begin
    if(lista<>nil) then begin
        writeln('Cliente atendido: '); 
        writeln('- DNI: ',lista^.elemento.dni); 
        writeln('- Numero: ',lista^.elemento.numero);
        aux:=lista;
        lista:=lista^.sig;
        dispose(aux);
    end;
    writeln('.....................');
end;

procedure generarLista(var listPri:listaC; var listUlt:listaC);
var
    dni:integer;
begin
    writeln('Ingrese DNI de los clientes: '); readln(dni);
    while(dni<>0) do begin
        RecibirCliente(listPri, listUlt, dni);
        readln(dni);
    end;
    writeln('.....................');
end;

procedure VaciarListaEspera(var l:listaC);
begin
    while(l<>nil) do begin
        AtenderCliente(l);
    end;
end;

procedure ImprimirLista (l:listaC);
begin
    while(l<>nil) do begin
        writeln('Cliente:');
        writeln('- DNI: ',l^.elemento.dni);
        writeln('- Numero: ',l^.elemento.numero);
        l:=l^.sig;
    end;
    writeln('.....................');
end;

var
    pri, ult:listaC;
begin
    generarLista(pri, ult);
    ImprimirLista(pri);
    VaciarListaEspera(pri);
end.