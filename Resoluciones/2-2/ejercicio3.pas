{Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste:
1. program ejercicio5;
2. //suma los números entre a y b, y retorna el resultado en c 
3. procedure sumar(a, b, c : integer)
4. var
5. suma : integer;
6. begin
7.
8. for i := a to b do
9. suma := suma + i;
10. c := c + suma;
11. end;
12. var
13. result : integer;
14. begin
15. result := 0;
16. readln(a); readln(b);
17. sumar(a, b, 0);
18. write(‘La suma total es ‘,result);
19. //averigua si el resultado final estuvo entre 10 y 30
20. ok := (result >= 10) or (result <= 30);
21. if (not ok) then
22. write (‘La suma no quedó entre 10 y 30’);
23. end.}

program ejercicio5;
{ suma los números entre a y b, y retorna el resultado en c }
procedure sumar(a, b, c : integer); //c deberia estar pasado como parametro de referencia
var
    suma : integer;
begin
    for i := a to b do //i no esta declarado
        suma := suma + i; //suma no esta inicializado en 0, suma basura con i
    c := c + suma;
end;
var
    result : integer;
begin
    result := 0;
    readln(a); readln(b); //a y b no estan declaradas como variables
    sumar(a, b, 0); //No se puede mandar un valor literal en el parametro actual, deberia pasarse la variable result
    write('La suma total es ',result);
    { averigua si el resultado final estuvo entre 10 y 30}
    ok := (result >= 10) or (result <= 30); //Si el resultado debe estar entre estos resultados seria necesario un and y no un or
    if (not ok) then
        write ('La suma no quedo entre 10 y 30');
end.