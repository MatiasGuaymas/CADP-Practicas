{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales
lanzadas al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la
misión (cantidad de meses que permanecerá activa), el costo de construcción, el costo de
mantenimiento mensual y rango del espectro electromagnético sobre el que realizará estudios. Dicho
rango se divide en 7 categorías: 1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta;
6. rayos X; 7. rayos gamma.
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura
finaliza al ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las
sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}

program ejercicio6;
const
	DF = 7;
type
	subCategoria = 1..DF;
	sonda = record
		nombre: string;
		duracion: integer;
		costoConstruccion: real;
		costoMantenimiento: real;
		rango: subCategoria;
	end;
	lista = ^nodo;
	nodo = record
		dato: sonda;
		sig: lista;
	end;
	vecCategorias = array[subCategoria] of integer;
procedure leerSonda(var s:sonda);
begin
    writeln('Nombre: '); readln(s.nombre);
    writeln('Duracion mision: '); readln(s.duracion);
    writeln('Costo construccion: '); readln(s.costoConstruccion);
    writeln('Costo mantenimiento: '); readln(s.costoMantenimiento);
    writeln('Categoria sonda: '); readln(s.rango);
    writeln('...........................');
end;
procedure agregarAdelante(var l:lista; s:sonda);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=s;
    aux^.sig:=l;
    l:=aux;
end;
procedure generarLista(var l:lista);  
var
    s:sonda;
begin
    repeat
        leerSonda(s);
        agregarAdelante(l, s);
    until(s.nombre='GAIA');
end;
procedure inicializarVector(var v: vecCategorias);
var
	i: integer;
begin
	for i:= 1 to DF do
		v[i]:= 0;
end;
procedure maximo(var max: real; var nomMax: string; suma: real; nombre: string);
begin
	if(suma > max) then
		begin
			max:= suma;
			nomMax:= nombre;
		end;
end;
procedure procesarLista(l: lista; var nomMax: string; var v: vecCategorias; var cantSondas: integer);
var
	pI: lista;
	sumaDuraciones: integer;
	max, duracionProm, sumaCostos, precioProm: real;
	cant: integer;
begin
	pI:= l;
	max:= -1;
	sumaDuraciones:= 0;
	sumaCostos:= 0;
	cant:= 0;

	while(l <> nil) do
		begin
			cant:= cant + 1;
			maximo(max, nomMax, l^.dato.costoConstruccion + l^.dato.costoMantenimiento, l^.dato.nombre);
			v[l^.dato.rango]:= v[l^.dato.rango] + 1;
			sumaDuraciones:= sumaDuraciones + l^.dato.duracion;
			sumaCostos:= sumaCostos + l^.dato.costoConstruccion;
			l:= l^.sig;
		end;

	duracionProm:= sumaDuraciones / cant;
	precioProm:= sumaCostos / cant;
	l:= pI;

	while(l <> nil) do
		begin
			if(l^.dato.duracion > duracionProm) then
				cantSondas:= cantSondas + 1;
			if(l^.dato.costoConstruccion > precioProm) then
				writeln(l^.dato.nombre);
			l:= l^.sig;
		end;
end;
procedure imprimirVector(v: vecCategorias);
var
	i: subCategoria;
begin
	for i:= 1 to DF do
		writeln(v[i]);
end;
var
	l: lista;
	v: vecCategorias;
	nomMax: string;
	cant: integer;
begin
	l:= nil;
	cant:= 0;
	generarLista(l);
	inicializarVector(v);
	procesarLista(l, nomMax, v, cant);
	writeln('El nombre de la sonda mas costosa es: ', nomMax);
	writeln('La cantidad de sondas que realizaran estudios en cada rango es: ');
	imprimirVector(v);
	writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es: ', cant);
end.