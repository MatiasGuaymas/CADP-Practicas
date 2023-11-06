{Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.
a) Hasta la sentencia de la línea 18
b) Hasta la sentencia de la línea 20
c) Hasta la sentencia de la línea 23
d) Hasta la sentencia de la línea 11
e) Hasta la sentencia de la línea 25}

program ej8;
type
    datos = array [1..20] of integer;
    punt = ^datos;

procedure procesarDatos(v : datos; var v2 : datos);
var
    i, j : integer;
begin
    for i := 1 to 20 do
{11.}   v2[21 - i] := v[i];
end;

var
    vect : datos;
    pvect : punt;
    i : integer;
{18.}begin
    for i:= 1 to 20 do
{20.}   vect[i] := i;
    new(pvect);
    for i:= 20 downto 1 do
{23.}   pvect^[i] := 0;
    procesarDatos(pvect^, vect);
{25.}writeln('fin');
end.

{
Hasta linea 11:
No hay nada en memoria (en cuanto a variables, constantes y parámetros refiere), ya que las variables locales al módulo y los parámetros serán
cargados en memoria una vez que el procedimiento sea invocado.

Hasta linea 18:
Se han declarado 4 variables en el programa principal. vect de tipo datos ocupa 40 bytes (2 bytes/entero x 20 enteros), pvect de tipo punt ocupa
4 bytes (puntero) y la variable i de tipo entero ocupa 2 bytes. Se ha ocupado hasta el momento un total de:
- Memoria estática: 46 bytes.
- Memoria dinámica: 0 bytes.

Hasta linea 20:
Se carga el vector de tipo datos en el programa principal. No supone un cambio en la memoria pues esta había sido reservada previamente.
- Memoria estática: 46 bytes.
- Memoria dinámica: 0 bytes.

Hasta linea 23:
En la linea 21 se ha hecho un new para el puntero, reservando memoria dinámica. Este referencia al tipo datos, por lo que en memoria dinámica
se reserva espacio para un vector de 20 enteros, ocupando 40 bytes. En la linea 23 se inicializan las posiciones del vector del puntero, pero
esto no supone un cambio.
- Memoria estática: 46 bytes.
- Memoria dinámica: 40 bytes.

Hasta linea 25:
En la linea 24 se llama al procedimiento ProcesarDatos. Este recibe dos parametros (vector y valor de puntero de vector) y asigna de forma 
descendente los valores del vector. Allí se ocupan 40 bytes para el parámetro por valor y luego 4 bytes para el parámetro por referencia. 
Esto se debe a que el parámetro por referencia utiliza la dirección de memoria de la variable pasada como argumento, pero el espacio donde 
se almacena el valor sigue siendo el de la variable original, pasada al módulo. Luego i y j ocupan 2 bytes cada uno al ser entero, 
como variables locales al procedimiento. Por lo tanto, el módulo reserva 48 bytes. Sin embargo, este se ejecuta y, al finalizar, la memoria
reservada para el mismo es liberada.
Por lo tanto, para la línea 25, el espacio ocupado es el mismo que antes de haber invocado el módulo:
- Memoria estática: 46 bytes.
- Memoria dinámica: 40 bytes.
}