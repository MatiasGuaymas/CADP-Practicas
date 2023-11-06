{El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante el año
2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.
a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.
b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).
c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los meses de verano 
(enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program ej2;
type
    fecha=record
        dia:integer;
        mes:string;
        ciclo:integer;
    end;

procedure leer(var date:fecha);
begin
    writeln('Ingrese ciclo: '); readln(date.ciclo);
    if(date.ciclo=2019) then begin
        writeln('Ingrese dia: '); readln(date.dia);
        writeln('Ingrese mes: '); readln(date.mes);
    end;
end;

function CasamientoVerano(mesCasamiento:string):boolean;
begin
    CasamientoVerano:=((mesCasamiento='enero') or (mesCasamiento='febrero') or (mesCasamiento='marzo'));
end;

function CasamientoDia10(diaCasamiento:integer):boolean;
begin
    CasamientoDia10:=(diaCasamiento<=10);
end;

var
    fechaCasamiento:fecha;
    cantVerano, cantDia10:integer;
begin
    cantVerano:=0;
    cantDia10:=0;
    leer(fechaCasamiento);
    
    while(fechaCasamiento.ciclo<>2020) do
    begin
        if(CasamientoVerano(fechaCasamiento.mes)) then
            cantVerano:=cantVerano+1;
        if(CasamientoDia10(fechaCasamiento.dia)) then
            cantDia10:=cantDia10+1;
        leer(fechaCasamiento);
    end;

    writeln('Casamientos en verano: ',cantVerano);
    writeln('Casamiento en primeros 10 dias: ',cantDia10);

end.