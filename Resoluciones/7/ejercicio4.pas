{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo}

//La lista se dispone
//Registro embarazada con nombre, apellido, vector peso (df 42) y semanas (dl del vector). Lista de elemento tipo embarzada.

//a) Debe evaluar el maximo de los dl elementos del vector peso de cada embarazada
//b) Calcular aumento de peso(peso[dl]-peso[1])
//Ambos incisos implican recorrer la lista embarazadas, luego recorrer el vector peso y despues informar lo que pida, para ir con el siguiente nodo

program ejercicio4;
const
    limiteSemanas=42;
type
    vectorPesos=array[1..limiteSemanas] of real;
    embarazada=record
        nombre:string;
        apellido:string;
        peso:vectorPesos;
        semanas:integer;
    end;

    listaE=^nodoE;
    nodoE=record
        elemento:embarazada;
        sig:listaE;
    end;

procedure cargarVectorPesos(var vp:vectorPesos; var dl:integer);
var
    peso:real;
begin
    dl:=0;
    writeln('Peso: ');
    readln(peso);
    while((dl<limiteSemanas) and (peso<>0)) do begin
        dl:=dl+1;
        vp[dl]:=peso;
        if(dl<limiteSemanas) then readln(peso);
    end;
end;

procedure leerRegistro(var e:embarazada);
begin
    writeln('INGRESO VALORES: ');
    writeln('Nombre: '); readln(e.nombre);
    if(e.nombre<>'xxx') then begin
        writeln('Apellido: '); readln(e.apellido);
        cargarVectorPesos(e.peso,e.semanas);
    end;
    writeln('-------------------');
end;

procedure armarNodo(var l:listaE; e:embarazada);
var
    nuevo:listaE;
begin
    new(nuevo);
    nuevo^.elemento:=e;
    nuevo^.sig:=l;
    l:=nuevo;
end;

procedure generarLista(var l:listaE);
var
    e:embarazada;
begin
    leerRegistro(e);
    while(e.nombre<>'xxx') do begin
        armarNodo(l,e);
        leerRegistro(e);
    end;
end;

procedure maximoAumentoPeso(pesoAct:real; pesoAnt:real; semana:integer; var maxPeso:real; var maxSemana:integer);
var
    cambioPeso:real;
begin
    cambioPeso:=pesoAct-pesoAnt;
    if(cambioPeso>maxPeso) then begin
        maxPeso:=cambioPeso;
        maxSemana:=semana;
    end;
end;

procedure procesarDatos(lista:listaE);
var
    pesoAumentoMax,aumentoPeso, pesoAnterior:real;
    semanaMax, pos:integer;
begin
    while(lista<>nil) do begin
        pesoAumentoMax:=-1;
        aumentoPeso:=0;
        for pos:=1 to lista^.elemento.semanas do begin
            if(pos=1) then pesoAnterior:=lista^.elemento.peso[pos]
            else pesoAnterior:=lista^.elemento.peso[pos-1]; 
            maximoAumentoPeso(lista^.elemento.peso[pos],pesoAnterior,pos,pesoAumentoMax,semanaMax);
        end;
        aumentoPeso:=lista^.elemento.peso[lista^.elemento.semanas]-lista^.elemento.peso[1];
        writeln('DATOS EMBARAZADA: ');
        writeln('Nombre: ',lista^.elemento.nombre);
        writeln('Apellido: ',lista^.elemento.apellido);
        writeln('La semana ',semanaMax,' se registro el mayor aumento de peso: ',pesoAumentoMax:1:2,'kg.');
        writeln('El aumento de peso total fue de ',aumentoPeso:1:2,'kg.');
        writeln('-----------------------------');
        lista:=lista^.sig;
    end;
end;

var
    listaEmbarazadas:listaE;
begin
    listaEmbarazadas:=nil;
    generarLista(listaEmbarazadas);
    procesarDatos(listaEmbarazadas);
end.