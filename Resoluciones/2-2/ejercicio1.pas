{1. Responda las preguntas en relación al siguiente programa:
program Ejercicio3;
procedure suma(num1: integer; var num2:integer);
begin
num2 := num1 + num2;
num1 := 0;
end;
var
i, x : integer;
begin
read(x); //leo la variable x 
for i:= 1 to 5 do
suma(i,x);
write(x); //imprimo las variable x 
end.
a. ¿Qué imprime si se lee el valor 10 en la variable x ?
b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);}

{a. Imprime 25
b. Imprime 10
c. Error, se cambia el valor de i}

program Ejercicio3;
procedure suma(num1: integer; var num2:integer);
begin
    num2 := num1 + num2;
    num1 := 0;
end;
var
    i, x : integer;
begin
    read(x); { leo la variable x }
    for i:= 1 to 5 do
        suma(i,x);
    write(x); { imprimo las variable x }
end.