{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por
universidad y la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

program ejercicio7;
type
	centro = record
		nombre: string;
		universidad: string;
		cantInvestigadores: integer;
		cantBecarios: integer;
	end;
procedure leerCentro(var c: centro);
begin
	writeln('Ingrese la cantidad de investigadores del centro de investigacion');
	readln(c.cantInvestigadores);
	if(c.cantInvestigadores <> 0) then
		begin
			writeln('Ingrese la universidad del centro de investigacion');
			readln(c.universidad);
			writeln('Ingrese el nombre abreviado del centro de investigacion');
			readln(c.nombre);
			writeln('Ingrese la cantidad de becarios del centro de investigacion');
			readln(c.cantBecarios);
		end;
end;
procedure maximo(var max: integer; var uniMax: string; cant: integer; uni: string);
begin
	if(cant > max) then
		begin
			max:= cant;
			uniMax:= uni;
		end;
end;
procedure minimos(var min1, min2: integer; var cenMin1, cenMin2: string; bec: integer; nom: string);
begin
	if(bec < min1) then
		begin
			min2:= min1;
			min1:= bec;
			cenMin2:= cenMin1;
			cenMin1:= nom;
		end
	else
		if(bec < min2) then
			begin
				min2:= bec;
				cenMin2:= nom;
			end;
end;
procedure centroInvestigacion;
var
	c: centro;
    uniActual, cenMin1, cenMin2, uniMax: string;
    cantUni, cantInv, min1, min2, max: integer;
begin
	leerCentro(c);
    min1:= 999;
    min2:= 999;
    max:= -1;
	while(c.cantInvestigadores <> 0) do
		begin
			uniActual:= c.universidad;
			cantUni:= 0;
			cantInv:= 0;
			while(c.cantInvestigadores <> 0) and (uniActual = c.universidad) do
				begin
					cantUni:= cantUni + 1;
					cantInv:= cantInv + c.cantInvestigadores;
					minimos(min1, min2, cenMin1, cenMin2, c.cantBecarios, c.nombre);
					leerCentro(c);
				end;
			writeln('La universidad ', uniActual, ' tiene un total de ', cantUni, ' centros de investigacion');
			maximo(max, uniMax, cantInv, uniActual);
		end;
	writeln('La universidad con mayor cantidad de investigadores en sus centros es: ', uniMax);
    writeln('Los dos centros con menor cantidad de becarios son: ', cenMin1, ' y ', cenMin2);
end;
begin
	centroInvestigacion;
end.