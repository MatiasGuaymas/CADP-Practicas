{1. La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para
ello, debe realizar un programa que lea y almacene información sobre las computadoras con este
sistema operativo (a lo sumo 10.000). De cada computadora se conoce: código de computadora, la
versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), la cantidad de paquetes instalados y la
cantidad de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1, que no
debe procesarse. Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.}

program ejercicio1;
const
	dimf = 10000;
type
	subComputadora = 1..dimf;
	computadora = record
		codigo: integer;
		version: string;
		cantPaquetes: integer;
		cantCuentas: integer;
	end;
	vecComputadoras = array [subComputadora] of computadora;
procedure leerComputadora(var c: computadora);
begin	
	writeln('Ingrese el codigo de la computadora');
	readln(c.codigo);
	if(c.codigo <> -1) then
		begin
			writeln('Ingrese la version de la computadora');
			readln(c.version);
			writeln('Ingrese la cantidad de paquetes de la computadora');
			readln(c.cantPaquetes);
			writeln('Ingrese la cantidad de cuentas de la computadora');
			readln(c.cantCuentas);
		end;
end;
procedure cargarVector(var v: vecComputadoras; var diml: integer);
var
	c: computadora;
begin
	leerComputadora(c);
	while(diml < dimf) and (c.codigo <> -1) do
		begin
			diml:= diml + 1;
			v[diml]:= c;
			leerComputadora(c);
		end;
end;
procedure maximo(var max: integer; cant: integer; var versionMax: string; version: string);
begin
	if(cant > max) then
		begin
			max:= cant;
			versionMax:= version;
		end;
end;
procedure procesarEliminar(v: vecComputadoras; var diml: integer; var cantVersion: integer; var promCuentas: real; var versionMax: string);
var
	i: subComputadora;
	contador, cantCuentas, max: integer;
begin
	contador:= 0;
	cantCuentas:= 0;
	max:= -1;
	for i:= 1 to diml do
		begin
			if(v[i].version = '18.04') or (v[i].version = '16.04') then
				cantVersion:= cantVersion + 1;
			cantCuentas:= cantCuentas + v[i].cantCuentas;
			maximo(max, v[i].cantPaquetes, versionMax, v[i].version);
			if(v[i].codigo <= 500) then //No deberia haber computadoras con codigo negativo
				contador:= contador + 1
			else
				if(contador > 0) then
					v[i-contador]:= v[i];
		end;
	promCuentas:= cantCuentas / diml;
	diml:= diml - contador;
end;
procedure imprimirVector(v: vecComputadoras; diml: integer);
var
    i: subComputadora;
begin
    for i:= 1 to diml do
        writeln('CODIGO=', v[i].codigo, ' VERSION=', v[i].version, ' CANTPAQUETES=', v[i].cantPaquetes, ' CANTCUENTAS=', v[i].cantCuentas);
end;
var
	v: vecComputadoras;
	diml, cantVersion: integer;
	promCuentas: real;
    versionMax: string;
begin
	diml:= 0;
	cargarVector(v, diml);
	imprimirVector(v, diml);
	cantVersion:= 0;
	procesarEliminar(v, diml, cantVersion, promCuentas, versionMax);
	writeln('La cantidad de computadoras que utilizan las versiones 18.04 o 16.04 es: ', cantVersion);
	writeln('El promedio de cuentas de usuario por computadora es: ', promCuentas:0:2);
	writeln('La version de Ubuntu de la computadora con mayor cantidad de paquetes instalados es: ', versionMax);
	writeln('Se elimina la informacion de las computadoras con codigo entre 0 y 500');
	imprimirVector(v, diml);
end.