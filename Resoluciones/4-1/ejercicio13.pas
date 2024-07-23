{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos
lugares, obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con
todos los datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos.
Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos
50 años (la información se ingresa ordenada por año). Una vez finalizada la carga de la información,
obtener:
a. El año con mayor temperatura promedio a nivel mundial.
b. El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program ejercicio13;
const
	dimFProm = 100;
	dimFLugar = 50;
type
	subProm = 1..dimFProm;
	vecPromedio = array [subProm] of real;
	subLugar = 1..dimFLugar;
	vecLugar = array [subLugar] of vecPromedio;
procedure cargarVector(var v: vecLugar);
var
	i, j: integer;
begin
	for i:= 1 to dimFLugar do
		for j:= 1 to dimFProm do
			v[i][j]:= Random(40)-10;
end;
procedure procesarVectorDeVectores(v: vecLugar; var anioMaxProm, anioLugarMax: integer);
var
	i, j: integer;
	promMaxAnio, sumaAnio, tempAnio, maxTempLugar, promAnio: real;
begin
	promMaxAnio:= -1;
	maxTempLugar:= -1;
	for i:= 1 to dimFLugar do
		begin
			sumaAnio:= 0;
			for j:= 1 to dimFProm do
				begin
					tempAnio:= v[i][j];
					sumaAnio:= sumaAnio + tempAnio;
					if(tempAnio > maxTempLugar) then
						begin
							maxTempLugar:= tempAnio;
							anioLugarMax:= i;
						end;
				end;
			promAnio:= sumaAnio / 100;
			if(promAnio > promMaxAnio) then
				begin
					promMaxAnio:= promAnio;
					anioMaxProm:= i;
				end;
		end;
end;
procedure imprimirVector(v: vecLugar);
var 
    i, j: integer;
begin
    for i:= 1 to dimFLugar do
        begin
            for j:= 1 to dimFProm do   
                begin
                    write(v[i][j]:0:2, ' | ');
                end; 
            writeln();
        end;
end;
var
	v: vecLugar;
	anioLugarMaxProm, anioMaxProm: integer;
begin
	Randomize;
	cargarVector(v);
    imprimirVector(v);
	procesarVectorDeVectores(v, anioMaxProm, anioLugarMaxProm);
	writeln('El anio con mayor temperatura promedio a nivel mundial: ', anioMaxProm);
    writeln('El anio con la mayor temperatura detectada en algun punto del planeta en los ultimos 50 anios es: ', anioLugarMaxProm);
end.
