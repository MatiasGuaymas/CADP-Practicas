{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c}

program ejercicio3;
const
	dimF = 30;
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
procedure imprimirVectorOrden(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= 1 to dimL do
		write(v[i], ' | ');
end;
procedure imprimirVectorInvertido(v: vector; dimL: integer);
var
	i: integer;
begin
	for i:= dimL downto 1 do
		write(v[i], ' | ');
end;
procedure imprimirVectorMitad(v: vector; dimL: integer);
var
	i: integer;
	mitad: integer;
begin
	mitad:= dimL DIV 2;
	writeln('Primera mitad:');
	for i:= 1 to mitad do
		write(v[i], ' | ');
    writeln();
	writeln('Segunda mitad: ');
	for i:= mitad+1 to dimL do
		write(v[i], ' | ');
end;
procedure imprimirEntreValores(v: vector; x, y: integer);
var
	i: integer;
begin
	if(x > y) then
		for i:= x downto y do
			write(v[i], ' | ')
	else
		for i:= x to y do
			write(v[i], ' | ');
end;
var
	v: vector;
	dimL, x, y: integer;
begin
    Randomize;
	dimL:= 0;
	cargarVector(v, dimL);
	writeln('DIML=', dimL);
	imprimirVectorOrden(v, dimL);
    writeln();
	imprimirVectorInvertido(v, dimL);
    writeln();
	imprimirVectorMitad(v, dimL);
    writeln();
	writeln('Ingrese un valor x');
	readln(x);
	writeln('Ingrese un valor y');
	readln(y);
	imprimirEntreValores(v, x, y);
    writeln();
    writeln('Reutilizando el modulo entre valores');
	imprimirEntreValores(v, 1, dimL);
    writeln();
	imprimirEntreValores(v, dimL, 1);
    writeln();
	imprimirEntreValores(v, 1, dimL div 2);
    writeln();
	imprimirEntreValores(v, dimL div 2 + 1, dimL);
end.
