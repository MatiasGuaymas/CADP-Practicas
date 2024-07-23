{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se
ingresa el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular
e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program ejercicio5;
type
	producto = record
		codigo: integer;
		desc: string;
		stockActual: integer;
		stockMin: integer;
		precio: real;
	end;
	lista = ^nodo;
	nodo = record
		dato: producto;
		sig: lista;
	end;
procedure leerProducto(var p: producto);
begin
	writeln('Ingrese el codigo del producto');
	readln(p.codigo);
	if(p.codigo <> -1) then
		begin
			writeln('Ingrese la descripcion del producto');
			readln(p.desc);
			writeln('Ingrese el stock actual del producto');
			readln(p.stockActual);
			writeln('Ingrese el stock minimo del producto');
			readln(p.stockMin);
			writeln('Ingrese el precio del producto');
			readln(p.precio);
		end;
end;
procedure agregarAdelante(var l: lista; p: producto);
var
	aux: lista;
begin
	new(aux);
	aux^.sig:= l;
	aux^.dato:= p;
	l:= aux;
end;
procedure cargarLista(var l: lista);
var
	p: producto;
begin
	leerProducto(p);
	while(p.codigo <> -1) do
		begin
			agregarAdelante(l, p);
			leerProducto(p);
		end;
end;
function cumple3Digitos(num: integer): boolean;
var
	dig: integer;
	cant: integer;
begin
	cant:= 0;
	while(num <> 0) and (cant < 3) do
		begin
			dig:= num mod 10;
			if(dig mod 2 = 0) then
				cant:= cant + 1;
			num:= num div 10;
		end;
	cumple3Digitos:= cant = 3;
end;
procedure minimo(var min1, min2: real; var codMin1, codMin2: integer; codigo: integer; precio: real);
begin
	if(precio < min1) then
		begin
			min2:= min1;
			min1:= precio;
			codMin2:= codMin1;
			codMin1:= codigo;
		end
	else
		if(precio < min2) then
			begin
				min2:= precio;
				codMin2:= codigo;
			end;
end;
procedure procesarLista(l: lista; var porcentaje: real; var codMin1, codMin2: integer);
var
	cant, stockMenor: integer;
	min1, min2: real;
begin
	cant:= 0;
	stockMenor:= 0;
	min1:= 9999;
	min2:= 9999;
	while(l <> nil) do
		begin
			cant:= cant + 1;
			if(l^.dato.stockActual < l^.dato.stockMin) then
				stockMenor:= stockMenor + 1;
			if(cumple3Digitos(l^.dato.codigo)) then
				writeln('Descripcion: ', l^.dato.desc);
			minimo(min1, min2, codMin1, codMin2, l^.dato.codigo, l^.dato.precio);
            l:= l^.sig;
		end;
	porcentaje:= (stockMenor / cant) * 100;
end;
var
	l: lista;
	porcentaje: real;
	codMin1, codMin2: integer;
begin
	l:= nil;
	cargarLista(l);
	procesarLista(l, porcentaje, codMin1, codMin2);
	writeln('El porcentaje de productos con stock actual por debajo de su stock minimo es: ', porcentaje:0:2);
	writeln('Los codigos de los dos productos mas economicos son: ', codMin1, ' y ', codMin2);
end.