{a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program ejercicio5;
function doble(numA:Integer; numB:Integer): Boolean;
var
	ok: Boolean;
begin
	ok:= false;

	if (numB = numA * 2  ) then 
	begin
		ok:=true;
	end;

	doble:= ok;
end;

var
	numA, numB,cantLeidos,cantEsDoble: Integer;
begin
		
	cantLeidos:=0;
	cantEsDoble:=0;

	write('Ingrese el numeroA: ');
	readln(numA);
	write('Ingrese el numeroB: ');
	readln(numB);
	writeln('--------------------');

	while (numA <> 0) or (numB <> 0) do 
	begin
		cantLeidos:= cantLeidos + 1;

		if doble(numA, numB) then 
		begin
			cantEsDoble:= cantEsDoble + 1;
		end;

		write('Ingrese el numeroA: ');
		readln(numA);
		write('Ingrese el numeroB: ');
		readln(numB);
		writeln('--------------------');
	end;

	writeln('La cantidad de numeros totales de pares leidos son: ', cantLeidos)	;
	writeln('La cantidad de pares en las que numB es el doble de numA es: ', cantEsDoble);

	readln();
	

end.