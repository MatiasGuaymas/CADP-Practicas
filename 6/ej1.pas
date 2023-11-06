{a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista}

program ej1;
type
    lista = ^nodo;  //Variable lista tipo puntero que apunta a registro nodo
    nodo = record   //Registro nodo
        num : integer;
        sig : lista;    //campo de registro tipo lista (puntero que apunta a registro de igual tipo)
    end;

procedure armarNodo(var L: lista; v: integer);  //Recibe un elemento tipo lista por referencia (será capaz de modificar la dirección que guarda)
var
    aux : lista;
begin
    new(aux);   //Inicializa con una dirección de memoria a aux de tipo lista
    aux^.num := v;  //Asigna el valor entero al campo num del registro apuntado por aux
    aux^.sig := L;  //Asigna la dirección de memoria de L al campo sig del registro apuntado por aux
    L := aux;   //Se le asigna a L la dirección de aux (ahora apunta al registro cuya dirección y valor asignamos anteriormente)
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
    pri := nil; //Inicializa el puntero del primer elemento de la lista en nil (no apunta a ninguna dirección)
    writeln('Ingrese un numero');
    read(valor);    //Lee un entero
    while (valor <> 0) do begin //Mientras dicho entero sea distinto de 0 ingresa al bucle 
        armarNodo(pri, valor);
        writeln('Ingrese un numero');
        read(valor);
    end;
    imprimirLista(pri);
    writeln('Ingrese el incremento'); readln(incremento);
    incrementarLista(pri, incremento);
    imprimirLista(pri);
end.

{
a- El programa lee valores enteros (distintos de 0) y, con el procedimiento armarNodo, agrega elementos adelante de la lista. 
Es decir, cada numero ingresado se situará antes del anterior ingresado.
b- Por lo tanto, leer la secuencia 10 21 13 48 0 implicará guardar dichos valores en el orden 48 13 21 10, pues cada elemento ingresado se lo
ubica primero.
}