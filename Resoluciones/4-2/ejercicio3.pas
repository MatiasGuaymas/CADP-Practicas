{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida por
el camión (medida en kilómetros).
a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program ejercicio3;
const
	dimf = 200;
type
	subDia = 1..31;
	subViaje = 1..dimf;
	viaje = record
		dia: subDia;
		monto: real;
		distancia: real;
	end;
	vecViajes = array [subViaje] of viaje;
	vecDia = array [subDia] of integer;
procedure leerViaje(var v: viaje);
begin
	writeln('Ingrese la distancia recorrida en km por el camion');
	readln(v.distancia);
	if(v.distancia <> 0) then
		begin
			writeln('Ingrese el monto de dinero transportado en el viaje');
			readln(v.monto);
			writeln('Ingrese el dia del mes del viaje');
			readln(v.dia);
		end;
end;
procedure cargarVector(var v: vecViajes; var diml: integer);
var
	via: viaje;
begin
	leerViaje(via);
	while((diml < dimf) and (via.distancia <> 0)) do
		begin
			diml:= diml + 1;
			v[diml]:= via;
			leerViaje(via);
		end;
end;
procedure minimo(var min: viaje; v: viaje);
begin
	if(v.monto < min.monto) then
		min:= v;
end;
procedure inicializar(var v: vecDia);
var
	i: subDia;
begin
	for i:= 1 to 31 do
		v[i]:= 0;
end;
procedure procesar(v: vecViajes; diml: integer; var montoProm, distMinGastado: real; var diaMinGastado: subDia; var vecD: vecDia);
var
	i: subViaje;
	cantViajes: integer;
	sumaTotal: real;
	min: viaje;
begin
	cantViajes:= 0;
	sumaTotal:= 0;
	min.monto:= 9999;
	for i:= 1 to diml do
		begin
			cantViajes:= cantViajes + 1;
			sumaTotal:= sumaTotal + v[i].monto;
			minimo(min, v[i]);
			vecD[v[i].dia]:= vecD[v[i].dia] + 1;
		end;
	montoProm:= sumaTotal / cantViajes;
	distMinGastado:= min.distancia;
	diaMinGastado:= min.dia;
end;
procedure informarVectorDia(v: vecDia);
var
	i: subDia;
begin
	for i:= 1 to 31 do
		writeln('Dia ',i, '. CantViajes=', v[i]);
end;
procedure eliminarViajes100km(var v: vecViajes; var diml:integer);
var
    i:subViaje;
    contador: integer;
begin
    contador:=0;
    for i:=1 to diml do
    	begin
			if(v[i].distancia = 100) then
				contador:=contador+1
			else 
				if (contador>0) then 
					v[i-contador]:=v[i];
    	end;
    diml:=diml-contador;
end;
procedure informarVectorViajes(v: vecViajes; diml: integer);
var
	i: subViaje;
begin
	for i:= 1 to diml do
		writeln('Viaje ', i, ': Distancia=', v[i].distancia:0:2, ' Monto=', v[i].monto:0:2, ' Dia=', v[i].dia);
end;
var
	diml: integer;
	vecVia: vecViajes;
	vecD: vecDia;
	montoProm, distMinGastado: real;
	diaMinGastado: subDia;
begin
	diml:= 0;
	cargarVector(vecVia, diml);
	informarVectorViajes(vecVia, diml);
	inicializar(vecD);
	procesar(vecVia, diml, montoProm, distMinGastado, diaMinGastado, vecD);
	writeln('El monto promedio transportado de los viajes realizados es: ', montoProm:0:2);
	writeln('La distancia minima recorrida y el dia del mes en que se realizo el viaje que transporto menos dinero fueron: ', distMinGastado:0:2, ' el dia ', diaMinGastado);
	informarVectorDia(vecD);
	writeln('Se eliminara todos los viajes cuya distancia recorrida sea igual a 100km');
	eliminarViajes100km(vecVia, diml);
    informarVectorViajes(vecVia, diml);
end.