{El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:
1 Analista Funcional 35,20
2 Programador 27,45
3 Administrador de bases de datos 31,03
4 Arquitecto de software 44,28
5 Administrador de redes y seguridad 39,87
Nota: los valores/hora se incluyen a modo de ejemplo
Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.}

//Registro desarrollador con pais, codproyecto, nomproyecto, rol, canthoras
//array de 5 con montos por rol
//array de 1000 para codigo de proyecto con menor monto invertido (guardo montos y luego evaluo con modulo)
//array de 1000 para cantidad de arquitectos. Cada posicion corresponde a cantidad de arquitecto en el codigo de proyecto de dicha posicion

program ej14;
const
    cantRoles=5;
    cantProyectos=1000;
type
    str40=string[40];
    subrangoRoles=1..cantRoles;
    subrangoProyectos=-1..cantProyectos;

    desarrollador=record
        pais:str40;
        pCodigo:subrangoProyectos;
        pNombre:str40;
        rol:subrangoRoles;
        horas:integer;
    end;

    arrayRoles=array[subrangoRoles] of real;
    arrayMontos=array[1..cantProyectos] of real;
    arrayArquitectos=array[1..cantProyectos] of integer;

procedure CargarSueldo(var vRoles:arrayRoles);
begin
    vRoles[1]:=35.2;
    vRoles[2]:=27.45;
    vRoles[3]:=31.03;
    vRoles[4]:=44.28;
    vRoles[5]:=39.87;
end;

procedure InicializarVectores(var vArquitectos:arrayArquitectos; var vMontos:arrayMontos);
var
    j:subrangoProyectos;
begin
    for j:=1 to cantProyectos do
    begin
        vArquitectos[j]:=0;
        vMontos[j]:=0;
    end;
end;

procedure leerDesarrollador(var d:desarrollador);
begin
    writeln('Codigo proyecto: '); readln(d.pCodigo);
    if(d.pCodigo<>-1) then begin
        writeln('Pais: '); readln(d.pais);
        writeln('Nombre proyecto: '); readln(d.pNombre);
        writeln('Rol desarrollador: '); readln(d.rol);
        writeln('Horas trabajadas: '); readln(d.horas);
    end;
    writeln('..................');
end;

procedure DesarrolladorArgentino(dPais:str40; dMonto:real; var montoArg:real);  //montoArg inicializado al principio del prog principal
begin                                                                           //dMonto debe ser el (monto/hora)*cantidadHoras
    if(dPais='Argentina') then montoArg:=montoArg+dMonto;
end;

procedure HorasAdministradores(dRol:subrangoRoles; dHoras:integer; var HorasAdmin:integer); //HorasAdmin inicializado en el prog principal
begin                                                                                       //dhoras debe ser cantidad de horas totales de ese admin
    if(dRol=3) then HorasAdmin:=HorasAdmin+dHoras;
end;

function ProyectoMenorMonto(montos:arrayMontos; dimL:integer):integer;    //la variable que pase como parametro debe tener ya cargados los montos de todos los proyectos
var
    i, pos:subrangoProyectos;
begin
    pos:=1;
    for i:=2 to dimL do
    begin
        if((montos[i]<montos[pos]) and (montos[i]<>0)) then pos:=i;
    end;

    ProyectoMenorMonto:=pos;
end;

procedure InformarArquitectos(vArqui:arrayArquitectos; dLogica:integer); //la variable que pase como parametro será cargada en el prog principal
var
    h:subrangoProyectos;
begin
    writeln('Arquitectos por proyecto: ');
    for h:=1 to dLogica do
        writeln('- ',h,': ',vArqui[h]);
end;

var
    sueldoRoles:arrayRoles;
    montoProyectos:arrayMontos; 
    cantArquitectos:arrayArquitectos;
    dev:desarrollador;
    montoDev, montoDevArg:real;
    totalHorasAdmin, dimLogica:integer;
begin
    montoDevArg:=0;
    totalHorasAdmin:=0;
    dimLogica:=0;
    InicializarVectores(cantArquitectos,montoProyectos);
    CargarSueldo(sueldoRoles);

    leerDesarrollador(dev);

    while(dev.pCodigo<>-1) do   //No es necesaria condicion de corte en codigo<1000 porque hay un subrango definido
    begin
        montoDev:=dev.horas*sueldoRoles[dev.rol];   //El monto del desarrollador es la cantidad de horas * el sueldo correspondiente a su rol
        montoProyectos[dev.pCodigo]:=montoProyectos[dev.pCodigo] + montoDev;
        if (dev.rol=4) then cantArquitectos[dev.pCodigo]:=cantArquitectos[dev.pCodigo]+1;   //Si es arquitecto, sumo 1 a la posicion del proyecto
        DesarrolladorArgentino(dev.pais, montoDev, montoDevArg);
        HorasAdministradores(dev.rol, dev.horas, totalHorasAdmin);

        dimLogica:=dimLogica+1;
        leerDesarrollador(dev);
    end;

    writeln('El monto invertido en desarrolladores con residencia en Argentina es de: $',montoDevArg:1:2);
    writeln('La cantidad de horas trabajadas por Administradores de Bases de Datos es de: ',totalHorasAdmin);
    writeln('El codigo del proyecto con menor monto invertido es: ',ProyectoMenorMonto(montoProyectos, dimLogica));
    InformarArquitectos(cantArquitectos,dimLogica);

end.