{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program ej7;
type
    dRango=0..9;
    digitos=array[dRango] of integer;

procedure Inicializar(var v:digitos);
var
    j:dRango;
begin
    for j:=0 to 9 do
        v[j]:=0;
end;

procedure Descomponer(var vector:digitos; num:integer);
var
    resto:dRango;
begin
    while(num<>0) do
    begin
        resto:=num MOD 10;
        vector[resto]:=vector[resto]+1;
        num:= num DIV 10;
    end;
end;

function DigitoMasLeido(vec:digitos):integer;
var
    maxNum: integer;
    i, maxDig:dRango;
begin
    maxNum:=-1;
    for i:=0 to 9 do
    begin
        if(vec[i]>maxNum) then
        begin
            maxNum:=vec[i];
            maxDig:=i;
        end;
    end;

    DigitoMasLeido:=maxDig;
end;

procedure InformarOcurrencia(v:digitos);
var
    h:dRango;
begin
    for h:=0 to 9 do
        writeln('Numero ',h,': ',v[h],' veces');
end;

var
    numeros:digitos;
    n:integer;
begin
    Inicializar(numeros);
    writeln('Ingrese numeros: ');
    readln(n);
    
    while(n<>-1) do
    begin
        Descomponer(numeros,n);
        readln(n);
    end;
    
    InformarOcurrencia(numeros);
    writeln('El digito mas leido fue: ', DigitoMasLeido(numeros));

end.