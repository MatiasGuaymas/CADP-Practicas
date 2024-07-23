{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}

program ejercicio4;
var
    i, num, min1, min2: integer;
begin
    min1:= 999;
    min2:= 999;
    for i:= 1 to 1000 do
        begin
            writeln('Ingrese un numero entero');
            readln(num);
            if(num < min1) then
                begin
                    min2:= min1;
                    min1:= num;
                end
            else
                if(num < min2) then
                    min2:= num;
        end;
    writeln('Los dos numeros minimos son: ', min1, ' y ', min2);

    min1:= 999;
    min2:= 999;
    repeat
        writeln('Ingrese un numero entero');
        readln(num);
        if(num < min1) then
            begin
                min2:= min1;
                min1:= num;
            end
        else
            if(num < min2) then
                min2:= num;
    until (num = 0);
    writeln('Los dos numeros minimos son: ', min1, ' y ', min2);

    min1:= 999;
    min2:= 999;
    writeln('Ingrese un numero entero');
    readln(num);
    while(num <> 0) do
        begin
            if(num < min1) then
            begin
                min2:= min1;
                min1:= num;
            end
            else
            if(num < min2) then
                min2:= num;
            writeln('Ingrese un numero entero');
            readln(num);    
        end;
    writeln('Los dos numeros minimos son: ', min1, ' y ', min2);
end.