{Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.}

program ej6;
const
    dimF=100;
type
    vRango=1..dimF;
    vector = array[vRango] of integer;

    elemento=record
        numero:integer;
        posicion:vRango;
    end;

procedure ElementoMaxYMin(vec:vector; var maxEle:elemento; var minEle:elemento; dimL:vRango);
var
    k:vRango;
begin
    maxEle.numero:=-32768;
    minEle.numero:=32767;
    for k:=1 to dimL do
    begin
        if(vec[k]>maxEle.numero) then begin
            maxEle.numero:=vec[k];
            maxEle.posicion:=k;
        end;
        if(vec[k]<=minEle.numero) then begin    //pongo if en vez de else if, pues con este ultimo corro riesgo de perder un primer minimo
            minEle.numero:=vec[k];
            minEle.posicion:=k;
        end;
    end;
end;

begin
end.