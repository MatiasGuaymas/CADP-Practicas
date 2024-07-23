{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program ejercicio5;
const
	dimF = 100;
type
	vector = array [1..dimF] of integer;
procedure cargarVector(var v: vector; var dimL: integer); //Se dispone
var
	num: integer;
begin
	num:= Random(15);
	while((dimL < dimF) and (num <> 0)) do
		begin
			dimL:= dimL + 1;
			v[dimL]:= num;
			num:= Random(15);
		end;
end;
procedure imprimirVector(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		write(v[i], ' | ');
end;
procedure intercambio(var v: vector; x, y: integer);
var
	aux: integer;
begin
	aux:= v[x];
	v[x]:= v[y];
	v[y]:= aux;
end;
procedure elementoMaximo(v: vector; dimL: integer; var posMax, numMax: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		if(v[i] > numMax) then
			begin
				numMax:= v[i];
				posMax:= i;
			end;
end;
procedure elementoMinimo(v: vector; dimL: integer; var posMin, numMin: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		if(v[i] < numMin) then
			begin
				numMin:= v[i];
				posMin:= i;
			end;
end;
var
	v: vector;
	dimL, posMax, posMin, numMax, numMin: integer;
begin
    Randomize;
	dimL:= 0;
	cargarVector(v, dimL);
    writeln('DIML=', dimL);
	imprimirVector(v, dimL);
	writeln();
	posMax:= -1;
	posMin:= -1;
	numMax:= -9999;
	numMin:= 9999;
	elementoMaximo(v, dimL, posMax, numMax);
	elementoMinimo(v, dimL, posMin, numMin);
	intercambio(v, posMin, posMax);
	imprimirVector(v, dimL);
	writeln();
	writeln('El elemento maximo ', numMax, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', numMin, ' que se encontraba en la posicion ', posMin);
end.
