{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program ejercicio10;
const
	dimf = 300;
type
	subEmp = 1..dimf;
	vecSalarios = array[subEmp] of real;
procedure cargarVector(var v: vecSalarios; var diml: integer);
var
	salario: real;
begin
	writeln('Ingrese el salario de un empleado');
	readln(salario);
	while(diml < dimf) and (salario <> 0) do
		begin
			diml:= diml +1;
			v[diml]:= salario;
			writeln('Ingrese el salario de un empleado');
			readln(salario);
		end;
end;
procedure incrementarSalarios(var v: vecSalarios; diml: integer; x: real);
var
	i: subEmp;
    porcentaje: real;
begin
	porcentaje:= x/100 + 1.5;
	for i:= 1 to diml do
		begin
			v[i]:= v[i] * porcentaje;
		end;
end;
procedure imprimirVector(v: vecSalarios; diml: integer);
var
	i: subEmp;
begin
	for i:= 1 to diml do
		writeln('Salario empleado ', i, '=',v[i]:0:2);
end;
var
	v: vecSalarios;
	diml: integer;
    x: real;
begin
	diml:= 0;
	cargarVector(v, diml);
	writeln('Ingrese un valor real X para incrementar salarios');
	readln(x);
	incrementarSalarios(v, diml, x);
	imprimirVector(v, diml);
end.