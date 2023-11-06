{a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
 Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
 Tipo de zona 1: rendimiento 6 por ha
 Tipo de zona 2: rendimiento 2,6 por ha
 Tipo de zona 3: rendimiento 1,4 por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio}
program Ej12;
function calcularRendimiento(cantHA, precioDolar: real; zona: integer):real;		// INCISO A
begin
	case zona of
		1: calcularRendimiento:=(cantHA*precioDolar*6);
		2: calcularRendimiento:= (cantHA*precioDolar*2.6);
		3: calcularRendimiento:= (cantHA*precioDolar*1.4);
	else
		writeln('Tipo de siembra no valida');
		end;
end;
var
	cantHA, precioDolar, rendimiento, max,min, rendTotal: real;
	zona, tresFebDiezmil, cantTotal: integer;
	localidad, localidadMax, localidadMin: String;
Begin
	max:= -1;
	min:= 99999;
	rendTotal:= 0;
	cantTotal:= 0;
	tresFebDiezmil:= 0;
	precioDolar:= 320;
	repeat				// INCISO B ARBA
		write('Ingresar localidad: ');
		readln(localidad);
		write('Ingresar cantidad de hectareas: ');
		readln(cantHA);
		write('Ingresar numero segun tipo de siembra 1: zona muy fertil, 2: zona estandar, 3: zona arida: ');
		readln(zona);
		rendimiento:= calcularRendimiento(cantHA, precioDolar, zona);
		rendTotal:= rendTotal + rendimiento;
		cantTotal:= cantTotal +1;
		if (localidad = 'Tres de Febrero') AND (rendimiento > 10000) then
			tresFebDiezmil:= tresFebDiezmil+1;
		if (rendimiento > max)then begin
			max:= rendimiento;
			localidadMax:= localidad;
			end
			else if (rendimiento < min)then begin
				min:= rendimiento;
				localidadMin:= localidad;
			end;
	until ((cantHA = 900) AND (localidad = 'Saladillo'));
	writeln('La cantidad de campos en Tres de Febrero con rendimiento superior a 10000 es: ',tresFebDiezmil);
	writeln('La localidad del campo con mayor rendimiento es :',localidadMax);
	writeln('La localidad del campo con menor rendimiento es: ',localidadMin);
	writeln('El rendimiento economico promedio es: ',rendTotal/cantTotal);
end.