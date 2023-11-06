{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden
ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

//Registro de tipo usuario con email, rol(1-4), revista que participa y cantidad de dias desde ultimo acceso.
//Array de df 3600 con datos tipo usuario. Esta información ya se dispone.

//a) debo crear una lista que inserte ordenado los usuarios de la revista económica, de forma ascendente según cantidad de dias desde ultimo acceso
//Luego imprimo nombre y cantidad de dias de esa lista, que ya estará ordenada
//b) Contador de rol usuario será un array df 4. Verifico el rol de cada usuario en el arreglo principal y lo cuento en el contador de roles por indice
//c) Calcular dos maximos (por tiempo desde acceso) e informar mail de usuario

program ej13;
const
    roles=4;
    cantUsuarios=3600;
type
    rangoRoles=0..roles;
    
    usuario=record
        nombre:string;
        email:string;
        rol:rangoRoles;
        revista:string;
        ultimoAcceso:integer;
    end;

    maximoUsuario=record
        email:string;
        ultimoAcceso:integer;
    end;

    listaU=^nodoU;
    nodoU=record
        elemento:usuario;
        sig:listaU;
    end;

    vectorUsuarios=array[1..cantUsuarios] of usuario;
    contadorRoles=array[1..roles] of integer;

procedure leerRegistro(var u:usuario);
begin
    writeln('Nombre: '); readln(u.nombre);
    writeln('Email: '); readln(u.email);
    writeln('Rol: '); readln(u.rol);
    writeln('Revista: '); readln(u.revista);
    writeln('Dias desde ultimo acceso: '); readln(u.ultimoAcceso);
    writeln('........................');
end;

procedure insertarOrdenado(var pri:listaU; u:usuario);
var
    nuevo, actual, anterior:listaU;
begin
    new(nuevo);
    nuevo^.elemento:=u;
    nuevo^.sig:=nil;

    if(pri=nil) then begin
        pri:=nuevo;
    end
    else
    begin
        actual:=pri;
        while((actual<>nil) and (actual^.elemento.ultimoAcceso<nuevo^.elemento.ultimoAcceso)) do begin
            anterior:=actual;
            actual:=actual^.sig;
        end;
        if(actual=pri) then begin
            nuevo^.sig:=pri;
            pri:=nuevo;
        end
        else begin
            anterior^.sig:=nuevo;
            nuevo^.sig:=actual;
        end;
    end;
end;

procedure cargarVector(var v:vectorUsuarios);
var
    i:integer;
begin
    writeln('Datos de usuarios:');
    for i:=1 to cantUsuarios do
        leerRegistro(v[i]);
end;

procedure inicializarRoles(var vr:contadorRoles);
var
    h:integer;
begin
    for h:=1 to roles do
        vr[h]:=0;
end;

procedure informarRoles(vr:contadorRoles);
var
    k:integer;
begin
    for k:=1 to roles do
        writeln('El rol ',k,' posee ',vr[k],' usuarios.');
    writeln('-------------');
end;

procedure informarLista(l:listaU);
begin
    while(l<>nil) do begin
        writeln('Nombre usuario: ',l^.elemento.nombre);
        writeln('Dias desde ingreso: ',l^.elemento.ultimoAcceso);
        l:=l^.sig;
        writeln('....');
    end;
end;

procedure maximosDiasDesdeIngreso(var maxUsuario1:maximoUsuario; var maxUsuario2:maximoUsuario; usu:usuario);   //inicializar max1 antes del bucle
begin
    if(usu.ultimoAcceso>maxUsuario1.ultimoAcceso) then begin
        maxUsuario2:=maxUsuario1;
        maxUsuario1.email:=usu.email;
        maxUsuario1.ultimoAcceso:=usu.ultimoAcceso;
    end
    else if(usu.ultimoAcceso>maxUsuario2.ultimoAcceso) then begin
        maxUsuario2.email:=usu.email;
        maxUsuario2.ultimoAcceso:=usu.ultimoAcceso;
    end;
end;

procedure procesarDatos(vecUsuarios:vectorUsuarios; var lisUsuario:listaU; var maxUsu1:maximoUsuario; var maxUsu2:maximoUsuario; var contRoles:contadorRoles);
var
    pos:integer;
begin
    maxUsu1.ultimoAcceso:=-1;
    maxUsu1.email:='';
    inicializarRoles(contRoles);
    
    for pos:=1 to cantUsuarios do
    begin
        if(vecUsuarios[pos].revista='Economica') then
            insertarOrdenado(lisUsuario, vecUsuarios[pos]);
        contRoles[vecUsuarios[pos].rol]:=contRoles[vecUsuarios[pos].rol] + 1;
        maximosDiasDesdeIngreso(maxUsu1, maxUsu2, vecUsuarios[pos]);
    end;
end;

var
    arrayUsuarios:vectorUsuarios;
    listaUsuarios:listaU;
    maximoUsuarioConexion1, maximoUsuarioConexion2:maximoUsuario;
    vectorRoles:contadorRoles;
begin
    listaUsuarios:=nil;
    cargarVector(arrayUsuarios);
    procesarDatos(arrayUsuarios, listaUsuarios, maximoUsuarioConexion1, maximoUsuarioConexion2, vectorRoles);

    informarLista(listaUsuarios);
    informarRoles(vectorRoles);
    writeln('Usuarios que hace mas tiempo no ingresan: ');
    writeln('Email: ',maximoUsuarioConexion1.email,', Dias: ',maximoUsuarioConexion1.ultimoAcceso);
    writeln('Email: ',maximoUsuarioConexion2.email,', Dias: ',maximoUsuarioConexion2.ultimoAcceso);
end.