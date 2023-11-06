{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

program ej3;
type
    lista = ^nodo;
    nodo = record   
        num : integer;
        sig : lista;
    end;

procedure armarNodo1(var iniL: lista; v: integer);  
var
    nuevo, aux : lista;
begin
    new(nuevo); //Uso una variable auxiliar local para generar una nueva dirección y almacenar el valor
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if(iniL=nil) then iniL:=nuevo   //Si iniL=nil significa que no hay elementos en la lista, por lo que el inigresado corresponde al primero
    else begin
        aux:=iniL;  //Utilizo una variable auxiliar para recorrer la lista, evitando modificar iniL, que es mi primer elemento
        while(aux^.sig<>nil) do begin   //Mientras la dirección del siguiente no sea nil (es decir, mientras haya un elemento siguiente)
            aux:=aux^.sig;  //Le asigno a aux el elemento siguiente. Cuando llegue al último, aux^.sig=nil y saldrá.
        end;
        aux^.sig:=nuevo //Le asigno el nuevo elemento a la dirección vacía, para que ahora sea el último elemento
    end;
end;

procedure armarNodo2(var iniL:lista; var ultL:lista; v:integer);
var
    nuevo:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;
    if(iniL=nil) then begin //Si iniL=nil no hay elementos en la lista. El primer y último elemenos serán el mismo
        iniL:=nuevo;
        ultL:=nuevo;
    end
    else begin
        ultL^.sig:=nuevo;   //Sino, le asigno a la dirección siguiente del actual último el nuevo (está en nil) 
        ultL:=nuevo;    //Y luego mi nuevo último es el leido. La linea anterior sirve para conectar el antiguo último con el nuevo último
    end;
end;

procedure imprimirLista(L:lista);
begin
    writeln('............');
    while(L<>nil) do
    begin
        writeln(L^.num);
        L:=L^.sig;
    end;
end;

procedure incrementarLista(L:lista; valor:integer);
begin
    while(L<>nil) do
    begin
        L^.num:= L^.num+valor;
        L:=L^.sig;
    end;
end;
var
    pri,ulti: lista;
    valor, incremento : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin 
        armarNodo2(pri,ulti, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
    writeln('Ingrese el incremento'); readln(incremento);
    incrementarLista(pri, incremento);
    imprimirLista(pri);
end.