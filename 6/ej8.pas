{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

program ej8;
type
    lista = ^nodo;
    nodo = record
        num : integer;
        sig : lista;
    end;

//Para insertar ordenado necesito la lista pasada por referencia, una variable para el nuevo nodo, un actual y un anterior
//Poseo 4 casos posibles: 1) Lista vacía, pri=nil. 2) Elemento al inicio, actual=anterior=pri. 3) Elemento en medio, actual<>pri y actual<>nil.
//Anterior un nodo antes de actual. 4) Elemento al final, actual=nil, anterior en último nodo
procedure armarNodo(var pri:lista; v: integer);
var
    actual, anterior, nuevo:lista;
begin
    new(nuevo);
    nuevo^.num:=v;
    nuevo^.sig:=nil;

    if(pri=nil) then pri:=nuevo //Si pri=nil la lista está vacía, asi que simplemente asigno el elemento
    else
        begin
            actual:=pri;    //Actual comienza en primer elemento
            anterior:=pri;  //Anterior comienza en primer elemento
            while((actual<>nil) and (actual^.num<nuevo^.num)) do begin  //Itero hasta llegar al último elemento o que el elemento sea mayor al nuevo
                anterior:=actual;   //Siempre que se entre al bucle, anterior estará un nodo atrás de actual
                actual:=actual^.sig;    //Actual toma los nuevos nodos para recorrer la lista
            end;
        
            if(actual=pri) then begin   //Si actual=pri, sabiendo que pri<>nil, entonces el primer elemento es mayor al nuevo, por lo que este será ahora el nuevo primer elemento
                nuevo^.sig:=pri;
                pri:=nuevo;
            end
            {Si pri<>nil y actual<>pri, entonces el elemento está en medio o al final. 
            - Si está en medio entonces actual<>nil. Actual está en pos 4 y anterior en pos 2, el nuevo debe ser pos 3. 
            Al siguiente de actual le asigno nuevo. Al siguiente de nuevo le asigno actual, quedando pos 2,3,4 (ej)
            - Si está al final, entonces actual=nil. Anterior está en el último elemento. Al siguiente de anterior le asigno nuevo (ahora es
            último elemento). A siguiente de nuevo le asigno actual (que vale nil)}
            else begin   
                anterior^.sig:=nuevo;
                nuevo^.sig:=actual;
            end;
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
    pri : lista;
    valor, incremento : integer;
begin
    pri := nil;
    writeln('Ingrese un numero');
    read(valor);
    while (valor <> 0) do begin 
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
    writeln('Ingrese el incremento'); readln(incremento);
    incrementarLista(pri, incremento);
    imprimirLista(pri);
end.