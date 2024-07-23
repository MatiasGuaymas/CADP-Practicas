{8. Dado el siguiente programa:
program anidamientos;
procedure leer;
var
    letra : char;
    function analizarLetra : boolean;
    begin
        if (letra >= ‘a’) and (letra <= ‘z’) then
            analizarLetra := true;
        else
            if (letra >= ‘A’) and (letra <= ‘Z’) then
                analizarletra := false;
    end; //fin de la funcion analizarLetra
begin
    readln(letra);
    if (analizarLetra) then
        writeln(‘Se trata de una minúscula’)
    else
        writeln(‘Se trata de una mayúscula’);
end; // fin del procedure leer

var
    ok : boolean;
begin // programa principal
    leer;
    ok := analizarLetra;
    if ok then
        writeln(‘Gracias, vuelva prontosss’);
end.

a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto
puede traer problemas en el código del programa principal.
i) ¿qué clase de problema encuentra?
ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente?
b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata?
ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores?
iii) ¿Cómo se puede resolver este problema?}

{Inciso a) 
i) El problema principal es que el programa principal llama a la funcion analizarLetra y esta solo es conocida en el procedimiento leer, por lo tanto da error.
ii) Estaria bueno que la funcion sea conocida por todo el programa y no sea un submodulo para solucionar el error.
Inciso b)
i) El problema esta en que si el usuario ingresa un caracter que no sea una letra, la funcion no evalua este caso. Siempre retorna false, y no es una letra.
b) Si el usuario no ingresa una letra la funcion siempre retorna false
c) Este problema se puede solucionar por partes: primero se debe evaluar la condicion de que no sea una letra: podria ser una funcion que devuelve un entero y dependiendo que numero devuelva imprimo algo.}