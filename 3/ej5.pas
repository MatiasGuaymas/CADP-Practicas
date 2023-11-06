{Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro}

program ej5;
type
    auto=record
        marca:string;
        modelo:string;
        precio:real;
    end;

procedure leer(var a:auto);
begin
    writeln('Ingrese marca: '); readln(a.marca);
    if(a.marca<>'ZZZ') then begin
        writeln('Ingrese modelo: '); readln(a.modelo);
        writeln('Ingrese precio: '); readln(a.precio);
    end;
    writeln('..................');
end;

procedure MayorPrecio(automovil:auto; var automovilMax:auto);
begin
    if(automovil.precio>automovilMax.precio) then
        automovilMax:=automovil;
end;

var
    vehiculo, vehiculoCaro:auto;
    marcaActual:string;
    totalPrecio:real;
    cantAuto:integer;
begin
    vehiculoCaro.precio:=-1;

    leer(vehiculo);

    while(vehiculo.marca<>'ZZZ') do
    begin
        cantAuto:=0;
        totalPrecio:=0;
        marcaActual:=vehiculo.marca;

        while((vehiculo.marca<>'ZZZ') and (vehiculo.marca=marcaActual)) do
        begin
            cantAuto:=cantAuto+1;
            totalPrecio:= totalPrecio + vehiculo.precio;
            MayorPrecio(vehiculo,vehiculoCaro);
            leer(vehiculo);
        end;

        writeln('El precio promedio de la marca ',marcaActual,' es de $',(totalPrecio/cantAuto):1:2); //Importante imprimir marcaActual y no vehiculo.marca, ya que si salio del while, entonces la marca cambio en el registro
        writeln('..................')
    end;

    writeln('El vehiculo mas caro corresponde a la siguiente marca y modelo: ',vehiculoCaro.marca,' ',vehiculoCaro.modelo);

end.