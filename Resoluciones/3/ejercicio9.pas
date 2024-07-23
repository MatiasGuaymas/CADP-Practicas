{9.Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente
de la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe
procesarse. Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}

program ejercicio9;
type
	candidato = record
		localidad: string;
		apellido: string;
		cantObtenidos: integer;
		cantVotantes: integer;
	end;
procedure leerCandidato(var c: candidato);
begin
	writeln('Ingrese la localidad del candidato');
	readln(c.localidad);
	if(c.localidad <> 'Zarate') then
		begin
			writeln('Ingrese el apellido del candidato');
			readln(c.apellido);
			writeln('Ingrese la cantidad de votos obtenidos en la localidad');
			readln(c.cantObtenidos);
			writeln('Ingrese la cantidad de votantes de la localidad');
			readln(c.cantVotantes);
		end;
end;
procedure maximoVotos(var maxVotos: integer; var nomMaxVotos: string; cant: integer; ap: string);
begin
	if(cant > maxVotos) then
		begin
			maxVotos:= cant;
			nomMaxVotos:= ap;
		end;
end;
procedure maximoPorcentaje(var maxPorcentaje: real; var nomMaxPorcentaje: string; porcentaje: real; ap: string);
begin
	if(porcentaje > maxPorcentaje) then
		begin
			maxPorcentaje:= porcentaje;
			nomMaxPorcentaje:= ap;
		end;
end;
procedure lecturaCandidatos;
var
    c: candidato;
	maxVotos: integer;
	maxPorcentaje: real;
	nomMaxVotos, nomMaxPorcentaje: string;
begin
	leerCandidato(c);
	maxVotos:= -1;
	maxPorcentaje:= -1;
	while(c.localidad <> 'Zarate') do
		begin
			maximoVotos(maxVotos, nomMaxVotos, c.cantObtenidos, c.apellido);
			maximoPorcentaje(maxPorcentaje, nomMaxPorcentaje, (c.cantObtenidos/c.cantVotantes)*100 , c.apellido);
			leerCandidato(c);
		end;
	writeln('El intendente que obtuvo la mayor cantidad de votos en la eleccion es: ', nomMaxVotos);
	writeln('El intendente que obtuvo el mayor porcentaje de votos de la eleccin es: ', nomMaxPorcentaje);
end;
begin
	lecturaCandidatos;
end.