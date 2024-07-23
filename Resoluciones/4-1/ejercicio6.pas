{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.}

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
procedure evaluarCondiciones(v: vector; dimL: integer; var posMax, numMax, posMin, numMin: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		begin
			if(v[i] > numMax) then
				begin
					numMax:= v[i];
					posMax:= i;
				end;
			if(v[i] < numMin) then
				begin
					numMin:= v[i];
					posMin:= i;
				end;
		end;
end;
var
	v: vector;
	dimL, posMax, posMin, numMax, numMin: integer;
begin
	dimL:= 0;
	cargarVector(v, dimL);
	imprimirVector(v, dimL);
	writeln();
	posMax:= -1;
	posMin:= -1;
	numMax:= -9999;
	numMin:= 9999;
	evaluarCondiciones(v, dimL, posMax, numMax, posMin, numMin);
	intercambio(v, posMin, posMax);
	imprimirVector(v, dimL);
	writeln();
	writeln('El elemento maximo ', numMax, ' que se encontraba en la posicion ', posMax, ' fue intercambiado con el elemento minimo ', numMin, ' que se encontraba en la posicion ', posMin);
end.
