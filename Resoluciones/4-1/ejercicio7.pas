{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program ejercicio7;
const
	dimF = 9;
type
	subRango = 0..9;
	vecOcurrencias = array [subRango] of integer;
procedure inicializar(var v: vecOcurrencias);
var
	i: subRango;
begin
	for i:= 0 to dimF do
		v[i]:= 0;
end;
procedure descomponer(var v: vecOcurrencias; num: integer);
var
	dig: integer;
begin
	while(num <> 0) do
		begin
			dig:= num mod 10;
			v[dig]:= v[dig] + 1;
			num:= num div 10;
		end;
end;
procedure leerDescomponerNum(var v: vecOcurrencias);
var
	num: integer;
begin
	writeln('Ingrese un numero entero');
	readln(num);
	while(num <> -1) do
		begin
			descomponer(v, num);
			writeln('Ingrese un numero entero');
			readln(num);
		end;
end;
procedure imprimirVector(v: vecOcurrencias);
var
	i: subRango;
begin
	for i:= 0 to 9 do
		if(v[i] > 0) then
			writeln('Numero ', i, ': ', v[i], ' veces')
		else
			writeln('El digito ', i, ' no tuvo ocurrencias');
end;
function maximaOcurrencia(v: vecOcurrencias): subRango;
var
	max, posMax: integer;
    i: subRango;
begin
	max:= -1;
	for i:= 0 to 9 do
		if(v[i] > max) then
			begin
				max:= v[i];
				posMax:= i;
			end;
	maximaOcurrencia:= posMax;
end;
var
	v: vecOcurrencias;
begin
	inicializar(v);
	leerDescomponerNum(v);
	imprimirVector(v);
    writeln('El digito mas leido fue: ', maximaOcurrencia(v));
end.