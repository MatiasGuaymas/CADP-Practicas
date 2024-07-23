{13. La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello, Amazon
cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura, Historia,
Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de veces
que fue vendido y código del área temática (1..35).
Realizar un programa que:
A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la editorial
“Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con más
de 250 ventas.}

program ejercicio13;
const
    DIMF=35;
type
    rangoArea = 1..DIMF;
    vecAreas = array[rangoArea] of string;

    libro=record
        titulo:string;
        editorial:string;
        paginas:integer;
        anioEdicion:integer;
        ventas:integer;
        codArea:rangoArea;
    end;

    regLista = record
        titulo: string;
        tematica: string;
        cantPaginas: integer;
    end;

    lista=^nodo;
    nodo=record
        dato:regLista;
        sig:lista;
    end;

    editorial=record
        nombre:string;
        anioEdicionMasAntiguo:integer;
        cantLibrosEditados:integer;
        cantTotalVentas:integer;
        listaLibros:lista;
    end;
procedure cargarVectorAreas(var vec:vecAreas);
begin
    vec[1]:='Arte y Cultura';
    vec[2]:='Historia';
    vec[3]:='Literatura';
    vec[4]:='Ciencia';
    vec[5]:='Tecnologia';
    vec[6]:='Matematica';
    vec[7]:='Fisica';
    vec[8]:='Quimica';
    vec[9]:='Biologia';
    vec[10]:='Geografia';
    vec[11]:='Politica';
    vec[12]:='Economia';
    vec[13]:='Filosofia';
    vec[14]:='Religion';
    vec[15]:='Deportes';
    vec[16]:='Musica';
    vec[17]:='Cine';
    vec[18]:='Teatro';
    vec[19]:='Danza';
    vec[20]:='Pintura';
    vec[21]:='Escultura';
    vec[22]:='Arquitectura';
    vec[23]:='Fotografia';
    vec[24]:='Moda';
    vec[25]:='Cocina';
    vec[26]:='Jardineria';
    vec[27]:='Mascotas';
    vec[28]:='Salud';
    vec[29]:='Medicina';
    vec[30]:='Psicologia';
    vec[31]:='Educacion';
    vec[32]:='Infantil';
    vec[33]:='Juvenil';
    vec[34]:='Adultos';
    vec[35]:='Otros';
end;
procedure leerLibro(var l:libro);
begin
    writeln('Ingrese el titulo del libro');
    readln(l.titulo);
    writeln('Ingrese el nombre de la editorial');
    readln(l.editorial);
    writeln('Ingrese la cantidad de paginas');
    readln(l.paginas);
    writeln('Ingrese el anio de edicion');
    readln(l.anioEdicion);
    writeln('Ingrese la cantidad de ventas');
    readln(l.ventas);
    writeln('Ingrese el codigo del area tematica');
    readln(l.codArea);
end;
procedure agregarAdelante(var l:lista; t:string; tem:string; pag:integer);
var
    aux:lista;
begin
    new(aux);
    aux^.dato.titulo:=t;
    aux^.dato.tematica:=tem;
    aux^.dato.cantPaginas:=pag;
    aux^.sig:=l;
    l:=aux;
end;
procedure leerYProcesar(var e: editorial; v: vecAreas);
var
    l: libro;
begin
    repeat
        leerLibro(l);
        if(l.editorial = 'Planeta Libros') then
            begin
                if(l.anioEdicion < e.anioEdicionMasAntiguo) then
                    e.anioEdicionMasAntiguo:=l.anioEdicion;
                e.cantLibrosEditados:=e.cantLibrosEditados+1;
                e.cantTotalVentas:=e.cantTotalVentas+l.ventas;
                if(l.ventas > 250) then
                    agregarAdelante(e.listaLibros,l.titulo, v[l.codArea],l.paginas);
            end;
    until (l.titulo = 'Relato de un naufrago');
end;
procedure inicializarEditorial(var e:editorial);
begin
    e.nombre:='Planeta Libros';
    e.anioEdicionMasAntiguo:=9999;
    e.cantLibrosEditados:=0;
    e.cantTotalVentas:=0;
    e.listaLibros:=nil;
end;
procedure imprimirEditorial(e:editorial);
var
    aux: lista;
begin
    writeln('Nombre: ',e.nombre, ' AnioMin: ',e.anioEdicionMasAntiguo, ' CantLibros: ',e.cantLibrosEditados, ' CantVentas: ',e.cantTotalVentas);
    writeln('Detalle con titulo, nombre del area tematica y cantidad de paginas de todos los libros con mas de 250 ventas');
    aux := e.listaLibros;
    while(aux <> nil) do
        begin
            writeln('Titulo: ',aux^.dato.titulo, ' Tematica: ',aux^.dato.tematica, ' Paginas: ',aux^.dato.cantPaginas);
            aux := aux^.sig;
        end;
end;
var
    vec:vecAreas;
    e:editorial;
begin
    cargarVectorAreas(vec);
    inicializarEditorial(e);
    leerYProcesar(e, vec);
    imprimirEditorial(e);
end.