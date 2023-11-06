{Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program ej10;
const
    cantEmpleados=300;
type
    int300=1..cantEmpleados;

    salarios=array [int300] of real;

procedure leer(var s:salarios; var dimL:int300);
var
    valor:real;
begin
    dimL:=0;
    writeln('Ingrese salario: ');
    readln(valor);
    while (valor<>0) and (dimL<cantEmpleados) do
    begin
        dimL:=dimL+1;
        s[dimL]:=valor;
        if(dimL<cantEmpleados) then
            readln(valor);
    end;
end;

//Seria mas practico pasarle un solo valor del vector e incrementarlo, recorriendo el array una unica vez en el prog principal, pero
//el enunciado lo pide asi
procedure IncrementoSalario(incremento: real; dimLog:int300;var sa:salarios);
var
    j:int300;
begin
    for j:=1 to dimLog do
        sa[j]:=sa[j]*((incremento/100) +1);
end;

procedure SalarioPromedio(sal:salarios; dLog:int300);
var
    promedio, suma:real;
    h:integer;
begin
    suma:=0;
    for h:=1 to dLog do
        suma:=suma+sal[h];
    
    promedio:=suma/dLog;
    writeln('El sueldo promedio es de : $',promedio:1:2);
end;

var
    sueldo:salarios;
    dimensionLog:int300;
    aumento:real;
begin
    leer(sueldo, dimensionLog);

    writeln('Ingrese porcentaje de aumento: '); readln(aumento);
    IncrementoSalario(aumento, dimensionLog, sueldo);
    SalarioPromedio(sueldo, dimensionLog);
end.