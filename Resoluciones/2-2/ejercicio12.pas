{12. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:
Tipo de zona    Rendimiento por ha
1               6 toneladas por ha
2               2,6 toneladas por ha
3               1,4 toneladas por ha
b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.}


program ejercicio12;
type
    subZona = 1..3;
function rendimientoEconomico(tipo: subZona; cant, precio: real): real;
begin
    case tipo of
        1: rendimientoEconomico:= (6*cant*precio);
        2: rendimientoEconomico:= (2.6*cant*precio);
        3: rendimientoEconomico:= (1.4*cant*precio);
    end;
end;
procedure leerCampo(var localidad: string; var cant: integer; var tipo: subZona);
begin
    writeln('Ingrese la localidad del campo');
    readln(localidad);
    writeln('Ingrese la cantidad de de hectareas sembradas');
    readln(cant);
    writeln('Ingrese el tipo de zona');
    readln(tipo);
end;
procedure maximo(localidad: string; rendimiento: real; var max: real; var localidadMax: string);
begin
    if(rendimiento >= max) then
        begin
            max:= rendimiento;
            localidadMax:= localidad;
        end;
end;
procedure minimo(localidad: string; rendimiento: real; var min: real; var localidadMin: string);
begin
    if(rendimiento <= min) then
        begin
            min:= rendimiento;
            localidadMin:= localidad;
        end;
end;
procedure lecturaDeCampos;
var
    localidad, localidadMax, localidadMin: string;
    tipo: subZona;
    cant, cantTotal, campos3Febrero: integer;
    rendimiento, rendimientoTot, max, min: real;
begin
    campos3Febrero:= 0;
    rendimientoTot:= 0;
    cantTotal:= 0;
    max:= -1;
    min:= 9999;
    repeat
        leerCampo(localidad, cant, tipo);
        cantTotal:= cantTotal + 1;
        rendimiento:= rendimientoEconomico(tipo, cant, 320);
        rendimientoTot:= rendimientoTot + rendimiento;
        if(localidad = 'Tres de Febrero') and (rendimiento > 10000) then
            campos3Febrero:= campos3Febrero + 1;
        maximo(localidad, rendimiento, max, localidadMax);
        minimo(localidad, rendimiento, min, localidadMin);
    until (cant = 900) and (localidad = 'Saladillo');
    writeln('La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a US$10000 es: ', campos3Febrero);
    writeln('La localidad del campo con mayor rendimiento economico esperado es: ', localidadMax);
    writeln('La localidad del campo con menor rendimiento economico esperado es: ', localidadMin);
    writeln('El rendimiento economico promedio es: ', (rendimientoTot/cantTotal):0:2);
end;
begin
    lecturaDeCampos;
end.
    