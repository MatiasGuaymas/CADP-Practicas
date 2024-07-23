{Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000
Por ejemplo:
Ingrese un código de empresa: 33
Ingrese la cant. de inversiones: 4
Ingrese el monto de cada inversión: 33200 56930 24500.85 10000
Resultado del análisis: Empresa 33 Monto promedio 31157,71
Ingrese un código de empresa: 41
Ingrese la cant. de inversiones: 3
Ingrese el monto de cada inversión: 102000.22 53000 12000
Resultado del análisis: Empresa 41 Monto promedio 55666,74
Ingrese un código de empresa: 100
Ingrese la cant. de inversiones: 1
Ingrese el monto de cada inversión: 84000.34
Resultado del análisis: Empresa 100 Monto promedio 84000.34
(Fin de la lectura)
La empresa 41 es la que mayor dinero posee invertido ($167000.22).
Hay 3 empresas con inversiones por más de $50000}

program ejercicio1;
var
    codigo, cantInversiones, i, codMax, cant, empresasMas50000: integer;
    monto, montoTotal, max: real;
begin
    max:= -1;
    empresasMas50000:= 0;
    repeat
        writeln('Ingrese codigo de empresa');
        readln(codigo);
        writeln('Ingrese la cantidad de inversiones que tiene la empresa');
        readln(cantInversiones);
        montoTotal:= 0;
        cant:= 0;
        for i:= 1 to cantInversiones do
            begin
                writeln('Ingrese el monto dedicado a cada inversion');
                readln(monto);
                montoTotal:= montoTotal + monto;
                if(monto > 50000) then
                    cant:= cant + 1;
            end;
        writeln('Empresa ', codigo, ' Monto promedio ', (montoTotal/cantInversiones):0:2);
        if(montoTotal > max) then
            begin
                max:= montoTotal;
                codMax:= codigo;
            end;
        if(cant >= 1) then
            empresasMas50000:= empresasMas50000 + 1;
    until (codigo = 100);
    writeln('La empresa ', codMax, ' es la que mayor dinero posee invertido ', '($', max:0:2, ')');
    writeln('Hay ', empresasMas50000, ' empresas con inversiones por mas de $50000');
end.