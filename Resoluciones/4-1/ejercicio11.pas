{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program ejercicio11;
const
	dimf = 3;
type
	subFoto = 1..dimf;
	foto = record
		titulo: string;
		autor: string;
		cantMG: integer;
		cantClics: integer;
		cantComentarios: integer;
	end;
	vecFotos = array [subFoto] of foto;
procedure leerFoto(var f: foto);
begin
	writeln('Ingrese el titulo de la foto');
	readln(f.titulo);
	writeln('Ingrese el autor de la foto');
	readln(f.autor);
	writeln('Ingrese la cantidad de me gusta en la foto');
	readln(f.cantMG);
	writeln('Ingrese la cantidad de clics en la foto');
	readln(f.cantClics);
	writeln('Ingrese la cantidad de comentarios de usuarios en la foto');
	readln(f.cantComentarios);
end;
procedure cargarVector(var v: vecFotos);
var
	i: subFoto;
    f: foto;
begin
	for i:= 1 to dimf do
		begin
			leerFoto(f);
			v[i]:= f;
		end;
end;
procedure maximo(var max: integer; var tituloMax: string; cant: integer; titulo: string);
begin
	if(cant > max) then
		begin
			max:= cant;
			tituloMax:= titulo;
		end;
end;
procedure procesarVector(v: vecFotos; var tituloMax: string; var cantMGArt: integer);
var
	i: subFoto;
	max: integer;
begin
	max:= -1;
	for i:= 1 to dimf do
		begin
			maximo(max, tituloMax, v[i].cantClics, v[i].titulo);
			if(v[i].autor = 'Art Vandelay') then
				cantMGArt:= cantMGArt + v[i].cantMG;
			writeln('Para la foto ', i, ' la cantidad de comentarios recibidos fue: ', v[i].cantComentarios);
		end;
end;
var
	v: vecFotos;
	tituloMax: string;
	cantMGArt: integer;
begin
	cargarVector(v);
	cantMGArt:= 0;
	procesarVector(v, tituloMax, cantMGArt);
	writeln('El titulo de la foto mas vista es: ', tituloMax);
	writeln('La cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotografo Art Vandelay es: ', cantMGArt);
end.
