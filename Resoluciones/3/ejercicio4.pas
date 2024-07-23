{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:
a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program ejercicio4;
const
    //dim = 9300;
    dim = 4;
    costeMin = 3.40;
    costeMB = 1.35;
type
    cliente = record
        codigo: integer;
        cant: integer;
    end;
    linea = record
        numero: integer;
        minutos: integer;
        mb: real;
    end;
procedure leerLinea(var l: linea);
begin
    writeln('Ingrese el numero de telefono');
    readln(l.numero);
    writeln('Ingrese la cantidad de minutos consumidos');
    readln(l.minutos);
    writeln('Ingrese la cantidad de MB consumidos en el mes');
    readln(l.mb);
end;
procedure leerCliente(var c: cliente; var montoTotalMin, montoTotalMB: real);
var
    i, cantMinutos: integer;
    cantMB: real;
    l: linea;
begin
    montoTotalMin:= 0;
    montoTotalMB:= 0;
    cantMinutos:= 0;
    cantMB:= 0;
    writeln('Ingrese el codigo del cliente');
    readln(c.codigo);
    writeln('Ingrese la cantidad de lineas al nombre del cliente con codigo ', c.codigo);
    readln(c.cant);
    for i:= 1 to c.cant do
        begin
            leerLinea(l);
            cantMinutos:= cantMinutos + l.minutos;
            cantMB:= cantMB + l.mb;
        end;
    montoTotalMin:= cantMinutos * costeMin;
    montoTotalMB:= cantMB * costeMB;
end;
procedure leerCompania;
var
    c: cliente;
    montoTotalMin, montoTotalMB: real;
    i: integer;
begin
    for i:= 1 to dim do
        begin
            leerCliente(c, montoTotalMin, montoTotalMB);
            writeln('Codigo ', c.codigo, ' a facturar: CantMin=', montoTotalMin:0:2, '$ CantMB=', montoTotalMB:0:2, '$');
        end;
end;
begin
    leerCompania;
end.