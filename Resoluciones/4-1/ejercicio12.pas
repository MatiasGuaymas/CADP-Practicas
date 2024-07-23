{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) La cantidad de galaxias de cada tipo.
b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program ejercicio12;
const
	dimf = 3;
type
	subGalaxia = 1..dimf;
	subTipo = 1..4;
	galaxia = record
		nombre: string;
		tipo: subTipo;
		masa: real;
		distancia: real;
	end;
	vecGalaxias = array[subGalaxia] of galaxia;
	vecContador = array[subTipo] of integer;
procedure leerGalaxia(var g: galaxia);
begin
	writeln('Ingrese el nombre de la galaxia');
	readln(g.nombre);
	writeln('Ingrese el tipo de galaxia (1 a 4)');
	readln(g.tipo);
	writeln('Ingrese la masa medida en kg de la galaxia');
	readln(g.masa);
	writeln('Ingrese la distancia en parsecs medida desde la Tierra a la galaxia');
	readln(g.distancia);
end;
procedure cargarVector(var v: vecGalaxias);
var
	i: subGalaxia;
	g: galaxia;
begin
	for i:= 1 to dimf do
		begin
			leerGalaxia(g);
			v[i]:= g;
		end;
end;
procedure inicializarVector(var v: vecContador);
var
	i: subTipo;
begin
	for i:= 1 to 4 do
		v[i]:= 0;
end;
function cumpleNombre(nom: string): boolean;
begin
	cumpleNombre:= (nom = 'La Via Lactea') or (nom = 'Andromeda') or (nom = 'Triangulo');
end;
function cumpleTipoDistancia(tipo: subTipo; dist: real): boolean;
begin
	cumpleTipoDistancia:= (not(tipo = 4) and (dist < 1000));
end;
procedure maximos(var max1, max2: real; var nomMax1, nomMax2: string; masa: real; nom: string);
begin
	if(masa > max1) then
		begin
			max2:= max1;
			max1:= masa;
			nomMax2:= nomMax1;
			nomMax1:= nom;
		end
	else
		if(masa > max2) then
			begin
				max2:= masa;
				nomMax2:= nom;
			end;
end;
procedure minimos(var min1, min2: real; var nomMin1, nomMin2: string; masa: real; nom: string);
begin
	if(masa < min1) then
		begin
			min2:= min1;
			min1:= masa;
			nomMin2:= nomMin1;
			nomMin1:= nom;
		end
	else
		if(masa < min2) then
			begin
				min2:= masa;
				nomMin2:= nom;
			end;
end;
procedure procesar(v: vecGalaxias; var vecCont: vecContador; var masaTotal3G, porcentaje: real; var cantGalNoIrreg: integer; var nomMax1, nomMax2, nomMin1, nomMin2: string);
var
	i: subGalaxia;
	tipo: subTipo;
	masaTotal, masa, max1, max2, min1, min2: real;
	nombre: string;
begin
	masaTotal:= 0;
	max1:= -999;
	max2:= -999;
	min1:= 9999;
	min2:= 9999;
	for i:= 1 to dimf do
		begin
			tipo:= v[i].tipo;
			masa:= v[i].masa;
			nombre:= v[i].nombre;
			vecCont[tipo]:= vecCont[tipo] + 1;
			if(cumpleNombre(nombre)) then
				masaTotal3G:= masaTotal3G + masa;
			masaTotal:= masaTotal + masa;
			if(cumpleTipoDistancia(tipo, v[i].distancia)) then
				cantGalNoIrreg:= cantGalNoIrreg + 1;
			maximos(max1, max2, nomMax1, nomMax2, masa, nombre);
			minimos(min1, min2, nomMin1, nomMin2, masa, nombre);
		end;
	porcentaje:= (masaTotal3G / masaTotal)*100;
end;
procedure imprimirVector(v: vecContador);
var
	i: subTipo;
begin
	for i:= 1 to 4 do
		writeln('La cantidad de galaxias del tipo ', i, ' es:', v[i]);
end;
var
	v: vecGalaxias;
	vecCont: vecContador;
	masaTotal3G, porcentaje: real;
	cantGalNoIrreg: integer;
	nomMax1, nomMax2, nomMin1, nomMin2: string;
begin
	cargarVector(v);
	inicializarVector(vecCont);
	masaTotal3G:= 0;
	porcentaje:= 0;
	cantGalNoIrreg:= 0;
	procesar(v, vecCont, masaTotal3G, porcentaje, cantGalNoIrreg, nomMax1, nomMax2, nomMin1, nomMin2);
	imprimirVector(vecCont);
	writeln('La masa total acumulada de las 3 galaxias principales (la Via Lactea, Andromeda y Triangulo) es: ', masaTotal3G:0:2, ' y el porcentaje que esto representa respecto a la masa de todas las galaxias es: ', porcentaje:0:2, '%');
	writeln('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es: ', cantGalNoIrreg);
	writeln('El nombre de las dos galaxias con mayor masa son: ', nomMax1, ' y ', nomMax2, '  y el de las dos galaxias con menor masa son: ', nomMin1, ' y ', nomMin2);
end.