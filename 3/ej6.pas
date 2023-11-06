{Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}

program ej6;
type
    microproce=record
        marca:string;
        linea:string;
        nucleos:integer;
        reloj:real;
        transistor:integer;
    end;

    microproceMax=record
        marcaMax:string;
        cantidadProce:integer;
    end;

procedure leer(var m:microproce);
begin
    writeln('Ingrese marca: '); readln(m.marca);
    writeln('Ingrese linea: '); readln(m.linea);
    writeln('Ingrese cantidad de nucleos: '); readln(m.nucleos);
    if(m.nucleos<>0) then
    begin
        writeln('Ingrese velocidad del reloj: '); readln(m.reloj);
        writeln('Ingrese nm de transistores: '); readln(m.transistor)
    end;
    writeln('..........................');
end;

function CondicionNucleoTransistor(core,tamTransistor:integer):boolean;
begin
    CondicionNucleoTransistor:=((core>2) and (tamTransistor<=22));
end;

procedure Condicion14nm(cantNueva:integer; marcaNueva:string; var proce1:microproceMax; var proce2:microproceMax); //Comparar cantidad actual con la almacenada, si es mayor guardar en registro max
begin
    if(cantNueva>proce1.cantidadProce) then
    begin
        proce2:=proce1;
        proce1.marcaMax:=marcaNueva;
        proce1.cantidadProce:=cantNueva;
    end
    else if (cantNueva>proce2.cantidadProce) then
    begin
        proce2.marcaMax:=marcaNueva;
        proce2.cantidadProce:=cantNueva;
    end;
end;

function CondicionMulticore (cNucleos:integer; cMarca:string; cReloj:real): boolean;
begin
    CondicionMulticore:=(((cNucleos>1) and (cReloj>=2)) and ((cMarca='Intel') or (cMarca='AMD')));
end;

var
    microprocesador:microproce;
    mProceMax1, mProceMax2: microproceMax;
    cant14nm,cantMulticore:integer;
    marcaActual:string;

begin
    mProceMax1.cantidadProce:=-1;
    mProceMax1.marcaMax:='';
    cantMulticore:=0;   //Quiero cantidad total (AMD o Intel) al finalizar programa

    leer(microprocesador);

    while(microprocesador.nucleos<>0) do
    begin
        cant14nm:=0;    //Quiero que se reinicie con cada cambio de marca
        marcaActual:=microprocesador.marca;

        while((microprocesador.nucleos<>0) and (microprocesador.marca=marcaActual)) do
        begin
            if(CondicionNucleoTransistor(microprocesador.nucleos, microprocesador.transistor)) then begin
                writeln('El procesador ', microprocesador.marca, ' ', microprocesador.linea, ' posee 2 cores y al menos 22nm.');
                writeln('..........................');
            end;

            if(microprocesador.transistor=14) then
                cant14nm:=cant14nm+1;
            
            if(CondicionMulticore(microprocesador.nucleos, microprocesador.marca, microprocesador.reloj)) then
                cantMulticore:=cantMulticore+1;
            
            leer(microprocesador);
        end;
        
        Condicion14nm(cant14nm, marcaActual, mProceMax1, mProceMax2);
    end;

    writeln('Las marcas ', mProceMax1.marcaMax,' y ', mProceMax2.marcaMax,' poseen la mayor cantidad de procesadores con 14nm.');
    writeln('La cantidad de procesadores Intel o AMD con procesadores multicore de al menos 2Ghz es de: ',cantMulticore);

end.