{7) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener
una longitud máxima de 50 caracteres.
a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.
b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:

Type 
    Nombre = String[50];
    Puntero = ^Nombre;
    ArrPunteros = array[1..2500] of Puntero;
Var
    Punteros: ArrPunteros;

b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?
b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}

program ejercicio7;
type
    str50=string[50];
    vectorNombres=array[1..2500] of ^str50;
procedure InicializarVectorPunteros(var v:vectorNombres);
var
    i:integer;
begin
    for i:=1 to 2500 do
        new(v[i]);
end;
procedure LeerNombres(var vec:vectorNombres);   //No es necesario pasarlo por referencia porque se va a acceder al contenido de la dirección
var
    j:integer;
begin
    for j:=1 to 2500 do
        readln(vec[j]^);
end;
var
    punteros:vectorNombres;
begin
    writeln('La variable punteros ocupa ',SizeOf(punteros),' bytes'); //2500 * 4 = 10000 bytes
    InicializarVectorPunteros(punteros);
    {La invocación del anterior módulo implica referenciar el puntero a una dirección de memoria dinámica. En la memoria estática sigue ocupando
    4 bytes por posicion (10.000 total). Una vez reservada, en la dinámica ocupa 51 bytes (pues se apunta a str50) por cada posición, con un
    total de 127.500 bytes.}
    LeerNombres(punteros);    
    {La invocación del módulo permite leer un nombre para el valor referenciado de cada puntero, por cada posición. Esos nombres se alojan en la
    memoria dinámica. El espacio ocupado es el mismo, pues fue reservado previamente.}
end.
