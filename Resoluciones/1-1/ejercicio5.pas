{5. Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program ejercicio5;
var
    x, num, cant: real;
begin
    writeln('Ingrese un numero real');
    readln(x);
    writeln('Ingrese otro numero real');
    readln(num);
    cant:= 1;
    while(cant < 10) and (num <> x*2) do
        begin
            writeln('Ingrese otro numero real');
            readln(num);
            cant:= cant+1;
        end;
    if(cant = 10) then
        writeln('No se ha ingresado el doble de X');
end.