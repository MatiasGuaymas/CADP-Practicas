{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program ejercicio1;
const
	dimf = 500;
type
	subRango = 1..dimf;
	vector = array [subRango] of integer;
procedure cargarVectorDesordenado(var vec: vector; var diml: integer);
var
	i: subRango;
begin
	diml:= Random(20);
	writeln('DIML=',diml);
	for i:= 1 to diml do
		vec[i]:= Random(100);
end;
procedure cargarVectorOrdenado(var v: vector; var diml: integer);
var
	i: subRango;
	num: integer;
begin
	diml:= Random(20);
	writeln('DIML=',diml);
	for i:= 1 to diml do
		begin
			writeln('Ingrese un numero entero (orden ascendente)');
			readln(num);
			v[i]:= num;
		end;
end;
function busquedaDesordenada(v: vector; diml, n: integer): boolean;
var
	pos: integer;
	encontre: boolean;
begin
	pos:= 1;
	encontre:= false;
	while(pos <= diml) and (not encontre) do
		begin
			if(v[pos] = n) then 
				encontre:= true
			else
				pos:= pos + 1;
		end;
	busquedaDesordenada:= encontre;
end;
function busquedaMejorada(v: vector; diml, n: integer): boolean;
var
	pos: integer;
begin
	pos:= 1;
	while ((pos <= diml) and (v[pos] < n)) do
		pos:= pos+1;
	if ((pos <= diml) and (v[pos] = n)) then
		busquedaMejorada:= true
	else
		busquedaMejorada:= false;
end;
function busquedaDicotomica(v: vector; diml, n: integer): boolean;
var
	pri, ult, medio: integer;
begin
	pri:= 1;
	ult:= diml;
	medio:= (pri+ult) div 2;
	while (pri <= ult) and (n <> v[medio]) do
		begin
			if (n < v[medio]) then
				ult:= medio - 1
			else
				pri:= medio + 1;
			medio:= (pri + ult) div 2;
		end;
	busquedaDicotomica:= (pri <= ult) and (n = v[medio]);
end;
procedure imprimirVector(v: vector; diml: integer);
var
	i: integer;
begin
	for i:= 1 to diml do
		write(v[i], ' | ');
end;
var
	dimlDesordenado, dimlOrdenado, n: integer;
	vecDesordenado, vecOrdenado: vector;
begin
	Randomize;
	dimlDesordenado:= 0;
	dimlOrdenado:= 0;
	cargarVectorDesordenado(vecDesordenado, dimlDesordenado);
	imprimirVector(vecDesordenado, dimlDesordenado);
	writeln();
	cargarVectorOrdenado(vecOrdenado, dimlOrdenado);
	imprimirVector(vecOrdenado, dimlOrdenado);
	writeln();
	writeln('Ingrese un primer numero n');
	readln(n);
	writeln('Se encontro ', n, ':', busquedaDesordenada(vecDesordenado, dimlDesordenado, n));
	writeln('Ingrese un segundo numero n');
	readln(n);
	writeln('Se encontro ', n, ':', busquedaMejorada(vecOrdenado, dimlOrdenado, n));
	writeln('Ingrese un tercer numero n');
	readln(n);
	writeln('Se encontro ', n, ':', busquedaDicotomica(vecOrdenado, dimlOrdenado, n));
end.