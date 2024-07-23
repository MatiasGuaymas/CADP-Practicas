{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program ejercicio4;
const
	dimF = 100;
type
	vector = array [1..dimF] of integer;
procedure cargarVector(var v: vector); //Se dispone
var
    i: integer;
begin
	for i:= 1 to dimF do
		v[i]:= Random(40);
end;
procedure imprimirVector(v: vector);
var
	i: integer;
begin
	for i:= 1 to dimF do
		write(v[i], ' | ');
end;
function posicion(v: vector; x: integer): integer;
var
	pos: integer;
	ok: boolean;
begin
	ok:= false; pos:= 1;
	while((pos <= dimF) and (not ok)) do
		begin
			if(v[pos] = x) then
				ok:= true
			else
				pos:= pos + 1;
		end;
	if(ok) then
		posicion:= pos
	else
		posicion:= -1;
end;
procedure intercambio(var v: vector; x, y: integer);
var
	aux: integer;
begin
	aux:= v[x];
	v[x]:= v[y];
	v[y]:= aux;
end;
function sumaVector(v: vector): integer;
var
	i: integer;
	suma: integer;
begin
	suma:= 0;
	for i:= 1 to dimF do
		suma:= suma + v[i];
	sumaVector:= suma;
end;
function promedioVector(v: vector): real;
begin
	promedioVector:= sumaVector(v) / dimF;
end;
function elementoMaximo(v: vector): integer;
var
	max, i, pos: integer;
begin
	max:= -9999;
	for i:= 1 to dimF do
		if(v[i] > max) then
			begin
				pos:= i;
				max:= v[i]
			end;
	elementoMaximo:= pos;
end;
function elementoMinimo(v: vector): integer;
var
	min, i, pos: integer;
begin
	min:= 9999;
	for i:= 1 to dimF do
		if(v[i] < min) then
			begin
				pos:= i;
				min:= v[i]
			end;
	elementoMinimo:= pos;
end;
var
	v: vector;
	x, y: integer;
begin
	cargarVector(v);
	imprimirVector(v);
    writeln();
	writeln('Ingrese la posicion x');
	readln(x);
	writeln('Ingrese la posicion y');
	readln(y);
	intercambio(v, x, y);
	writeln('Vector con valores intercambios de x e y');
	imprimirVector(v);
	writeln('La suma de todos los elementos del vector es: ', sumaVector(v));
	writeln('El valor promedio de los elementos del vector es: ', promedioVector(v):0:2);
	writeln('La posicion del mayor elemento del vector es: ', elementoMaximo(v));
	writeln('La posicion del menor elemento del vector es: ', elementoMinimo(v));
end.
