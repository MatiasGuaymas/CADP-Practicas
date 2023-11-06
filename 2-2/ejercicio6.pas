{Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program ejercicio6;
procedure leerProd(var codmin1, codmin2, codPant: integer; var pPromedio, pmin1, pmin2,max : real);
var
	precio: real;
	cod: integer;
	tipo: String;
begin
	write('Ingresar precio del producto: ');
	readln(precio);
	write('Ingresar codigo del producto: ');
	readln(cod);
	write('Ingresar tipo del producto ');
	readln(tipo);
	if (precio < pmin1) then begin
		pmin2:= pmin1;
		pmin1:= precio;
		codmin2:= codmin1;
		codmin1:= cod;
		end
		else 
		if (precio < pmin2) then begin
			pmin2:= precio;
			codmin2:= cod;
			end;
	pPromedio:= pPromedio + precio;
	if (tipo = 'Pantalon') OR (tipo = 'pantalon') then begin
		if (precio > max) then begin
			max:= precio;
			codPant:= cod;
			end;
			end;
end;
var
	codmin1, codmin2, codPant,i: integer;
	pPromedio, pmin1, pmin2, max: real;
Begin
	codPant:= 999;
	codmin1:= 999;
	codmin2:= 999;
	pPromedio:= 0;
	max:= -1;
	pmin1:= 99999;
	pmin2:= 99999;
	for i:= 1 to 100 do begin
		leerProd(codmin1, codmin2, codPant, pPromedio, pmin1, pmin2, max);
	end;
	writeln('El precio promedio es ',pPromedio/100:2:2);
	writeln('El codigo del producto mas barato es ',codmin1,' seguido del codigo ',codmin2);
	writeln('El codigo del pantalon mas caro es ',codPant);
end.