{ Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program ejercicio5;
var
    x, num: real;
    cont: integer;
begin
    cont:= 0;
    WriteLn('Ingrese un numero');
    ReadLn(x);
    WriteLn('Ingrese un numero');
    ReadLn(num);
    while (num <> (x * 2)) and (cont < 10) do begin
        cont:= cont + 1;
        WriteLn('Ingrese un numero');
        ReadLn(num);
    end;
    if (num = (x * 2)) then
        WriteLn('Se ingreso el doble de X')
    else
        WriteLn('No se ingreso el doble de X');
end.