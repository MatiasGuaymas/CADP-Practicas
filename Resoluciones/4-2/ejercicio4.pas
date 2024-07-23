{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos
leídos de teclado.}

program ejercicio4;
const
	dimf = 1000;
type
	subAlumno = 1..dimf;
	alumno = record
		nro: integer;
		apellido: string;
		nombre: string;
		cantAsistencias: integer;
	end;
	vecAlumnos = array [subAlumno] of alumno;
procedure leerAlumno(var a: alumno);
begin
	writeln('Ingrese el numero de alumno');
	readln(a.nro);
	if(a.nro <> -1) then
		begin
			writeln('Ingrese el apellido del alumno');
			readln(a.apellido);
			writeln('Ingrese el nombre del alumno');
			readln(a.nombre);
			writeln('Ingrese la cantidad de asistencias del alumno');
			readln(a.cantAsistencias);
		end;
end;
procedure cargarVector(var v: vecAlumnos; var diml: integer); //Se dispone, vector ordenado por codigo de alumno.
var
    a: alumno;
begin
	leerAlumno(a);
	while((diml < dimf) and (a.nro <> -1)) do //Para cortar la carga, invento una condicion de corte
		begin
			diml:= diml + 1;
			v[diml]:= a;
			leerAlumno(a);
		end;
end;
function posAlumno(v: vecAlumnos; nro: subAlumno): subAlumno;
var
	posAux: subAlumno;
begin
	posAux:= 1;
	while(v[posAux].nro < nro) do
		posAux:= posAux + 1;
	posAlumno:= posAux;
end;
procedure insertarAlumno(var v: vecAlumnos; var diml: integer; a: alumno; pos: integer); //No se asegura que el numero de alumno vaya de 1 a 1000, por eso es con pos
var
	i: subAlumno;
begin
	if((diml+1 <= dimf) and (pos >=1) and (pos <= diml)) then
		begin
			for i:= diml downto pos do
				v[i+1]:= v[i];
			v[pos]:= a;
			diml:= diml +1;
			writeln('Se inserto correctamente el alumno en la posicion ', pos);
		end;
end;
procedure eliminarAlumno(var v: vecAlumnos; var diml: integer; pos: integer);
var
	i: subAlumno;
begin
	if ((pos>= 1) and (pos <= diml) )then 
		begin
			for i:= pos to (diml-1) do
				v[i]:= v[i+1]; 
			diml:= diml - 1;
			writeln('Se elimino correctamente el alumno de la posicion ', pos);
		end;
end;
procedure eliminarAlumnosAsistencias0(var v: vecAlumnos; var diml: integer);
var
	i: subAlumno;
	contador: integer;
begin
    contador:= 0;
	for i:= 1 to diml do
		begin
			if(v[i].cantAsistencias = 0) then
				contador:= contador + 1
			else
				if(contador > 0) then
					v[i-contador]:= v[i];
		end;
	diml:= diml - contador;
end;
procedure informarVector(v: vecAlumnos; diml: integer);
var
	i: subAlumno;
begin
	for i:= 1 to diml do
		writeln('NRO=', v[i].nro, ' APELLIDO=', v[i].apellido, ' ASISTENCIAS=', v[i].cantAsistencias);
end;
var
	v: vecAlumnos;
	diml, pos: integer;
	nro: subAlumno;
	a: alumno;
begin
	cargarVector(v, diml);
	informarVector(v, diml);
	writeln('Ingrese un numero de alumno');
	readln(nro);
	writeln('La posicion del alumno con nro de alumno ', nro, ' es: ', posAlumno(v, nro));
	leerAlumno(a);
	writeln('Ingrese una posicion para insertar al alumno en el vector');
	readln(pos);
	insertarAlumno(v, diml, a, pos);
	informarVector(v, diml);
	writeln('Ingrese una posicion de un alumno para eliminar');
	readln(pos);
	eliminarAlumno(v, diml, pos);
	informarVector(v, diml);
	writeln('Se eliminaran del vector todos los alumnos con cantidad de asistencias en 0');
	eliminarAlumnosAsistencias0(v, diml);
	informarVector(v, diml);
end.