{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program ejercicio2;
const
	dimf = 500;
type
	subRango = 1..dimf;
	vector = array [subRango] of string;
procedure cargarVector(var v: vector; var diml: integer);
var
	nombre: string;
begin
	writeln('Ingrese un nombre de alumno');
	readln(nombre);
	while(diml < dimf) and (nombre <> 'ZZZ') do
		begin
			diml:= diml + 1;
			v[diml]:= nombre;
			writeln('Ingrese un nombre de alumno');
			readln(nombre);
		end;
end;
procedure eliminarNombre(var v: vector; var diml: integer; nombre: string);
var
	pos, i: subRango;
begin
	pos:= 1;
	while(pos <= diml) and (v[pos] <> nombre) do
		pos:= pos + 1;
	if(pos<= diml) and (v[pos] = nombre) then
		begin
			for i:= pos to (diml-1) do
				v[i]:= v[i+1];
			diml:= diml-1;
			writeln('Se elimino correctamente del vector el nombre ', nombre);
		end
	else
		writeln('No se encontro el nombre ', nombre);
end;
procedure insertarAlVector(var v: vector; var diml: integer; pos: integer; nombre: string);
var
	i: integer;
begin
	if ((diml+1)<=dimf) and (pos>=1) and (pos<=diml) then
		begin
			for i:= diml downto pos do
				v[i+1]:= v[i];
			v[pos]:= nombre;
			diml:= diml + 1;
			writeln('Se inserto correctamente al vector el nombre ', nombre);
		end
	else
		writeln('No se pudo insertar al vector el nombre ', nombre);
end;
procedure agregarAlVector(var v: vector; var diml: integer; nombre: string);
begin
	if((diml+1) <= dimf) then
		begin
			diml:= diml+1;
			v[diml]:= nombre;
			writeln('Se agrego correctamente al vector el nombre ', nombre);
		end;
end;
procedure imprimirVector(v: vector; diml: integer);
var
    i: integer;
begin
    for i:= 1 to diml do
        write(v[i], ' | ');
end;
var
    v: vector;
    diml: integer;
    nombre: string;
begin
    diml:= 0;
    cargarVector(v, diml);
    imprimirVector(v, diml);
    writeln();

    writeln('Ingrese un nombre a eliminar del vector');
    readln(nombre);
    eliminarNombre(v, diml, nombre);
    imprimirVector(v, diml);
    writeln();

    writeln('Ingrese un nombre a insertar del vector en la posicion 4');
    readln(nombre);
    insertarAlVector(v, diml, 4, nombre);
    imprimirVector(v, diml);
    writeln();
    
    writeln('Ingrese un nombre a agregar del vector');
    readln(nombre);
    agregarAlVector(v, diml, nombre);
    imprimirVector(v, diml);
end.