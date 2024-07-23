{7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de 
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber: 
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso 
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).  
1. Realizar un  módulo  que  lea y  almacene  la  información de  los  alumnos  hasta que  se  ingrese  el 
alumno con número de alumno  -1, el cual no debe procesarse. Las 24 notas correspondientes  a 
cada  alumno deben quedar ordenadas de forma descendente.  
2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:  
a. El promedio de notas obtenido por cada alumno.  
b. La  cantidad  de  alumnos  ingresantes  2012  cuyo  número  de  alumno  está  compuesto 
únicamente por dígitos impares. 
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido 
se recibieron (o sea, que tardaron menos años)  
3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de 
la estructura generada en el inciso 1. El alumno puede no existir. }

program ejercicio7;
const
    dimf = 3;
type
    cadena = string[30];
    rango = 1..dimf;
    vecNotas = array[rango] of integer;
    alumno = record
        num: integer;
        apellido: cadena;
        nombres: cadena;
        email: cadena;
        ingreso: integer;
        egreso: integer;
        notas: vecNotas;
    end;
    lista = ^nodo;
    nodo = record
        dato: alumno;
        sig: lista;
    end;
procedure insertarVector(var vec: vecNotas; var diml: integer; num: integer);
var
    i, j: Integer;
begin
    i := 1;
    while (i <= diml) and (vec[i] > num) do
        i := i + 1;
    for j := diml downto i do
        vec[j + 1] := vec[j];
    vec[i] := num;
    diml := diml + 1;
end;
procedure leerNotas(var n: vecNotas);
var
    i: rango;
    nota, diml: integer;
begin
    diml:= 0;
    for i := 1 to dimf do begin
        writeln('Ingrese la nota de la materia ', i);
        readln(nota);
        insertarVector(n, diml, nota);
    end;
end;
procedure leerAlumno(var a: alumno);
begin
    writeln('Ingrese el numero de alumno');
    readln(a.num);
    if (a.num <> -1) then begin
        writeln('Ingrese el apellido');
        readln(a.apellido);
        writeln('Ingrese el nombre');
        readln(a.nombres);
        writeln('Ingrese el email');
        readln(a.email);
        writeln('Ingrese el año de ingreso');
        readln(a.ingreso);
        writeln('Ingrese el año de egreso');
        readln(a.egreso);
        writeln('Ingrese las notas');
        leerNotas(a.notas);
    end;
end;
procedure insertarOrdenado(var l: lista; a: alumno);
var
    ant, act, nue: lista;
begin
    new(nue);
    nue^.dato := a;
    act := l;
    ant := l;
    while (act <> nil) and (act^.dato.num < a.num) do begin
        ant := act;
        act := act^.sig;
    end;
    if (ant = act) then
        l := nue
    else
        ant^.sig := nue;
    nue^.sig := act;
end;
procedure cargarLista(var l: lista);
var 
    a: alumno;
begin
    leerAlumno(a);
    while (a.num <> -1) do begin
        insertarOrdenado(l, a);
        leerAlumno(a);
    end;
end;
function cumpleCondicion(num: integer): boolean;
var
    dig: integer;
    ok: boolean;
begin
    ok:= true;
    while (num <> 0) and (ok) do begin
        dig:= num mod 10;
        if (dig mod 2 = 0) then
            ok:= false;
        num:= num div 10;
    end;
    cumpleCondicion:= ok;
end;
procedure borrar(var l: lista);
var
    act, ant: lista;
    num: integer;
begin
    writeln('Ingrese el numero de alumno a borrar');
    readln(num);
    act:= l;
    while(act <> nil) and (act^.dato.num < num) do begin
        ant:= act;
        act:= act^.sig;
    end;
    if(act <> nil) and (act^.dato.num = num) then begin
        if(act = l) then
            l:= l^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
    end;
end;
procedure minimo(anios: integer; var min1, min2: integer; nom, ap, correo: string; var nom1, nom2, ap1, ap2, correo1, correo2: string);
begin
    if(anios < min1) then begin
        min2:= min1;
        min1:= anios;
        nom2:= nom1;
        nom1:= nom;
        ap2:= ap1;
        ap1:= ap;
        correo2:= correo1;
        correo1:= correo;
    end
    else
        if(anios < min2) then begin
            min2:= anios;
            nom2:= nom;
            ap2:= ap;
            correo2:= correo;
        end;
end;
procedure procesarLista(l: lista; var cant2012: integer; var ap1, ap2, nom1, nom2, correo1, correo2: string);
var
    min1, min2, notasTotal: integer;
    aux: lista;
    i: rango;
begin
    min1:= 9999;
    min2:= 9999;
    aux:= l;
    while (l<>nil) do
        begin
            notasTotal:= 0;
            for i:= 1 to dimf do
                notasTotal:= notasTotal + l^.dato.notas[i];
            if((l^.dato.ingreso = 2012) and (cumpleCondicion(l^.dato.num))) then
                cant2012:= cant2012 + 1;
            writeln('El promedio de notas del alumno ', l^.dato.num, ' es: ', (notasTotal / dimf):0:2);
            minimo(l^.dato.egreso - l^.dato.ingreso, min1, min2, l^.dato.nombres, l^.dato.apellido, l^.dato.email, nom1, nom2, ap1, ap2, correo1, correo2);
            l:= l^.sig;
        end;
    writeln('La cantidad de alumnos ingresantes en 2012 cuyo numero de alumno esta compuesto unicamente por digitos impares es: ', cant2012);
    writeln('Los dos alumnos que mas rapido se recibieron son: ', nom1, ' ', ap1, ' ', correo1, ' y ', nom2, ' ', ap2, ' ', correo2);
    borrar(aux);
end;
var
    l: lista;
    cant2012: integer;
    ap1, ap2, nom1, nom2, correo1, correo2: string;
begin
    l:= nil;
    cant2012:= 0;
    cargarLista(l);
    procesarLista(l, cant2012, ap1, ap2, nom1, nom2, correo1, correo2);
end.