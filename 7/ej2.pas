{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza contratada
(1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente con código
1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.
Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

//Registro cliente con codigo, DNI, apellido, nombre, codigo de poliza(1-6) y monto mensual. Leo hasta codigo 1122 (debe procesarse)
//Lista con registro cliente.
//La empresa dispone de un vector df 6 con los montos adicionales segun poliza de cliente.

//a) Recorrer la lista informando de cada cliente: dni, apellido, nombre, monto total (monto mensual + monto adicional[codigo poliza])
//b) en el bucle principal recorrer la lista. Evaluar con funcion si dni tiene dos digitos 9. Si es asi, imprimir nombre y apellido en el momento
//c) Modulo aparte que recibe un codigo de cliente, busca y elimina de la lista.

program ej2;
const
    codigoCorte=1122;
    cantPoliza=6;
type
    rangoPoliza=0..cantPoliza;

    cliente=record
        codigoCliente:integer;
        dni:integer;
        apellido:string;
        nombre:string;
        codigoPoliza:rangoPoliza;
        monto:real;
    end;

    listaC=^nodoC;
    nodoC=record
        elemento:cliente;
        sig:listaC;
    end;

    montosAdicionales=array[1..cantPoliza] of real;

procedure leerRegistro(var c:cliente);
begin
    writeln('Codigo cliente: '); readln(c.codigoCliente);
    writeln('DNI: '); readln(c.dni);
    writeln('Apellido: '); readln(c.apellido);
    writeln('Nombre: '); readln(c.nombre);
    writeln('Codigo Poliza: '); readln(c.codigoPoliza);
    writeln('Monto: '); readln(c.monto);
    writeln('......................');
end;

procedure armarNodo(var l:listaC; c:cliente);   //l:=nil en prog princ
var
    nuevo:listaC;
begin
    new(nuevo);
    nuevo^.elemento:=c;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarLista(var l:listaC);
var
    c:cliente;
begin
    repeat
        leerRegistro(c);
        armarNodo(l,c);
    until(c.codigoCliente=codigoCorte);
end;

procedure cargarMontoAdicional(var montAd:montosAdicionales);
begin
    montAd[1]:=542.21;
    montAd[2]:=763.42;
    montAd[3]:=984.21;
    montAd[4]:=321.76;
    montAd[5]:=654.23;
    montAd[6]:=333.21;
end;

procedure informarCliente(cl:cliente; monAd:montosAdicionales);
begin
    writeln('DNI: ',cl.dni);
    writeln('Nombre: ',cl.nombre);
    writeln('Apellido: ',cl.apellido);
    writeln('Monto total: ',cl.monto+monAd[cl.codigoPoliza]:1:2);
    writeln('--------------------');
end;

function verificarCondicionDNI(dni:integer):boolean;
var
    cantCondicion:integer;
begin
    cantCondicion:=0;
    while((dni<>0) and (cantCondicion<2)) do begin
        if((dni MOD 10)=9) then cantCondicion:=cantCondicion+1;
        dni:=dni DIV 10;
    end;
    verificarCondicionDNI:=(cantCondicion=2);
end;

procedure eliminarCliente(var pri:listaC; codigo:integer);
var
    actual, anterior:listaC;
begin
    actual:=pri;
    while((actual<>nil) and (actual^.elemento.codigoCliente<>codigo)) do begin
        anterior:=actual;
        actual:=actual^.sig;
    end;
    if(actual<>nil) then begin  //No es necesario ya que el codigo seguro está
        if(actual=pri) then pri:=pri^.sig
        else anterior^.sig:=actual^.sig;
        dispose(actual);
    end;
end;

procedure informarLista(l:listaC);
begin
    while(l<>nil) do begin
        writeln('Codigo Cliente: ',l^.elemento.codigoCliente);
        writeln('Apellido: ',l^.elemento.apellido);
        l:=l^.sig;
    end;
end;

procedure procesarDatos(var lista:listaC; var montoAdi:montosAdicionales);
var
    aux:listaC;
    codigoEliminar:integer;
begin
    cargarMontoAdicional(montoAdi);
    aux:=lista;
    
    while(aux<>nil) do begin
        informarCliente(aux^.elemento, montoAdi);
        if(verificarCondicionDNI(aux^.elemento.dni)) then begin
            writeln('Cumplen condicion DNI: ');
            writeln('Nombre: ',aux^.elemento.nombre);
            writeln('Apellido: ',aux^.elemento.apellido);
        end;
        aux:=aux^.sig;
    end;

    writeln('.........');
    writeln('Ingrese el codigo de cliente a eliminar: '); readln(codigoEliminar);
    eliminarCliente(lista,codigoEliminar);
end;

var
    listaCliente:listaC;
    montAdic:montosAdicionales;
begin
    listaCliente:=nil;
    generarLista(listaCliente);
    procesarDatos(listaCliente, montAdic);
    writeln('Lista con cliente eliminado: ');
    informarLista(listaCliente);
end.