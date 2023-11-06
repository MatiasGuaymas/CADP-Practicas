{Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par}
program ejercicio9;
procedure leerAlumnos(var apellidoMin1, apellidoMin2, nombreMax1, nombreMax2: String; var min1, min2, max1, max2, tot, cantPar, nInscripcion: integer);
var
	apellido, nombre: String;
begin
	write('Ingresar numero de inscripcion: ');
	readln(nInscripcion);
	write('Ingresar apellido: ');
	readln(apellido);
	write('Ingresar nombre: ');
	readln(nombre);
	if (nInscripcion < min1)then begin
		min2:= min1;
		apellidoMin2:= apellidoMin1;
		min1:= nInscripcion;
		apellidoMin1:= apellido;
	end
	else if (nInscripcion < min2) then begin
		min2:= nInscripcion;
		apellidoMin2:= apellido;
	end;
	if (nInscripcion > max1) then begin
		max2:= max1;
		nombreMax2:= nombreMax1;
		max1:= nInscripcion;
		nombreMax1:= nombre;
	end
	else if (nInscripcion > max2)then begin
		max2:= nInscripcion;
		nombreMax2:= nombre;
	end;
	tot:= tot+1;
	if (nInscripcion MOD 2 = 0)then
		cantPar:= cantPar+1;
end;
var
	apellidoMin1, apellidoMin2, nombreMax1, nombreMax2: String; 
	min1, min2, max1, max2, tot, cantPar, nInscripcion: integer;
Begin
	min1:= 9999;
	min2:= 9999;
	max1:= -1;
	max2:= -1;
	tot:= 0;
	cantPar:= 0;
	repeat
		leerAlumnos(apellidoMin1,apellidoMin2, nombreMax1, nombreMax2, min1, min2, max1, max2, tot, cantPar, nInscripcion);
	until(nInscripcion = 1200);
	writeln('El apellido de la inscripcion mas chica es ',apellidoMin1,' seguido de ',apellidoMin2);
	writeln('El nombre de la inscripcion mas grande es ',nombreMax1,' seguido de ',nombreMax2);
	writeln('El porcentaje de inscripciones pares es ',cantPar/tot*100:2:2,' %');
end.