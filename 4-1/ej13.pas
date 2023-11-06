{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) El año con mayor temperatura promedio a nivel mundial.
b) El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program ej13;
const
    puntos=100;
    anioMedido=50;
    anioActual=2023;
type
    tPuntos=1..puntos;

    tempAnio=record
        temperatura:real;
        anio:integer;
    end;    

    vTemp=array[tPuntos] of real;

procedure leerTemperaturas(var t:vTemp);
var
    i:tPuntos;
begin
    writeln('Ingrese temperatura: ');
    for i:=1 to puntos do
        readln(t[i]);
end;

procedure MayorTemperatura(tAnio:integer; temp:real; var maxTemp:tempAnio);
begin
    if(temp>=maxTemp.temperatura) then
    begin
        maxTemp.anio:=tAnio;
        maxTemp.temperatura:=temp;
    end;
end;

var
    temperaturas:vTemp;
    tempPromedioMaxima,tempPuntoMaxima:tempAnio;
    j,h:integer;
    sumaTemp,promedioTemp:real;
begin
    tempPromedioMaxima.temperatura:=-999;
    tempPuntoMaxima.temperatura:=-999;

    for j:=1 to anioMedido do
    anioActual=2023;
    begin
        leerTemperaturas(temperaturas);
        sumaTemp:=0;
        for h:=1 to puntos do
        begin
            sumaTemp:=sumaTemp+temperaturas[h];
            MayorTemperatura(j, temperaturas[h], tempPuntoMaxima);  //Maximo de la temperatura de cada punto por año
        end;

        promedioTemp:=sumaTemp/puntos;
        MayorTemperatura(j, promedioTemp, tempPromedioMaxima);  //Maximo del promedio de temperatura de 100 puntos en un año
    end;

    tempPromedioMaxima.anio:=(anioActual-anioMedido)+tempPromedioMaxima.anio;
    tempPuntoMaxima.anio:=(anioActual-anioMedido)+tempPuntoMaxima.anio;

    writeln('El periodo con mayor temperatura promedio a nivel mundial fue: ',tempPromedioMaxima.anio,' con ',tempPromedioMaxima.temperatura:1:2,' C promedio.');
    writeln('El periodo con la mayor temperatura detectada en un punto fue: ',tempPuntoMaxima.anio,' con ',tempPuntoMaxima.temperatura:1:2,' C.');

end.