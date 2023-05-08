{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay” //(Yo lo hice con Messi).
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program Practica4a_Ejercicio11;
const
    df = 10;
    
type
    publicacion = record
        Titulo: string;
        autor: string;
        mgs: integer;
        clics: integer;
        coments: integer;
    end;
    
    fotos = array [1..df] of publicacion;
    comentarios = array [1..df] of integer;
    
    
procedure leerDatos (var fotos: fotos); //Se podría modularizar el cargar una foto, y luego con eso cargar el vector
var 
    i: integer;
    
begin

    for i := 1 to df do
    begin
        writeln('Foto numero ', i);
        
        write('Titulo: ');
        readln(fotos[i].titulo);
        
        write('Autor: ');
        readln(fotos[i].autor);
        
        write('Cantidad de me gusta: ');
        readln(fotos[i].mgs);
        
        write('Cantidad de clics: ');
        readln(fotos[i].clics);
        
        write('Cantidad de comentarios: ');
        readln(fotos[i].coments);
        
        writeln();
    end;
    
end;

procedure masClics (fotos: fotos; var tituloMC: string);
var
    i: integer;
    nombreMax: string;
    cantCMax: integer;
    
begin
    cantCMax := -1;
    for i := 1 to df do
    begin
        if (fotos[i].clics > cantCMax) then
        begin
            cantCMax := fotos[i].clics;
            nombreMax := fotos[i].titulo;
        end;
    end;
    
    tituloMC := nombreMax;
end;
    
function mgsMessi (fotos: fotos): integer;
var
    i: integer;
    sumaMgs: integer;
    
begin
    sumaMgs := 0;
    
    for i := 1 to df do
    begin
        if (fotos[i].autor = 'Leo Messi') then
            sumaMgs := sumaMgs + fotos[i].mgs;
    end;
    
    mgsMessi := sumaMgs;
end;

procedure comentariosPorFoto (fotos: fotos; var comentarios: comentarios);
var
    i:integer;
    
begin
    for i := 1 to df do
    begin
        comentarios[i] := fotos[i].coments;
    end;
    
    for i := 1 to df do
    begin
        writeln('Foto ', i, ': ', comentarios[i], ' comentarios');
    end;
end;

//Programa Principal
var
    fotosP: fotos;
    comentariosP: comentarios;
    tituloMasClics: string;
    meGustasDeMessi: integer;
    
begin
    leerDatos(fotosP);
    
    writeln('------------------------------------ PROCESANDO DATOS ------------------------------------');
    masClics(fotosP, tituloMasClics);
    meGustasDeMessi := mgsMessi(fotosP);

    
    writeln();
    writeln('La foto más vista fue ', tituloMasClics);
    writeln();
    writeln('El autor Leo Messi, recibió una cantidad total de Me Gustas de ', meGustasDeMessi);
    writeln();
    writeln('Los comentarios recibidos, de cada publicación es la siguiente: ');
    comentariosPorFoto(fotosP, comentariosP);
end.
