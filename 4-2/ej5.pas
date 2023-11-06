{La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.
Una vez almacenados los datos, procesar dicha estructura para obtener:
a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos
b. Cantidad de clientes para cada categoría de monotributo
c. Código de las 10 ciudades con mayor cantidad de clientes
d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

//Vector 500 posiciones
//Registro clientes con fecha(registro de mes y año), categoria monotributo (A a F), codigo ciudad (1 a 2400) y monto mensual.
//Para contar contrato por mes se puede utilizar un array de 12 posiciones. Para informar cantidad por año un corte de control. Al cambiar de año
//indica cantidad por cada mes y en el año. El valor de contrato por año lo almaceno para un máximo.
//Vector [A..F] para almacenar cantidad de cliente en cada categoría
//Array 2400 posiciones para contar cantidad de clientes en cada ciudad por codigo. Luego debo recorrer y guardar 10 máximos (vector[10]). Excluir
//valores 0 para evaluar máximos
//Primero debo calcular el monto promedio de todos los clientes, siendo la suma de todos los montos dividido la cantidad de clientes. Luego debo
//recorrer el vector de clientes incrementando un contador por cada cliente que supere dicho promedio.

program ej5;
const
    cantClientes=500;
    cantCiudades=2400;
    meses=12;
    maximos=10;
type
    rangoCantClientes=-1..cantClientes;
    rangoCantCiudades=0..cantCiudades;
    rangoMeses=0..meses;
    rangoCategoria='A'..'F';
    rangoMaximos=0..maximos;

    periodo=record
        mes:rangoMeses;
        anio:integer;
    end;

    cliente=record
        fecha:periodo;
        categoria:rangoCategoria;
        codigoCiudad:rangoCantCiudades;
        monto:real;
    end;

    //Registro para almacenar codigo de ciudad con mas clientes
    infoCiudad=record
        codigo:rangoCantCiudades;
        monotributistas:rangoCantClientes;
    end;

    //Registro para almaceanr anio con mayor cantidad de contratos
    infoAnio=record
        anioContrato:integer;
        cantidadContrato:rangoCantClientes;
    end;

    vectorClientes=array[rangoCantClientes] of cliente; //Almacena informacion de clientes
    vectorClientesPorMes=array[rangoMeses] of rangoCantClientes;    //Almacena cantidad de clientes por mes
    vectorCategoriaClientes=array[rangoCategoria] of rangoCantClientes; //Almacena cantidad de clientes por categoría
    vectorCantClientePorCiudad=array[rangoCantCiudades] of rangoCantCiudades;   //Almacena cantidad de clientes por ciudad
    vectorCiudadMaximoCliente=array[rangoMaximos] of infoCiudad;   //Vector para guardar 10 maximos (de ciudades con más clientes)

procedure leerCliente(var c:cliente);
begin
    writeln('Ingrese año: '); readln(c.fecha.anio);
    writeln('Ingrese mes: '); readln(c.fecha.mes);
    writeln('Ingrese categoria: '); readln(c.categoria);
    writeln('Ingrese codigo de la ciudad: '); readln(c.codigoCiudad);
    writeln('Ingrese monto mensual: '); readln(c.monto);
    writeln('..................');
end;

procedure leerVectorClientes(var v:vectorClientes);
var
    i:rangoCantClientes;
begin
    for i:=1 to cantClientes do
        leerCliente(v[i]);
end;

procedure InicializarVectorClientesPorMes(var clMes:vectorClientesPorMes);
var
    p:rangoMeses;
begin
    for p:=1 to meses do
        clMes[p]:=0;
end;

procedure InicializarVectorCategoriaClientes(var clCategoria:vectorCategoriaClientes);
var
    m:rangoCategoria;
begin
    for m:='A' to 'F' do
        clCategoria[m]:=0;
end;

procedure InicializarVectorClientesPorCiudad(var clCiudad:vectorCantClientePorCiudad);
var
    n:rangoCantCiudades;
begin
    for n:=1 to cantCiudades do
        clCiudad[n]:=0;
end;

procedure InformarVectorClientesPorMes(cliMes:vectorClientesPorMes);
var
    u:rangoMeses;
begin
    for u:=1 to meses do begin
        if(cliMes[u]<>0) then writeln('- El mes ',u,' hubo ',cliMes[u],' contratos.');
    end;
end;

procedure InformarClientePorCategoria(cliCategoria:vectorCategoriaClientes);
var
    q:rangoCategoria;
begin
    for q:='A' to 'F' do
        writeln('La categoria ', q,' posee ',cliCategoria[q],' clientes.');
    writeln(' ');
end;

procedure InformarCodigoCiudadesMaximas(ciuCodigo:vectorCiudadMaximoCliente);
var
    b:rangoMaximos;
begin
    for b:=1 to maximos do
        writeln('La ',b, ' ciudad con mas clientes tiene el codigo: ', ciuCodigo[b].codigo);
    writeln(' ');
end;

procedure ContratoPorFecha(vecClientes:vectorClientes);
var
    anioActual:integer;
    cantClienteMes:vectorClientesPorMes;
    maxContratoAnio:infoAnio;
    cantClienteAnio:rangoCantClientes;
    continuar:boolean;
    pos:integer;
begin
    maxContratoAnio.cantidadContrato:=-1;
    pos:=1;
    continuar:=false;
    
    while(not continuar) do
    begin
        InicializarVectorClientesPorMes(cantClienteMes);
        cantClienteAnio:=0;
        anioActual:=vecClientes[pos].fecha.anio;    //Guardo el año del registro de la correspondiente posicion en año actual para iterar con él
        
        while((not continuar) and (anioActual=vecClientes[pos].fecha.anio)) do
        begin
            cantClienteMes[vecClientes[pos].fecha.mes]:= cantClienteMes[vecClientes[pos].fecha.mes] + 1;    //Sumo uno en la posición del mes del cliente
            cantClienteAnio:=cantClienteAnio+1;
            pos:=pos+1;
            if(pos>cantClientes) then continuar:=true;  //Salgo del bucle con un boolean para evitar evaluar condiciones con pos>dimension fisica
        end;
        
        if(cantClienteAnio>maxContratoAnio.cantidadContrato) then
        begin
            maxContratoAnio.cantidadContrato:=cantClienteAnio;
            maxContratoAnio.anioContrato:=anioActual;
        end;
        writeln('Anio actual: ',anioActual);
        InformarVectorClientesPorMes(cantClienteMes);
        writeln('La cantidad de contratos en el año ',anioActual,' fue de: ',cantClienteAnio);
        writeln(' ');
    end;

    writeln(' ');
    writeln('El año ',maxContratoAnio.anioContrato, ' se firmaron un total de ',maxContratoAnio.cantidadContrato, ' contratos, siendo el maximo.');
end;

procedure CantidadClientePorCategoria(vClientes:vectorClientes; var cantClienteCateg:vectorCategoriaClientes);
var
    j:rangoCantClientes;
begin
    InicializarVectorCategoriaClientes(cantClienteCateg);
    for j:=1 to cantClientes do
        cantClienteCateg[vClientes[j].categoria]:= cantClienteCateg[vClientes[j].categoria] + 1;
end;

procedure CiudadesMayorCantClientes(veClientes:vectorClientes; var vMaxClientePorCiudad:vectorCiudadMaximoCliente);
var
    pos:rangoCantClientes;
    posCiudad:rangoCantCiudades;
    posMaximos, posCorrimiento:integer;
    posCiudadCondicion:boolean;
    vClientePorCiudad:vectorCantClientePorCiudad;
begin
    InicializarVectorClientesPorCiudad(vClientePorCiudad);
    for pos:=1 to cantClientes do
        vClientePorCiudad[veClientes[pos].codigoCiudad]:= vClientePorCiudad[veClientes[pos].codigoCiudad] + 1;
    
    //Inicializo los 10 maximos del vector
    for posMaximos:=1 to maximos do
        vMaxClientePorCiudad[posMaximos].monotributistas:=-1;
    vMaxClientePorCiudad[1].codigo:=0;  //Inicializo el codigo del primero

    for posCiudad:=1 to cantCiudades do
    begin
        posMaximos:=1;
        posCiudadCondicion:=true;
        if(vClientePorCiudad[posCiudad]<>0) then    //Evita evaluar ciudades sin clientes
        begin
            {Me permite comparar máximos. Si guardo un maximo, se pone en false y sale del bucle. 
            Si ingresa un valor igual al máximo, evito perder ese valor. Se terminará guardando en otra posicion o saliendo por exceder "maximos"}
            while((posMaximos<=maximos) and (posCiudadCondicion)) do
            begin
                if(vClientePorCiudad[posCiudad]>vMaxClientePorCiudad[posMaximos].monotributistas) then
                begin
                    if(posMaximos<maximos) then //En caso de evaluar maximo en ultima posicion, evito intentar guardar algo en la siguiente
                        for posCorrimiento:=(maximos-1) downto posMaximos do    //En caso de encontrar un maximo, corro todas las posiciones para evitar sobreescribir un valor
                            vMaxClientePorCiudad[posCorrimiento+1]:= vMaxClientePorCiudad[posCorrimiento];
                    vMaxClientePorCiudad[posMaximos].codigo:=posCiudad;
                    vMaxClientePorCiudad[posMaximos].monotributistas:= vClientePorCiudad[posCiudad];
                    posCiudadCondicion:=false;
                end
                else posMaximos:=posMaximos+1;
            end;
        end;
    end;
end;

function ClientesMontoMensualMayor(vectClientes:vectorClientes):integer;
var
    contador, k:rangoCantClientes;
    sumaMonto, promedioMonto:real;
begin
    contador:=0;
    sumaMonto:=0;
    for k:=1 to cantClientes do
        sumaMonto:=sumaMonto+vectClientes[k].monto;
    
    promedioMonto:=sumaMonto/cantClientes;

    for k:=1 to cantClientes do begin
        if(vectClientes[k].monto>promedioMonto) then contador:=contador+1;
    end;

    ClientesMontoMensualMayor:=contador;
end;

var
    clientes:vectorClientes;
    maximasCiudadesClientes:vectorCiudadMaximoCliente;
    cantidadClienteCategoria:vectorCategoriaClientes;
begin
    leerVectorClientes(clientes);

    ContratoPorFecha(clientes);
    
    CantidadClientePorCategoria(clientes, cantidadClienteCategoria);
    InformarClientePorCategoria(cantidadClienteCategoria);

    CiudadesMayorCantClientes(clientes, maximasCiudadesClientes);
    InformarCodigoCiudadesMaximas(maximasCiudadesClientes);

    writeln('La cantidad de clientes con monto mensual mayor al promedio de clientes es de: ', ClientesMontoMensualMayor(clientes));

end.