{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program ejercicio2;
type
    subDia = 1..31;
    subAnio = 2019..2020;
    fecha = record
        dia: subDia;
        mes: string;
        anio: subAnio;
    end;
procedure leerFecha(var f: fecha);
begin
    writeln('Ingrese un anio de casamiento');
    readln(f.anio);
    if(f.anio <> 2020) then
        begin
            writeln('Ingrese un mes de casamiento');
            readln(f.mes);
            writeln('Ingrese un dia de casamiento');
            readln(f.dia);
        end;
end;
function cumpleMes(mes: string): boolean;
begin
    cumpleMes:= (mes = 'Enero') or (mes = 'Febrero') or (mes = 'Marzo');
end;
function cumpleDia(dia: integer): boolean;
begin
    cumpleDia:= (dia <= 10);
end;
procedure casamientos(var primeros3Meses, primeros10Dias: integer);
var
    f: fecha;
begin
    leerFecha(f);
    while(f.anio <> 2020) do
        begin
            if(cumpleMes(f.mes)) then
                primeros3Meses:= primeros3Meses + 1;
            if(cumpleDia(f.dia)) then
                primeros10Dias:= primeros10Dias + 1;
            leerFecha(f);
        end;
end;
var
    primeros3Meses, primeros10Dias: integer;
begin
    primeros3Meses:= 0;
    primeros10Dias:= 0;
    casamientos(primeros3Meses, primeros10Dias);
    writeln('La cantidad de casamientos realizados durante los meses de verano fue: ', primeros3Meses);
    writeln('La cantidad de casamientos realizados durante los primeros 10 dias de cada mes fue: ', primeros10Dias);
end.