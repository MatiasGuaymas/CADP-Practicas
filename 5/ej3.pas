//Indicar que imprime

program ej3;
type
    numeros = array[1..10000] of integer;
    puntero_numeros = ^numeros;
var
    n: puntero_numeros;
    num: numeros;
    i:integer;
begin
    writeln(sizeof(n), ' bytes');   //Imprime 4 bytes, pues es lo que ocupa un puntero en memoria estática
    writeln(sizeof(num), ' bytes'); //Imprime 20.000 bytes, pues son 10.000 enteros de 2 bytes cada uno
    new(n);
    writeln(sizeof(n^), ' bytes');  //Imprime 20.000 bytes, pues es el valor al que apunta el puntero, cuya dirección almacena el vector
    for i:= 1 to 5000 do
        n^[i]:= i;
    writeln(sizeof(n^), ' bytes');  //Vuelve a imprimir 20.000 bytes, pues cargar el vector no modifica el espacio que fue reservado previamente
end.