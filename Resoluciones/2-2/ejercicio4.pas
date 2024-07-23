{4. El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.
1. program programadores;
2. procedure leerDatos(var legajo: integer; salario : real);
3. begin
4. writeln(‘Ingrese el nro de legajo y el salario”);
5. read(legajo);
6. read(salario);
7. end;
8. procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
9. var
10. maxSalario : real;
11. begin
12. if (nuevoLegajo > maxLegajo) then begin
13. maxLegajo:= nuevoLegajo;
14. maxSalario := nuevoSalario
15. end;
16. end;
17. var
18. legajo, maxLegajo, i : integer;
19. salario, maxSalario : real;
20. begin
21. sumaSalarios := 0;
22. for i := 1 to 130 do begin
23. leerDatos(salario, legajo);
24. actualizarMaximo(legajo, salario, maxLegajo);
25. sumaSalarios := sumaSalarios + salario;
26. end;
27. writeln(‘En todo el mes se gastan ‘, sumaSalarios, ‘ pesos’);
28. writeln(‘El salario del empleado más nuevo es ‘,maxSalario);
29. end.}

program programadores;
procedure leerDatos(var legajo: integer; salario : real); //En los parametros actuales se envia primero salario y luego legajo, y en los parametros formales se recibe primero el legajo y despues el salio. Error de tipos.
begin
    writeln('Ingrese el nro de legajo y el salario');
    read(legajo);
    read(salario);
end;
procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer); //Deberia agregarse un parametro por referencia maxSalario
var
    maxSalario : real;
begin
    if (nuevoLegajo > maxLegajo) then begin //Intenta comparar un legajo con basura
        maxLegajo:= nuevoLegajo;
        maxSalario := nuevoSalario //No se retorna el salario maximo, la variable desaparece una vez finalizado el procedimiento
    end;
end;
var
    legajo, maxLegajo, i : integer;
    salario, maxSalario : real;
begin
    sumaSalarios := 0; //sumaSalarios no esta declarado como variable
    for i := 1 to 130 do begin
        leerDatos(salario, legajo);
        actualizarMaximo(legajo, salario, maxLegajo); //maxLegajo no esta inicializado, contiene basura. Ademas deberia pasarse un maxSalario como otro parametro
        sumaSalarios := sumaSalarios + salario;
    end;
    writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
    writeln('El salario del empleado mas nuevo es ',maxSalario); //maxSalario nunca se actualizo, imprime basura.
end.