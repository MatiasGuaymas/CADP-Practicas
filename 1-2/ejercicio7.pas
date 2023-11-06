{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejercicio7;
const
	Df= 100;
var
	nombrePiloto, maxNombre1, maxNombre2, minNombre1, minNombre2: String;
	tiempoTotal: Real;
	maxPrimero1, maxPrimero2, min1Ultimo1, min1Ultimo2: Real;
	i: Integer;
begin
	maxPrimero1:= 9999;
	maxPrimero2:= 9999;
	maxNombre1:= '';
	maxNombre2:= '';

	min1Ultimo1:= -1;
	min1Ultimo2:= -1;
	minNombre1:= '';
	minNombre2:= '';

	for i := 1 to Df do
	begin
		write('Ingrese el NOMBRE DEL PILOTO: ');
		readln(nombrePiloto);
		write('Ingrese TIEMPO TOTAL EN FINALIZAR LA CARRERA: ');
		readln(tiempoTotal);
		writeln('-------------------------------------------');

		if (tiempoTotal <= maxPrimero1) then 
		begin
			maxPrimero2:= maxPrimero1;
			maxNombre2:= maxNombre1;
			maxPrimero1:= tiempoTotal;
			maxNombre1:= nombrePiloto;	
		end
		else
			if (tiempoTotal <= maxPrimero2) then 
			begin
				maxPrimero2:= tiempoTotal;
				maxNombre2:= nombrePiloto;
			end;

		if (tiempoTotal >= min1Ultimo1) then 
		begin
			min1Ultimo2:= min1Ultimo1;
			minNombre2:= minNombre1;
			min1Ultimo1:= tiempoTotal;
			minNombre1:= nombrePiloto;
		end
		else
			if (tiempoTotal >= min1Ultimo2) then 
			begin
				min1Ultimo2:= tiempoTotal;
				minNombre2:= nombrePiloto;
			end;

	end;
	writeln('Los nombres de los pilotos que terminaron en primer lugar son: ',maxNombre1, ' y ', maxNombre2 );
	writeln('Los nombres de los pilotos en terminar en ultimo lugar la carrera son: ', minNombre1, ' y ', minNombre2);
	readln();

	
end.