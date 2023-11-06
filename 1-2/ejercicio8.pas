{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}

program E8A;
const
  diasMes = 31;
var
  //DEFINO LAS VARIABLES A UTILIZAR
  monto, acumulado : real;
  ventasDiarias, dia, maxVentas, maxVentasDia : integer;
begin
  acumulado := 0; //INICIALIZA acumulado EN 0
  maxVentas := -1; maxVentasDia := -1; //INICIALIZA maxVentas y maxVentasDia EN VALORES ABSURDOS
  
  for dia := 1 to diasMes do begin
    ventasDiarias := 0; //ASIGNA EL VALOR 0 A ventasDiarias EN CADA ITERACIÓN DEL FOR
    
    writeln(); //ESPACIO EN BLANCO
    writeln(); //ESPACIO EN BLANCO
    writeln('INGRESE LAS VENTAS PARA EL DÍA ', dia);
    
    repeat
      write('Monto de la venta: '); readln(monto);

      if (monto > 0) then begin
        acumulado := acumulado + monto;
        ventasDiarias := ventasDiarias + 1;
        writeln(); //ESPACIO EN BLANCO
      end;
    until(monto = 0);
    
    writeln(); //ESPACIO EN BLANCO
    writeln('CANTIDAD DE VENTAS DÍA ', dia, ': ', ventasDiarias);
    
    if (ventasDiarias > maxVentas) then begin
      maxVentas := ventasDiarias;
      maxVentasDia := dia;
    end;
  end;
  
  writeln(); //ESPACIO EN BLANCO
  writeln(); //ESPACIO EN BLANCO
  writeln('MONTO TOTAL ACUMULADO EN VENTAS: ', acumulado:0:2);
  writeln(); //ESPACIO EN BLANCO
  writeln('DÍA CON MAYOR CANTIDAD DE VENTAS: ', maxVentasDia);
  
  readln(); //EVITA EL CIERRE DEL PROGRAMA HASTA PRESIONAR ENTER
end.