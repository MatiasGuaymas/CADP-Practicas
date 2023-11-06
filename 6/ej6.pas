{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma
Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}

//Requiero lista cuyo elemento sea un registro con nombre, duración mision, costo construcción, costo mantenimiento y categoria
//Debo leer los datos y almacenar la información con un repeat until (gaia condicion de corte se procesa)

//a) calcular un maximo, que considere suma de costo construcción y costo mantenimiento
//b) array de df 7 que almacene cantidad de sondas por categoria (debo inicializarlo en 0 con modulo)
//c) debo hacer un primer recorrido calculando la suma de duraciones y cantidad de sondas. Luego recorrer de vuelta contando cantidad de
//sondas cuya duración supere el promedio calculado (suma de duraciones / cantidad de sondas)
//d) en un primer recorrido calculo suma de costos de construcción y cantidad de sondas. En un segundo recorrido informo mientras recorro el
//nombre de cada sonda cuyo costo de construcción sea mayor al promedio del costo (suma de costos / cantidad de sondas)
//Debo recorrer la menor cantidad de veces posibles la lista. Una para calcular inciso a, b, cantidad sondas, suma de duraciones y suma de costos
//Luego otra para obtener cantidad sondas duracion mayor al promedio e informar nombre de aquellas con costo mayor al promedio.

program ej6;
const
    categorias=7;
type
    rangoCategorias=1..categorias;

    sonda=record
        nombre:string;
        duracionMision:integer;
        costoConstruccion:real;
        costoMantenimiento:real;
        categoria:rangoCategorias;
    end;

    listaS= ^nodoS;

    nodoS=record
        elemento:sonda;
        sig:listaS;
    end;

    categoriasEspectro= array[rangoCategorias] of integer;

procedure leerRegistro(var s:sonda);
begin
    writeln('Nombre: '); readln(s.nombre);
    writeln('Duracion mision: '); readln(s.duracionMision);
    writeln('Costo construccion: '); readln(s.costoConstruccion);
    writeln('Costo mantenimiento: '); readln(s.costoMantenimiento);
    writeln('Categoria sonda: '); readln(s.categoria);
    writeln('...........................');
end;

procedure leerLista(var l:listaS; s:sonda);
var
    nuevo:listaS;
begin
    new(nuevo);
    nuevo^.elemento:=s;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarLista(var l:listaS);   //l:=nil en programa principal. Generar lista en programa principal
var
    s:sonda;
begin
    repeat
        leerRegistro(s);
        leerLista(l, s);
    until(s.nombre='Gaia');
end;

procedure inicializarVector(var cat:categoriasEspectro);
var
    i:rangoCategorias;
begin
    for i:=1 to categorias do
        cat[i]:=0;
end;

procedure informarVector(cat:categoriasEspectro);
var
    h:rangoCategorias;
begin
    for h:=1 to categorias do
        writeln('La categoria ',h,' fue estudiada por ',cat[h],' sondas.');
    writeln('...........................');
end;

//El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
procedure SondaMasCostosa(sNombre:string; costoCons:real; costoMant:real; var sNombreMax:string; var sCostoTotalMax:real);  //Inicializar max antes de bucle principal
begin
    if((costoCons+costoMant)>sCostoTotalMax) then begin
        sNombreMax:=sNombre;
        sCostoTotalMax:=(costoCons+costoMant);
    end;
end;

//La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
procedure ContarCategoriaSonda(valor:rangoCategorias; var cat:categoriasEspectro);
begin
    cat[valor]:=cat[valor]+1;
end;

procedure ProcesarDatos(lista:listaS; var catSonda:categoriasEspectro; var maxNombre:string; var maxCosto:real; var cantSondaDuracion:integer);
var
    aux:listaS;
    cantSondas:integer;
    sumaDuraciones, sumaCostos, promDuracion, promCosto:real;
begin
    maxCosto:=-1;
    cantSondas:=0;
    sumaDuraciones:=0;
    sumaCostos:=0;
    cantSondaDuracion:=0;
    inicializarVector(catSonda);
    aux:=lista;

    while(lista<>nil) do
    begin
        SondaMasCostosa(lista^.elemento.nombre, lista^.elemento.costoConstruccion, lista^.elemento.costoMantenimiento, maxNombre, maxCosto);
        ContarCategoriaSonda(lista^.elemento.categoria, catSonda);
        cantSondas:=cantSondas+1;
        sumaDuraciones:=sumaDuraciones+lista^.elemento.duracionMision;
        sumaCostos:=sumaCostos + lista^.elemento.costoConstruccion;      
        lista:=lista^.sig;
    end;

    promDuracion:=sumaDuraciones/cantSondas;
    promCosto:=sumaCostos/cantSondas;

    lista:=aux;
    while(lista<>nil) do begin
        if(lista^.elemento.duracionMision>promDuracion) then cantSondaDuracion:= cantSondaDuracion + 1;
        if(lista^.elemento.costoConstruccion>promCosto) then writeln('La sonda ',lista^.elemento.nombre,' supera el costo de construccion promedio');
        lista:=lista^.sig;
    end;
end;

var
    sondas:listaS;
    sondaCategorias:categoriasEspectro;
    nombreSondaCara:string;
    costoSondaCara:real;
    cantDuracionMayor:integer;
begin
    sondas:=nil;

    generarLista(sondas);
    ProcesarDatos(sondas, sondaCategorias, nombreSondaCara, costoSondaCara, cantDuracionMayor);

    writeln('La sonda mas cara es: ', nombreSondaCara);
    informarVector(sondaCategorias);
    writeln('La cantidad de sondas con duracion mayor al promedio es de: ',cantDuracionMayor);
end.