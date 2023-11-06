{Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

//Bucle for en el programa principal.
//Registro principal con campos: codigo cliente y cantidad de lineas. Registro secundario con campos: numero tel, cant min, cant mb
//Modulo que recibe datos del cliente y devuelve facturacion de minutos y facturacion de MB.

program ej4;
const
    costeMinuto=3.4;
    costeMB=1.35;
    cantClientes=9300;
type

    cliente=record
        codigo:integer;
        cantLineas:integer;
    end;

    linea=record
        tel:integer;
        cantMinutos:integer;
        cantMB:real;
    end;

procedure leerLinea(var cel:linea);
begin
    writeln('Ingrese numero de telefono: '); readln(cel.tel);
    writeln('Ingrese cantidad de minutos: '); readln(cel.cantMinutos);
    writeln('Ingrese cantidad de MB: '); readln(cel.cantMB);
end;

procedure leerCliente(var op:cliente);
begin
    writeln('Ingrese codigo de cliente: '); readln(op.codigo);
    writeln('Ingrese cantidad de lineas: '); readln(op.cantLineas);
end;

procedure FacturacionCliente(usuario:cliente; var fMinutos:real; var fMegas:real);
var
    i:integer;
    linTel:linea;
begin
    fMinutos:=0;
    fMegas:=0;
    for i:=1 to usuario.cantLineas do
    begin
        leerLinea(linTel);
        writeln('-----------------------');
        fMinutos:=fMinutos + (linTel.cantMinutos * costeMinuto); //Guardo el valor de la facturacion de la anterior linea + facturacion linea actual
        fMegas:=fMegas + (linTel.cantMB * costeMB);
    end;
end;

var
    consumidor:cliente;
    consumoMinutos, consumoMB: real;
    j:integer;

begin
    for j:=0 to cantClientes do
    begin
        leerCliente(consumidor);
        FacturacionCliente(consumidor,consumoMinutos,consumoMB);
        writeln('.........................');
        writeln('El cliente ', consumidor.codigo,' debe facturar $',consumoMinutos:1:2,' de minutos y $',consumoMB:1:2,' de MB');
        writeln('.........................');
    end;
end.