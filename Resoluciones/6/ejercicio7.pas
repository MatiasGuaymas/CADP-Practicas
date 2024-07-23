{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio
anterior, se han determinado los siguientes criterios:
- Sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- No se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse
desde la superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6),
implementar un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con
los nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de
la ESA y retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro
con aquellos que no los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad
y el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por
H2020. Para ello, utilice el módulo realizado en b.}

program ejercicio6;
const
	DF = 7;
type
	subCategoria = 1..DF;
	sonda = record
		nombre: string;
		duracion: integer;
		costoConstruccion: real;
		costoMantenimiento: real;
		rango: subCategoria;
	end;
	lista = ^nodo;
	nodo = record
		dato: sonda;
		sig: lista;
	end;
	vecCategorias = array[subCategoria] of integer;
procedure leerSonda(var s:sonda);
begin
    writeln('Nombre: '); readln(s.nombre);
    writeln('Duracion mision: '); readln(s.duracion);
    writeln('Costo construccion: '); readln(s.costoConstruccion);
    writeln('Costo mantenimiento: '); readln(s.costoMantenimiento);
    writeln('Categoria sonda: '); readln(s.rango);
    writeln('...........................');
end;
procedure agregarAdelante(var l:lista; s:sonda);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=s;
    aux^.sig:=l;
    l:=aux;
end;
procedure generarLista(var l:lista);  
var
    s:sonda;
begin
    repeat
        leerSonda(s);
        agregarAdelante(l, s);
    until(s.nombre='GAIA');
end;
function cumpleCriterios(s: sonda): boolean;
begin
	cumpleCriterios:= ((s.costoMantenimiento < s.costoConstruccion) and (s.rango <> 1));
end;
procedure retornarListados(l: lista; var lisCumple, lisNOCumple: lista);
begin
	while(l <> nil) do
		begin
			if(cumpleCriterios(l^.dato)) then
				agregarAdelante(lisCumple, l^.dato)
			else
				agregarAdelante(lisNOCumple, l^.dato);
			l:= l^.sig;
		end;
end;
procedure procesarListaNoCumple(l: lista; var cant: integer; var costoTotal: real);
begin
	while(l <> nil) do
		begin
			cant:= cant + 1;
			costoTotal:= costoTotal + (l^.dato.costoConstruccion + l^.dato.costoMantenimiento);
			l:= l^.sig;
		end;
end;
procedure imprimirLista(l: lista);
begin
	while(l <> nil) do
		begin
			writeln(l^.dato.nombre, ' ', ' Precio=', (l^.dato.costoConstruccion + l^.dato.costoMantenimiento):0:2);
			l:= l^.sig;
		end;
end;
var
	l, lisCumple, lisNoCumple: lista;
	cant: integer;
	costoTotal: real;
begin
	l:= nil;
	lisCumple:= nil;
	lisNoCumple:= nil;
	cant:= 0;
	costoTotal:= 0;
	generarLista(l);
	retornarListados(l, lisCumple, lisNoCumple);
	writeln('Lista de sondas que cumplen con los criterios:');
	imprimirLista(lisCumple);
	writeln('Lista de sondas que NO cumplen con los criterios:');
	imprimirLista(lisNoCumple);
	procesarListaNoCumple(lisNoCumple, cant, costoTotal);
	writeln('La cantidad total de los proyectos que no seran financiados es: ', cant);
	writeln('El costo total de los proyectos que no seran financiados es: ', costoTotal:0:2);
end.