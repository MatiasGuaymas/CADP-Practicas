{En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo
Local. Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) La cantidad de galaxias de cada tipo.
b) La masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) El nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

//registro con nombre, tipo, masa, distancia. Vector con 53 variables de registro.
//modulo para leer registro, dentro de modulo para leer vector
//a- vector de 4 posiciones que almacene cantidad de cada tipo
//b- variable para masa de las 3 galaxias principales. Variable para sumar la masa de todas las galaxias. (3galax/Total) *100
//c- condicion tipo distinto de 4 and distancia <1000pc then cant+1
//d- dos maximos, dos minimos. Registros con nombre y masa

program ej12;
const
    cantGalaxias=53;
    cantTipos=4;
    distanciaPc=1000;
type
    gRango=1..cantGalaxias;
    gTipo=1..cantTipos;
    str=string[40];

    galaxia=record
        nombre:str;
        tipo:gTipo;
        masa:real;
        distancia:real;
    end;

    condGalaxia=record
        cNombre:str;
        cMasa:real;
    end;

    vecGalaxias=array[gRango] of galaxia;
    vGalaxTipos=array[gTipo] of integer;

procedure leerGalaxia(var g:galaxia);
begin
    writeln('Nombre: '); readln(g.nombre);
    writeln('Tipo: '); readln(g.tipo);
    writeln('Masa: '); readln(g.masa);
    writeln('Distancia: '); readln(g.distancia);
    writeln('..........................');
end;

procedure leerTotalGalaxias(var vg:vecGalaxias);
var
    i:gRango;
begin
    for i:=1 to cantGalaxias do
        leerGalaxia(vg[i]);
end;

procedure Inicializar(var v:vGalaxTipos);
var
    h:gTipo;
begin
    for h:=1 to cantTipos do
        v[h]:=0;
end;

procedure TipoGalaxia(tipoGalaxia:gTipo; var contadorTipos:vGalaxTipos);
begin
    contadorTipos[tipoGalaxia]:=contadorTipos[tipoGalaxia]+1;
end;

procedure InformarTipos(vec:vGalaxTipos);
var
    k:gTipo;
begin
    for k:=1 to cantTipos do
        writeln('La cantidad de galaxias del tipo ', k, ' es de: ',vec[k]);
    writeln('..........................');
end;

procedure MasaGalaxias(gNombre:str; gMasa:real; var gMasaPrincipales:real; var gMasaTotal:real);    //gMasaPrincipales y gMasaTotal incializadas en prog principal
begin
    if((gNombre='Via Lactea') or (gNombre='Andromeda') or (gNombre='Triangulo')) then
        gMasaPrincipales:=gMasaPrincipales+gMasa;
    
    gMasaTotal:=gMasaTotal+gMasa;
end;

function CondicionGalaxia(galaxTipo:gTipo; gDistancia:real):boolean;
begin
    CondicionGalaxia:=((galaxTipo<>4) and (gDistancia<distanciaPc));
end;

procedure MayorMasa(galaxNombre:str; galaxMasa:real; var maxGalaxia1:condGalaxia; var maxGalaxia2:condGalaxia); //maxGalaxia1 inicializada en prog principal
begin
    if(galaxMasa>maxGalaxia1.cMasa) then
    begin
        maxGalaxia2:=maxGalaxia1;
        maxGalaxia1.cNombre:=galaxNombre;
        maxGalaxia1.cMasa:=galaxMasa;
    end
    else if(galaxMasa>maxGalaxia2.cMasa) then
    begin
        maxGalaxia2.cNombre:=galaxNombre;
        maxGalaxia2.cMasa:=galaxMasa;
    end;
end;

procedure MenorMasa(galNombre:str; galMasa:real; var minGalaxia1:condGalaxia; var minGalaxia2:condGalaxia); //minGalaxia1 inicializada en el prog principal
begin
    if(galMasa<minGalaxia1.cMasa) then
    begin
        minGalaxia2:=minGalaxia1;
        minGalaxia1.cNombre:=galNombre;
        minGalaxia1.cMasa:=galMasa;
    end
    else if(galMasa<minGalaxia2.cMasa) then
    begin
        minGalaxia2.cNombre:=galNombre;
        minGalaxia2.cMasa:=galMasa;
    end;
end;

var
    galaxias:vecGalaxias;
    tiposGalaxias:vGalaxTipos;
    masaGalaxiasPrincipales, masaTotalGalaxias, porcentajeMasa:real;
    galaxiaMenor1, galaxiaMenor2, galaxiaMayor1, galaxiaMayor2:condGalaxia;
    j, cantGalaxiasCondicion:integer;
begin
    masaGalaxiasPrincipales:=0;
    masaTotalGalaxias:=0;
    galaxiaMenor1.cNombre:='';
    galaxiaMenor1.cMasa:=32767;
    galaxiaMayor1.cNombre:='';
    galaxiaMayor1.cMasa:=-1;
    cantGalaxiasCondicion:=0;
    Inicializar(tiposGalaxias);

    leerTotalGalaxias(galaxias);

    for j:=1 to cantGalaxias do
    begin
        TipoGalaxia(galaxias[j].tipo, tiposGalaxias);
        MasaGalaxias(galaxias[j].nombre, galaxias[j].masa, masaGalaxiasPrincipales, masaTotalGalaxias);
        if(CondicionGalaxia(galaxias[j].tipo, galaxias[j].distancia)) then
            cantGalaxiasCondicion:=cantGalaxiasCondicion+1;
        MayorMasa(galaxias[j].nombre, galaxias[j].masa, galaxiaMayor1, galaxiaMayor2);
        MenorMasa(galaxias[j].nombre, galaxias[j].masa, galaxiaMenor1, galaxiaMenor2);
    end;

    porcentajeMasa:=(masaGalaxiasPrincipales/masaTotalGalaxias)*100;

    InformarTipos(tiposGalaxias);
    writeln('La masa acumulada de las 3 principales galaxias es de ', masaGalaxiasPrincipales:1:2,'kg. Siendo la masa total ', masaTotalGalaxias:1:2,'kg, representa un %',porcentajeMasa:1:2);
    writeln('La cantidad de galaxias no irregulares a menos de 1000pc es de: ', cantGalaxiasCondicion);
    writeln('Las dos galaxias con mayor masa son ',galaxiaMayor1.cNombre,' y ',galaxiaMayor2.cNombre);
    writeln('Las dos galaxias con menor masa son ',galaxiaMenor1.cNombre,' y ',galaxiaMenor2.cNombre);
end.