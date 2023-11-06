{De acuerdo a los valores de la tabla que indica la cantidad de bytes que ocupa la representación
interna de cada tipo de dato en Pascal, calcular el tamaño de memoria en los puntos señalados a partir
de(I), suponiendo que las variables del programa ya están declaradas y se cuenta con 400.000 bytes
libres. Justificar mediante prueba de escritorio.}

Program ej5;
Type
    TEmpleado = record
        sucursal: char;
        apellido: string[25];
        correoElectronico: string[40];
        sueldo: real;
    end;
    Str50 = string[50];
Var
    alguien: TEmpleado;
    PtrEmpleado: ^TEmpleado;
Begin
    {Suponer que en este punto se cuenta con 400.000 bytes de memoria disponible (I)}
    Readln( alguien.apellido );
    {Pensar si la lectura anterior ha hecho variar la cantidad de memoria (II)}
    New( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora? (III)}
    Readln( PtrEmpleado^.Sucursal, PtrEmpleado^.apellido );
    Readln( PtrEmpleado^.correoElectronico, PtrEmpleado^.sueldo );
    {¿Cuánta memoria disponible hay ahora? (IV)}
    Dispose( PtrEmpleado );
    {¿Cuánta memoria disponible hay ahora? (V)}
end.

{
I) Se cuentan con 400.000 bytes. Debido a que el enunciado no lo aclara, se considera el total entre memoria estática y dinámica. 
II) La lectura no hace varíar la memoria, pues espacio ya había sido reservado previamente al declarar las variables.
III) Se reserva memoria dinámica. El puntero dentro del new apunta a una variable registro, por lo que la memoria ocupada es la suma de todos
sus campos. Un total de 72 bytes ocupa, quedando un total de 399.928 bytes libres.
IV) Leer valores para el el registro referenciado por el puntero no modifica la memoria, pues es el espacio fue previamente reservado.
V) El dispose libera la memoria dinámica reservada, eliminando los 72 bytes ocupados por el registro y quedando un total de 400.000 bytes.
}