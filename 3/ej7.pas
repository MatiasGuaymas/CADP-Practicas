{Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse. Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

//Contador de centros hasta cambiar de universidad
//Un maximo para la suma de investigadores de centros por universidad
//Dos minimos para centros (becarios)

program ej7;
type
    centro=record
        nombre:string;
        universidad:string;
        cantInvestigador:integer;
        cantBecario:integer;
    end;

    uniMax=record
        uNombre:string;
        uInvestigadores:integer;
    end;

    cenMin=record
        cNombre:string;
        cBecarios:integer;
    end;

procedure leer (var c:centro);
begin
    writeln('Ingrese la universidad: '); readln(c.universidad);
    writeln('Ingrese el nombre del centro: '); readln(c.nombre);
    writeln('Ingrese la cantidad de investigadores: '); readln(c.cantInvestigador);
    if(c.cantInvestigador<>0) then begin
        writeln('Ingrese la cantidad de becarios: '); readln(c.cantBecario);
    end;
    writeln('.......................');
end;

procedure MayorInvestigadores(uniNombre:string; totalInvestigadores:integer; var uniMayor:uniMax); //Mayor cant investigadores de total universidad
begin
    if(totalInvestigadores>uniMayor.uInvestigadores) then
    begin
        uniMayor.uNombre:=uniNombre;
        uniMayor.uInvestigadores:=totalInvestigadores;
    end;
end;

procedure MenorBecarios(cenNombre:string; cenBecarios:integer; var becMin1:cenMin; var becMin2:cenMin); //Menor cant becarios de centro individualmente
begin
    if(cenBecarios<becMin1.cBecarios) then
    begin
        becMin2:=becMin1;
        becMin1.cNombre:=cenNombre;
        becMin1.cBecarios:=cenBecarios;
    end

    else if(cenBecarios<becMin2.cBecarios) then
    begin
        becMin2.cNombre:=cenNombre;
        becMin2.cBecarios:=cenBecarios;
    end;
end;

var
    centroInvestigacion:centro;
    cantCentros, totalInvest:integer;
    uniMaxInvestigadores:uniMax;
    cenMinBecarios1, cenMinBecarios2: cenMin;
    uniActual:string;
begin
    uniMaxInvestigadores.uInvestigadores:=-1;
    cenMinBecarios1.cBecarios:=9999;
    cenMinBecarios1.cNombre:='';

    leer(centroInvestigacion);

    while(centroInvestigacion.cantInvestigador<>0) do
    begin
        cantCentros:=0; //Quiero que se reinicie por cada cambio de universidad
        totalInvest:=0;
        uniActual:=centroInvestigacion.universidad;
        

        while((centroInvestigacion.cantInvestigador<>0) and (centroInvestigacion.universidad=uniActual)) do
        begin
            cantCentros:=cantCentros+1;
            totalInvest:=totalInvest+centroInvestigacion.cantInvestigador;
            MenorBecarios(centroInvestigacion.nombre, centroInvestigacion.cantBecario, cenMinBecarios1, cenMinBecarios2);
            leer(centroInvestigacion);
        end;

        MayorInvestigadores(uniActual, totalInvest, uniMaxInvestigadores);

        writeln('La cantidad total de centros para la', uniActual, ' es de: ',cantCentros);
        writeln('.......................');
    end;

    writeln('La ', uniMaxInvestigadores.uNombre, ' cuenta con la mayor cantidad de investigadores: ',uniMaxInvestigadores.uInvestigadores);
    writeln('Los dos centros con menor cantidad de becarios son ',cenMinBecarios1.cNombre,' y ',cenMinBecarios2.cNombre);

end.