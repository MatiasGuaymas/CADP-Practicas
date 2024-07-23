{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el
programa Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el
docente coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el
nombre de la escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La
información se ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar
un programa que lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no
debe procesarse), e informe:
● Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada
localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e
impares.}

program ejercicio8;
type
	docente = record
		dni: integer;
		nombre: string;
		apellido: string;
		email: string;
	end;
	proyecto = record
		codigo: integer;
		titulo: string;
		d: docente;
		cant: integer;
		escuela: string;
		localidad: string;
	end;
procedure leerDocente(var d: docente);
begin
	writeln('Ingrese el dni del docente');
	readln(d.dni);
	writeln('Ingrese el nombre del docente');
	readln(d.nombre);
	writeln('Ingrese el apellido del docente');
	readln(d.apellido);
	writeln('Ingrese el email del docente');
	readln(d.email);
end;
procedure leerProyecto(var p: proyecto);
var
	d: docente;
begin
	writeln('Ingrese el codigo unico del proyecto');
	readln(p.codigo);
	if(p.codigo <> -1) then
		begin
			writeln('Ingrese la localidad a la que pertenece la escuela');
			readln(p.localidad);
			writeln('Ingrese el nombre de la escuela que participa en el proyecto');
			readln(p.escuela);
			writeln('Ingrese el titulo del proyecto');
			readln(p.titulo);
			writeln('Ingrese los datos del docente coordinador');
			leerDocente(d);
			p.d:= d;
			writeln('Ingrese la cantidad de alumnos que participan en el proyecto');
			readln(p.cant);
		end;
end;
function cumpleDigitos(num: integer): boolean;
var
	dig, pares, impares: integer;
begin
	pares:= 0;
	impares:= 0;
	while(num <> 0) do
		begin
			dig:= num mod 10;
			if(dig mod 2 = 0) then
				pares:= pares + 1
			else
				impares:= impares + 1;
			num:= num div 10;
		end;
	cumpleDigitos:= impares = pares;
end;
procedure maximos(var max1, max2: integer; var escMax1, escMax2: string; cant: integer; esc: string);
begin
	if(cant > max1) then
		begin
			max2:= max1;
			max1:= cant;
			escMax2:= escMax1;
			escMax1:= esc;
		end
	else
		if(cant > max2) then
			begin
				max2:= cant;
				escMax2:= esc;
			end;
end;
procedure proyectos;
var
    p: proyecto;
    totalEscuelas, cantLocalidad, cantAlumnosEscuela, max1, max2: integer;
    localidadActual, escuelaActual, escMax1, escMax2: string;
begin
	leerProyecto(p);
	totalEscuelas:= 0;
    max1:= -1;
    max2:= -1;
	while(p.codigo <> -1) do
		begin
			localidadActual:= p.localidad;
			cantLocalidad:= 0;
			while(p.codigo <> -1) and (localidadActual = p.localidad) do
				begin
					cantLocalidad:= cantLocalidad + 1;
					escuelaActual:= p.escuela;
					cantAlumnosEscuela:= 0;
					while (p.codigo <> -1) and (localidadActual = p.localidad) and (escuelaActual = p.escuela) do
						begin
							cantAlumnosEscuela:= cantAlumnosEscuela + p.cant;
							if(p.localidad = 'Daireaux') then
								if(cumpleDigitos(p.codigo)) then
									writeln('Titulo del proyecto: ', p.titulo);
							leerProyecto(p);
						end;
					maximos(max1, max2, escMax1, escMax2, cantAlumnosEscuela, escuelaActual);
				end;
			totalEscuelas:= totalEscuelas + cantLocalidad;
			writeln('La cantidad total de escuelas en la localidad ', localidadActual, ' es: ', cantLocalidad);
		end;
	writeln('La cantidad total de escuelas que participan en la convocatoria 2020 es: ', totalEscuelas);
    writeln('Los nombres de las dos escuelas con mayor cantidad de alumnos participantes son: ', escMax1, ' y ', escMax2);
end;
begin
    proyectos;
end.