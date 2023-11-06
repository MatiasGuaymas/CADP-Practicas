program Registros;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;

procedure leer(var alu : alumno);
begin
    writeln('Ingrese el codigo del alumno');
    readln(alu.codigo);
    if (alu.codigo <> 0) then 
    begin
        writeln('Ingrese el nombre del alumno'); readln(alu.nombre);
        writeln('Ingrese el promedio del alumno'); readln(alu.promedio);
    end;
end;

procedure PromedioMax(nota:real;var notaMax:real; nombreAlu:str20; var nombreAluMax:str20);
begin
    if (nota>notaMax) then
    begin
        notaMax:=nota;
        nombreAluMax:=nombreAlu;
    end;
end;

var
a : alumno;
cantAlu:integer;
nombreMax:str20;
promMax:real;
begin
    cantAlu:=0;
    promMax:=-1;

    leer(a);
    while(a.codigo<>0) do
    begin
        PromedioMax(a.promedio,promMax,a.nombre,nombreMax);
        cantAlu:=cantAlu+1;
        leer(a);
    end;

    writeln('La cantidad de alumnos leida fue de: ',cantAlu);
    writeln('El alumno con mayor promedio es: ',nombreMax);

end.