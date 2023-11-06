{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program ej11;
const
    cantFotos=200;
type
    fRango=1..cantFotos;
    str=string[50];

    publicacion=record
        titulo:str;
        autor:str;
        likes:integer;
        clics:integer;
        comentarios:integer;
    end;

    maxPublicacion=record
        maxTitulo:str;
        maxClics:integer;
    end;

    fotos=array [fRango] of publicacion;

procedure leerPublicacion(var p:publicacion);
begin
    writeln('Titulo: '); readln(p.titulo);
    writeln('Autor: '); readln(p.autor);
    writeln('Me gusta: '); readln(p.likes);
    writeln('Clics: '); readln(p.clics);
    writeln('Comentarios: '); readln(p.comentarios);
    writeln('.................');
end;

procedure leerFotos(var f:fotos);
var
    j:fRango;
begin
    for j:=1 to cantFotos do
        leerPublicacion(f[j]);
end;

procedure FotoMasVista(fTitulo:str; fClics:integer; var maxFoto:maxPublicacion);    //maxFoto inicializada en el programa
begin
    if(fClics>maxFoto.maxClics) then
    begin
        maxFoto.maxClics:=fClics;
        maxFoto.maxTitulo:=fTitulo;
    end;
end;

procedure CondicionLikes(fAutor:str; fLikes:integer; var cantLikes:integer);
begin
    if(fAutor='Art Vandelay') then
        cantLikes:=cantLikes+fLikes;
end;

var
    posts:fotos;
    maxPost:maxPublicacion;
    totalLikes, k:integer;
begin
    maxPost.maxClics:=-1;
    totalLikes:=0;

    leerFotos(posts);
    for k:=1 to cantFotos do
    begin
        FotoMasVista(posts[k].titulo, posts[k].clics, maxPost);
        CondicionLikes(posts[k].autor, posts[k].likes, totalLikes);

        writeln('La foto ', posts[k].titulo, ' del autor ', posts[k].autor, ' tiene ', posts[k].comentarios, ' comentarios.');
    end;
    
    writeln('...................');
    writeln('La foto ', maxPost.maxTitulo, ' tuvo un total de ', maxPost.maxClics, ' clics.');
    writeln('El fotografo Art Vandelay tuvo un total de ', totalLikes, ' likes.');
end.