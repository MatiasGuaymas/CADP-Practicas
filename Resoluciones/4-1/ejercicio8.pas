{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program ejercicio8;
const
	dimf = 400;
type
	subAlu = 1..dimf;
	alumno = record
		nro: integer;
		dni: integer;
		apellido: string;
		nombre: string;
		nacimiento: integer;
	end;
	vecAlumnos = array [subAlu] of alumno;
procedure leerAlumno(var a: alumno);
begin
	writeln('Ingrese el numero de inscripcion del alumno');
	readln(a.nro);
	writeln('Ingrese el dni del alumno');
	readln(a.dni);
	writeln('Ingrese el apellido del alumno');
	readln(a.apellido);
	writeln('Ingrese el nombre del alumno');
	readln(a.nombre);
	writeln('Ingrese el anio de nacimiento del alumno');
	readln(a.nacimiento);
end;
procedure cargarVector(var v: vecAlumnos);
var
	a: alumno;
	i: subAlu;
begin
	for i:= 1 to dimf do
		begin
			leerAlumno(a);
			v[i]:= a;
		end;
end;
function cumpleDigPares(num: integer): boolean;
var
	dig: integer;
	ok: boolean;
begin
	ok:= true;
	while(num <> 0) and (ok) do
		begin
			dig:= num mod 10;
			if((dig mod 2) = 0) then
				num:= num div 10
			else
				ok:= false;
		end;
	cumpleDigPares:= ok;
end;
procedure maximos(var max1, max2: integer; var apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: string; edad: integer; ap, nom: string);
begin
	if(edad > max1) then
		begin
			apellidoMax2:= apellidoMax1;
			apellidoMax1:= ap;
			nombreMax2:= nombreMax1;
			nombreMax1:= nom;
			max2:= max1;
			max1:= edad;
		end
	else
		if(edad > max2) then
			begin
				apellidoMax2:= ap;
				nombreMax2:= nom;
				max2:= edad;
			end;
end;
procedure calcular(v: vecAlumnos; var porcentaje: real; var apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: string);
var
	i: subAlu;
	max1, max2, cantAluDigPares, edad: integer;
begin
	max1:= -1;
	max2:= -1;
	cantAluDigPares:= 0;
	for i:= 1 to dimf do
		begin
			if(cumpleDigPares(v[i].dni)) then
				cantAluDigPares:= cantAluDigPares + 1;
			edad:= 2020 - v[i].nacimiento;
			maximos(max1, max2, apellidoMax1, apellidoMax2, nombreMax1, nombreMax2, edad, v[i].apellido, v[i].nombre);	
		end;
	porcentaje:= (cantAluDigPares / dimf)*100;
end;
var
	v: vecAlumnos;
	porcentaje: real;
	apellidoMax1, apellidoMax2, nombreMax1, nombreMax2: string;
begin
	cargarVector(v);
	calcular(v, porcentaje, apellidoMax1, apellidoMax2, nombreMax1, nombreMax2);
	writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares es: ', porcentaje:0:2);
	writeln('El apellido y nombre de los dos alumnos de mayor edad son: ', apellidoMax1, ' ', nombreMax1, ' y ', apellidoMax2, ' ', nombreMax2);
end.