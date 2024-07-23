{14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido
en los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió
en dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de
proyecto -1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a. El monto total invertido en desarrolladores con residencia en Argentina.
b. La cantidad total de horas trabajadas por Administradores de bases de datos.
c. El código del proyecto con menor monto invertido.
d. La cantidad de Arquitectos de software de cada proyecto.}

program ejercicio14;
const
	dimf = 1000;
type
	subCode = 1..dimf;
	subRol = 1..5;
	desarrollador = record
		pais: string;
		codigo: integer;
		nomProyecto: string;
		rol: subRol;
		cantHoras: integer;
	end;
	vecRoles = array [subRol] of real;
	vecMontos = array [subCode] of real;
	vecArquitectos = array [subCode] of integer;
procedure cargarSueldos(var v: vecRoles);
begin
	v[1]:= 35.20;
	v[2]:= 27.45; 
	v[3]:= 31.03;
	v[4]:= 44.28;
	v[5]:= 39.87;
end;
procedure inicializarVectores(var vec1: vecMontos; var vec2: vecArquitectos);
var
	i: subCode;
begin
	for i:= 1 to dimf do
		begin
			vec1[i]:= 0;
			vec2[i]:= 0;
		end;
end;
procedure leerDesarrollador(var d:desarrollador);
begin
    writeln('Codigo proyecto: '); readln(d.codigo);
    if(d.codigo<>-1) then begin
        writeln('Pais: '); readln(d.pais);
        writeln('Nombre proyecto: '); readln(d.nomProyecto);
        writeln('Rol desarrollador: '); readln(d.rol);
        writeln('Horas trabajadas: '); readln(d.cantHoras);
    end;
    writeln('..................');
end;
procedure procesarLeer(var montoArgentina: real; var cantHorasBD: integer; var vecArq: vecArquitectos; var vecMon: vecMontos; vecRol: vecRoles);
var
	d: desarrollador;
	montoDesarrollador: real; 
	diml: integer;
begin
	leerDesarrollador(d);
	diml:= 0;
	while(d.codigo <> -1) do
		begin
			montoDesarrollador:= d.cantHoras * vecRol[d.rol];
			if(d.pais = 'Argentina') then
				montoArgentina:= montoArgentina + montoDesarrollador;
			if(d.rol = 3) then
				cantHorasBD:= cantHorasBD + d.cantHoras
			else
				if(d.rol = 4) then
					vecArq[d.codigo]:= vecArq[d.codigo] + 1;
			vecMon[d.codigo]:= vecMon[d.codigo] + montoDesarrollador;
			diml:= diml + 1;
			leerDesarrollador(d);
		end;
	writeln('Se leyeron ', diml, ' desarolladores en total');
end;
function minimo (v: vecMontos): integer;
var
	max: real;
	posMax: integer;
	i: subCode;
begin
	max:= -1;
	for i:= 1 to dimf do
		if(v[i] > max) then
			begin
				max:= v[i];
				posMax:= i;
			end;
	minimo:= posMax;
end;
procedure informarArquitectos(v: vecArquitectos);
var
	i: subCode;
begin
	for i:= 1 to dimf do
		writeln('La cantidad de Arquitectos de software en el proyecto con codigo ', i, ' es: ', v[i]);
end;
var
	vecRol: vecRoles;
	vecMon: vecMontos;
	vecArq: vecArquitectos;
	montoArgentina: real;
	cantHorasBD: integer;
begin
	montoArgentina:= 0;
	cantHorasBD:= 0;
	cargarSueldos(vecRol);
	inicializarVectores(vecMon, vecArq);
	procesarLeer(montoArgentina, cantHorasBD, vecArq, vecMon, vecRol);
	writeln('El monto total invertido en desarrolladores con residencia en Argentina es: ', montoArgentina:0:2);
	writeln('La cantidad de horas trabajadas por Administradores de bases de datos es: ', cantHorasBD);
	writeln('El codigo del proyecto con menor monto invertido es: ', minimo(vecMon));
	informarArquitectos(vecArq);
end.
	