{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre
1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar
más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.
Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

//registro viaje con codigo alumno (1-1300), dia del mes, facultad, medio de transporte(1-5). Se tienen muchos viajes de cada alumno.
//Vector alumnos df 1300 con lista de viajes en cada posicion (ya que conozco cantidad de alumnos pero no de viajes).
//Cargo cada posicion del vector con una lista de viajes de alumnos. Con un bucle for recorro cada alumno (posicion del vector)
//voy a guardar cada nodo(viaje) de cada lista. La lectura de los viajes de un alumno finaliza con el codigo -1

//a) Debo recorrer la lista de cada posicion del arreglo(alumno) y contar la cantidad de nodos(viajes).
//b) Array df 5 con los precios de cada viaje. Recorro la lista de cada alumno. Esta estará ordenada por dia. Sumo el valor del boleto a una
//variable y evalúo con corte de control. Una vez que cambié de dia, me fijo si gastó más de $80. Si es asi, sumo un contador
//c) Vector df 5 que acumula cantidad de usuarios de cada medio de transporte. Recorro cada lista de cada alumno acumulando +1 a cada posicion
//segun el medio de transporte. Al final, recorro este arreglo df 5 para sacar dos maximos
//d) Se recorre lista ordenada por dia. Verifico si alumno va en bicicleta y paso a true un booleano. Tambien me fijo si usa otro medio de transporte
//con otro booleano. Si ambos son true, entonces sumo 1 a un contador.

program ej14;
const
    cantEstudiantes=2;
    cantMediosTransporte=5;
    condicionPrecio=80;
type
    rangoCantEstudiantes=-1..cantEstudiantes;
    rangoCantMediosTransporte=0..cantMediosTransporte;
    rangoDiasMarzo=1..31;

    viaje=record
        codigo:rangoCantEstudiantes;
        dia:rangoDiasMarzo;
        facultad:string;
        transporte:rangoCantMediosTransporte;
    end;

    listaV=^nodoV;
    nodoV=record
        elemento:viaje;
        sig:listaV;
    end;

    maxTransporte=record
        transporte:rangoCantMediosTransporte;
        cantidad:integer;
    end;

    vectorAlumnos=array[1..cantEstudiantes] of listaV;
    vPreciosBoleto=array[1..cantMediosTransporte] of real;
    vCantEstudiantesTransporte=array[1..cantMediosTransporte] of integer;

procedure leerRegistro(var v:viaje);
begin
    writeln('Codigo: '); readln(v.codigo);
    if(v.codigo<>-1) then begin
        writeln('Dia: '); readln(v.dia);
        writeln('Facultad: '); readln(v.facultad);
        writeln('Medio de transporte: '); readln(v.transporte);
    end;
    writeln('.....................');
end;

procedure armarNodo(var l:listaV; v:viaje); //l:=nil en modulo generarLista
var
    nuevo, actual, anterior:listaV;
begin
    new(nuevo);
    nuevo^.elemento:=v;
    nuevo^.sig:=nil;
    
    if(l=nil) then l:=nuevo
    else begin
        actual:=l;
        while((actual<>nil) and (actual^.elemento.dia<nuevo^.elemento.dia)) do begin
            anterior:=actual;
            actual:=actual^.sig;
        end;
        if(actual=l) then begin
            nuevo^.sig:=l;
            l:=nuevo;
        end
        else begin
            anterior^.sig:=nuevo;
            nuevo^.sig:=actual;
        end;
    end;
end;

procedure generarLista(var l:listaV);
var
    v:viaje;
begin
    l:=nil;
    leerRegistro(v);
    while(v.codigo<>-1) do begin
        armarNodo(l,v);
        leerRegistro(v);
    end;
end;

procedure cargarVectorPrecios(var vp:vPreciosBoleto);
begin
    vp[1]:=50;
    vp[2]:=63.25;
    vp[3]:=23.5;
    vp[4]:=37;
    vp[5]:=0;
end;

procedure cargarVectorAlumnos(var vecAlum:vectorAlumnos);
var
    lista:listaV;
    t:rangoCantEstudiantes;
begin
    for t:=1 to cantEstudiantes do
    begin
        writeln('Alumno ',t,':');
        generarLista(lista);
        vecAlum[t]:=lista;
    end;
    writeln('------------------');
end;

procedure inicializarVectorTransportesUsados(var vt:vCantEstudiantesTransporte);
var
    k:rangoCantMediosTransporte;
begin
    for k:=1 to cantMediosTransporte do
        vt[k]:=0;
end;

procedure maximosTransportesUtilizados(vt:vCantEstudiantesTransporte; var maxTransp1:maxTransporte; var maxTransp2:maxTransporte);
var
    m:rangoCantMediosTransporte;
begin
    for m:=1 to cantMediosTransporte do
    begin
        if(vt[m]>maxTransp1.cantidad) then begin
            maxTransp2:=maxTransp1;
            maxTransp1.transporte:=m;
            maxTransp1.cantidad:=vt[m];
        end
        else if(vt[m]>maxTransp2.cantidad) then begin
            maxTransp2.transporte:=m;
            maxTransp2.cantidad:=vt[m];
        end;
    end;
end;

procedure determinarTransporte(regMaxTransp:maxTransporte; var transp:string);
begin
    case regMaxTransp.transporte of
    1:  transp:='colectivo urbano';
    2:  transp:='colectivo interurbano';
    3:  transp:='tren universitario';
    4:  transp:='tren Roca';
    5:  transp:='bicicleta';
    end;
end;

procedure procesarDatos(estViajes:vectorAlumnos; var cantAluViajesDia:integer; var cantAluGastoMayor:integer; var maxTransporte1:maxTransporte; var maxTransporte2:maxTransporte; var cantViajeCombinado:integer);
var
    diaActual:rangoDiasMarzo;
    pos:rangoCantEstudiantes;
    cantViajesDia:integer;
    sumaGasto:real;
    precios:vPreciosBoleto;
    viajeBici, viajeOtroTransp, viajeCombinado, verificacionViajesDia, verificacionGastoDia:boolean;
    cantViajesPorTransporte:vCantEstudiantesTransporte;
begin
    maxTransporte1.cantidad:=-1;
    maxTransporte1.transporte:=0;
    cantAluViajesDia:=0;
    cantAluGastoMayor:=0;
    cantViajeCombinado:=0;
    inicializarVectorTransportesUsados(cantViajesPorTransporte);
    cargarVectorPrecios(precios);

    for pos:=1 to cantEstudiantes do
    begin
        verificacionViajesDia:=false;
        verificacionGastoDia:=false;
        viajeCombinado:=false;
        while(estViajes[pos]<>nil) do
        begin
            diaActual:=estViajes[pos]^.elemento.dia;
            cantViajesDia:=0;
            sumaGasto:=0;
            viajeBici:=false;
            viajeOtroTransp:=false;
            while((estViajes[pos]<>nil) and (estViajes[pos]^.elemento.dia=diaActual)) do
            begin
                if(not verificacionViajesDia) then cantViajesDia:=cantViajesDia+1;
                if(not verificacionGastoDia) then sumaGasto:=sumaGasto + precios[estViajes[pos]^.elemento.transporte];
                cantViajesPorTransporte[estViajes[pos]^.elemento.transporte]:=cantViajesPorTransporte[estViajes[pos]^.elemento.transporte] + 1;
                if((estViajes[pos]^.elemento.transporte=5) and (not viajeBici)) then viajeBici:=true;
                if((estViajes[pos]^.elemento.transporte<>5) and (not viajeOtroTransp)) then viajeOtroTransp:=true;
                estViajes[pos]:=estViajes[pos]^.sig;
            end;
            if((cantViajesDia>6) and (not verificacionViajesDia)) then begin
                cantAluViajesDia:=cantAluViajesDia+1;
                verificacionViajesDia:=true;
            end;
            if((sumaGasto>condicionPrecio) and (not verificacionGastoDia)) then begin 
                cantAluGastoMayor:=cantAluGastoMayor+1;
                verificacionGastoDia:=true;
            end;
            if(((viajeBici) and (viajeOtroTransp)) and (not viajeCombinado)) then begin 
                cantViajeCombinado:=cantViajeCombinado+1;
                viajeCombinado:=true;
            end;
        end;
    end;
    maximosTransportesUtilizados(cantViajesPorTransporte, maxTransporte1, maxTransporte2);
end;

var
    estudiantes:vectorAlumnos;
    cantidadAlumnosViajePorDia, cantidadAlumnosGastoMayor, cantidadAlumnosViajeCombinado:integer;
    registroMaxTransporte1, registroMaxTransporte2:maxTransporte;
    transporteMasUsado1,transporteMasUsado2:string;
begin
    cargarVectorAlumnos(estudiantes);
    procesarDatos(estudiantes, cantidadAlumnosViajePorDia, cantidadAlumnosGastoMayor, registroMaxTransporte1, registroMaxTransporte2, cantidadAlumnosViajeCombinado);
    determinarTransporte(registroMaxTransporte1, transporteMasUsado1);
    determinarTransporte(registroMaxTransporte2, transporteMasUsado2);

    writeln('La cantidad de alumnos que realizan mas de 6 viajes al dia es de: ',cantidadAlumnosViajePorDia);
    writeln('La cantidad de alumnos con un gasto mayor a $80 en el dia es de: ',cantidadAlumnosGastoMayor);
    writeln('La cantidad de alumnos que realizan un viaje combinado con bicicleta es de: ',cantidadAlumnosViajeCombinado);
    writeln('Los dos transportes mas utilizados son: ',transporteMasUsado1,' y ',transporteMasUsado2,'.');
end.