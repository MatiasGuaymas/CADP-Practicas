{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}

program ejercicio8;
type
    subDia = 1..31;
var
    i, diaMax: subDia;
    monto, montoTotal, montoDia: real;
    cantVentas, max: integer;
begin
    max:= -1;
    montoTotal:= 0;
    for i:= 1 to 5 do
        begin
            cantVentas:= 0;
            montoDia:= 0;
            writeln('Ingrese el monto para el dia ', i);
            readln(monto);
            while(monto <> 0) do
                begin
                    montoDia:= montoDia + monto;
                    cantVentas:= cantVentas + 1;
                    montoTotal:= montoTotal + monto;
                    writeln('Ingrese otro monto para el dia ', i);
                    readln(monto);
                end;
            if(cantVentas >= max) then
                begin
                    max:= cantVentas;
                    diaMax:= i;
                end;
            writeln('En el dia ', i ,' se hizo un total de: ', cantVentas, ' ventas');
        end;
    writeln('El monto total acumulado en ventas de todo el mes fue de: ', montoTotal:0:2);
    writeln('El dia en que se realizo la mayor cantidad de ventas fue el dia: ', diaMax);
end.