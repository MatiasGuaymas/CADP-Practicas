{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) El año con mayor temperatura promedio a nivel mundial.
b) El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program ej13V2;
const
    puntos=100;
    anioMedido=50;
    anioActual=2023;
type
    rangoPuntos=1..puntos;
    rangoAnios=1..anioMedido;

    tempAnio=record
        anio:integer;
        temperatura:real;
    end;

    vTemp=array[rangoPuntos] of real;
    vAnio=array[rangoAnios] of vTemp;

procedure leerTemperaturas(var t:vTemp);
var
    i:rangoPuntos;
begin
    writeln('Ingrese temperatura: ');
    for i:=1 to puntos do
        readln(t[i]);
end;

procedure leerAnios(var a:vAnio);
var
    k:rangoAnios;
begin
    for k:=1 to anioMedido do
        leerTemperaturas(a[k]);
end;

procedure MayorTemperatura(tAnio:integer; temp:real; var maxTemp:tempAnio);
begin
    if(temp>=maxTemp.temperatura) then
    begin
        maxTemp.temperatura:=temp;
        maxTemp.anio:=tAnio;
    end;
end;


var
    tempXAnio:vAnio;
    tempPromedioMaxima, tempPuntoMaxima:tempAnio;
    j:rangoAnios;
    h:rangoPuntos;
    sumaTemp,promedioTemp:real;
begin
    tempPromedioMaxima.temperatura:=-999;
    tempPuntoMaxima.temperatura:=-999;

    leerAnios(tempXAnio);

    for j:=1 to anioMedido do
    begin
        sumaTemp:=0;
        for h:=1 to puntos do
        begin
            sumaTemp:=sumaTemp+tempXAnio[j][h];
            MayorTemperatura(j, tempXAnio[j][h], tempPuntoMaxima); //Maximo de la temperatura de cada punto por año
        end;

        promedioTemp:=sumaTemp/puntos;
        MayorTemperatura(j, promedioTemp, tempPromedioMaxima); //Maximo de la temperatura de cada punto por año
    end;

    tempPromedioMaxima.anio:= (anioActual - anioMedido) + tempPromedioMaxima.anio;
    tempPuntoMaxima.anio:= (anioActual - anioMedido) + tempPuntoMaxima.anio;

    writeln('El periodo con mayor temperatura promedio a nivel mundial fue: ',tempPromedioMaxima.anio,' con ',tempPromedioMaxima.temperatura:1:2,' C promedio.');
    writeln('El periodo con la mayor temperatura detectada en un punto fue: ',tempPuntoMaxima.anio,' con ',tempPuntoMaxima.temperatura:1:2,' C.');

end.