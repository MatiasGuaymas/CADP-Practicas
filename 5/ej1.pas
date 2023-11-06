//Indicar que imprime

program ej1;
type
    cadena = string[50];
    puntero_cadena = ^cadena;
var
    pc: puntero_cadena;
begin
    writeln(sizeof(pc), ' bytes');  //Imprime 4 bytes, espacio reservado en memoria estática para el puntero
    new(pc);                        //Reserva memoria dinámica para pc
    writeln(sizeof(pc), ' bytes');  //Vuelve a imprimir 4 bytes, pues se está haciendo referencia a la variable puntero y no al valor en memoria dinámica
    pc^:= 'un nuevo nombre';        //Le asigna un valor a la cadena cuyo valor apunta el puntero
    writeln(sizeof(pc), ' bytes');  //Vuelve a imprimir 4 bytes, porque se hace referencia al puntero en memoria estática
    writeln(sizeof(pc^), ' bytes'); //Imprime 51 bytes (50 caracteres + 1), pues se hace referencia al valor apuntado en memoria dinámica. Tener en cuenta que string[50] obliga a reservar este espacio 
    pc^:= 'otro nuevo nombre distinto al anterior'; //Se asigna nuevo valor al valor apuntado por pc
    writeln(sizeof(pc^), ' bytes'); //Imprime 51 bytes (50 + 1), pues se menciona el valor al que apunta el puntero
end.