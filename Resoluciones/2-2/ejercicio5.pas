{5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program ejercicio5;
function dobleNumero(numA, numB: integer): boolean;
begin
    dobleNumero:= (numB = (numA * 2));
end;
var
    numA, numB, paresLeidos, paresDobles: integer;
begin
    writeln('Ingrese el numA');
    readln(numA);
    writeln('Ingrese el numB');
    readln(numB);
    paresLeidos:= 0;
    paresDobles:= 0;
    while(numA <> 0) or (numB <> 0) do
        begin
            if(dobleNumero(numA, numB)) then
                paresDobles:= paresDobles + 1;
            paresLeidos:= paresLeidos+1;
            writeln('Ingrese el numA');
            readln(numA);
            writeln('Ingrese el numB');
            readln(numB);
        end;
    writeln('Cantidad de pares leidos: ', paresLeidos);
    writeln('Cantidad de pares en los que numB es el doble de numA: ', paresDobles);
end.