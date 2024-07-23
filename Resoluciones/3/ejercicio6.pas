{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente
información de los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom,
Centrino, etc.), cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y
tamaño en nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores
se lee de forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores
(que no debe procesarse). Se pide implementar un programa que lea información de los microprocesadores
de la empresa importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen
velocidades de al menos 2 Ghz.}

program ejercicio6;
type
    microprocesador = record
        marca: string;
        linea: string;
        cant: integer;
        velocidad: real;
        nanometros: integer;
    end;
procedure leerMicroprocesador(var m: microprocesador);
begin
    writeln('Ingrese la cantidad de de cores o nucleos de procesamiento');
    readln(m.cant);
    if(m.cant <> 0) then
        begin
            writeln('Ingrese la marca del microprocesador');
            readln(m.marca);
            writeln('Ingrese la linea del microprocesador');
            readln(m.linea);
            writeln('Ingrese la velocidad del reloj del microprocesador');
            readln(m.velocidad);
            writeln('Ingrese el tamanio en nanometros de los transistores');
            readln(m.nanometros);
        end;
end;
procedure maximos(var max1, max2: integer; var nomMax1, nomMax2: string; cant: integer; marca: string);
begin
    if(cant > max1) then
        begin
            max2:= max1;
            max1:= cant;
            nomMax2:= nomMax1;
            nomMax1:= marca;
        end
    else
        if(cant > max2) then
            begin
                max2:= cant;
                nomMax2:= marca;
            end;
end;
procedure empresa();
var
    m: microprocesador;
    marcaActual, nomMax1, nomMax2: string;
    cant14NM, cantProcesadores, max1, max2: integer;
begin
    leerMicroprocesador(m);
    cantProcesadores:= 0;
    max1:= -1;
    max2:= -1;
    while(m.cant <> 0) do
        begin
            marcaActual:= m.marca;
            cant14NM:= 0;
            while(m.cant <>0) and (marcaActual = m.marca) do
                begin
                    if(m.cant > 2) and (m.nanometros <= 22) then
                        writeln('El microprocesador de marca ', m.marca, ' y linea ', m.linea, ' posee mas de 2 cores con transistores de a lo sumo 22 nm');
                    if(m.cant = 14) then
                        cant14NM:= cant14NM + 1;
                    if(m.cant > 1) and ((m.marca = 'Intel') or (m.marca = 'AMD')) and (m.velocidad >= 2) then
                        cantProcesadores:= cantProcesadores + 1;
                    leerMicroprocesador(m);
                end;
            maximos(max1, max2, nomMax1, nomMax2, cant14NM, marcaActual);
        end;
    writeln('Las dos marcas con mayor cantidad de procesadores con transistores de 14nm son: ', nomMax1, ' y ', nomMax2);
    writeln('La cantidad de procesadores multicore (de mas de un core) de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz es: ', cantProcesadores);
end;
begin
    empresa;
end.