{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:
a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program ej4;
const
    dimF=100;
type
    vRango=1..dimF;
    vector = array[1..dimF] of integer;

function PosicionNum(v:vector; num:integer; dimL:vRango):integer;
var
    pos:integer;
    condicion:boolean;
begin
    pos:=1;
    condicion:=false;
    while((pos<=dimL) and (not condicion)) do begin
        if (v[pos]=num) then condicion:=true
        else
            pos:=pos+1;
    end;
    
    if(condicion) then PosicionNum:=pos
    else
        PosicionNum:=-1;

end;

procedure IntercambiarValor(var vec:vector; x,y:vRango);
var
    aux:integer;
begin
    aux:=vec[x];
    vec[x]:=vec[y];
    vec[y]:=aux;
end;

function SumaVector(ve:vector; dimL:vRango):integer;
var
    i:vRango;
    suma:integer;
begin
    suma:=0;
    
    for i:=1 to dimL do
        suma:=suma+ve[i];

    sumaVector:=suma;
end;

function Promedio(v:vector; tSuma:integer; dimL:vRango):real;
begin
    Promedio:=tSuma/dimL;
end;

procedure MaxElemento(vec:vector; var maxNum:integer; var maxPos:vRango; dimL:vRango);
var
    k:vRango;
begin
    maxNum:=-32768;
    for k:=1 to dimL do
    begin
        if(vec[k]>maxNum) then begin
            maxNum:=vec[k];
            maxPos:=k;
        end;
    end;
end;

procedure MinElemento(ve:vector; var minNum:integer; var minPos:vRango; dimL:vRango);
var
    h:vRango;
begin
    minNum:=32767;
    for h:=1 to dimL do
    begin
        if(ve[h]<minNum) then begin
            minNum:=ve[h];
            minPos:=h;
        end;
    end;
end;

begin
end.