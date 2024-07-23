{2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y
luego imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.}

program ejercicio2;
type
    lista = ^nodo;
    persona = record
        dni: integer;
        nombre: string;
        apellido: string;
    end;
    nodo = record
        dato: persona;
        sig: lista;
    end;
procedure leerPersona(p: persona); //No pasa a p por referencia
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;
{Agrega un nodo a la lista}
procedure agregarAdelante(l:lista; p:persona); //No pasa a l por referencia
var
    aux: lista;
begin
    aux^.dato:= p;  //No hace un new de aux
    aux^.sig:= l;
    l:= aux;
end;
{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo; //p no es de tipo nodo, es de tipo persona
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p); //No vuelve a leer una nueva persona
    end;
end;
procedure imprimirInformacion(var l:lista); //No tiene que pasar a l por referencia, se pierde el puntero
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:', l^.nombre, 'Apellido:', l^.apellido); //Accede mal a los campos
        l:= l^.sig;
    end;
end;
{Programa principal}
var
    l:lista;
begin
    generarLista(l); //No inicializa a l en nil
    imprimirInformacion(l);
end.
