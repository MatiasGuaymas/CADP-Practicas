{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.
A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}

// Se dispone de la lista con información de sondas cargada.

//a) módulo que recibe elemento de la lista, verifica si costo mantenimiento<=costo construcción y categoria<>1 y devuelve true o false
//b) módulo que debe recorrer la lista de sondas completa (while l<>nil). Por cada elemento, debe verificar si cumple o no condicion con modulo a)
//A partir de la verificación, se añadirá a una lista o a otra.
//c) módulo que recibe la lista completa, utiliza el módulo de b) y, con la lista generada de proyectos no financiados, informa cantidad de 
//proyectos y costo total de los proyectos.

program ej7;
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


procedure leerLista(var l:listaS; s:sonda);
var
    nuevo:listaS;
begin
    new(nuevo);
    nuevo^.elemento:=s;
    nuevo^.sig:=l;
    l:=nuevo;
end;

function CumpleCriterio(s:sonda):boolean;
begin
    CumpleCriterio:=((s.costoMantenimiento<=s.costoConstruccion) and (s.categoria<>1));
end;

procedure AprobacionProyectos(var listAprob:listaS; var listDesaprob:listaS; listaSondas:listaS);   //listaSondas:=nil en prog princ
begin
    listAprob:=nil;
    listDesaprob:=nil;

    while(listaSondas<>nil) do
    begin
        if(CumpleCriterio(listaSondas^.elemento)) then leerLista(listAprob, listaSondas^.elemento)
        else leerLista(listDesaprob, listaSondas^.elemento);
        listaSondas:=listaSondas^.sig;
    end;
end;

procedure InformacionProyectosNoFinanciados(var liAprobado:listaS; var liDesaprobado:listaS; liSondas:listaS);
var
    cantProyDesaprobados:integer;
    costoTotal:real;
    aux:listaS;
begin
    cantProyDesaprobados:=0;
    costoTotal:=0;

    AprobacionProyectos(liAprobado, liDesaprobado, liSondas);
    aux:=liDesaprobado;
    while(aux<>nil) do
    begin
        cantProyDesaprobados:=cantProyDesaprobados+1;
        costoTotal:=costoTotal + (aux^.elemento.costoConstruccion + aux^.elemento.costoMantenimiento);
        aux:=aux^.sig;
    end;

    writeln('La cantidad de proyectos no aprobados es de: ', cantProyDesaprobados);
    writeln('El costo total de todos los proyectos no aprobados es de: ',costoTotal:1:2);
end;

var
    sondas, listaAprobados, listaDesaprobados:listaS;
begin
    sondas:=nil;
    generarLista(sondas);   //Se dispone lista cargada
    InformacionProyectosNoFinanciados(listaAprobados, listaDesaprobados, sondas);
end.  