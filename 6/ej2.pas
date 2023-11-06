{2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.}

program ej2;
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

procedure leerPersona(p: persona);  //Eror 6: p debe ser pasado por referencia, para asignar valores a sus campos
begin
    read(p.dni);
    if (p.dni <> 0)then begin
        read(p.nombre);
        read(p.apellido);
    end;
end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
var
    p:nodo; //Error 1: p debe ser tipo persona, para poder cargar los datos
begin
    leerPersona(p);
    while (p.dni <> 0) do begin
        agregarAdelante(l,p);
    end;    //Error 5: Debo leerPersona nuevamente en el while. Sino, p nunca cambiará y el bucle será infinito
end;

procedure imprimirInformacion(var l:lista); //Error 3: l debe pasarse por valor, ya que los cambios dentro del proceso no deben modificar la variable original
begin
    while (l <> nil) do begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:',
        l^.nombre, 'Apellido:', l^.apellido);   //Error 4: al nombre y apellido se accede con l^.dato.nombre y l^.dato.apellido
        l:= l^.sig;
    end;
end;

{Agrega un nodo a la lista}
//Error 8: agregarAdelante debe definirse antes que generarLista, pues este último lo utiliza
procedure agregarAdelante(l:lista;p:persona);   //Error 2: l debe pasarse por referencia, sino no podrá modificarse la dirección almacenada
var
    aux: lista;
begin
    //Error 7: falta hacer un new para aux
    aux^.dato:= p;  
    aux^.sig:= l;
    l:= aux;
end;

{Programa principal}
var
    l:lista;
begin
    //Error 9: se debe inicializar l:=nil
    generarLista(l);
    imprimirInformacion(l);
end.