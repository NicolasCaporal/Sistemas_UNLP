{ 7. Realizar un programa que permita:
a. Crear un archivo binario a partir de la información almacenada en un archivo de texto.
El nombre del archivo de texto es: “novelas.txt”
b. Abrir el archivo binario y permitir la actualización del mismo. Se debe poder agregar
una novela y modificar una existente. Las búsquedas se realizan por código de novela }

program ejercicio7_practica1;

type 
    novela = record
        code: integer;
        nombre: string;
        genero: string;
        precio: real;
    end;

    archivoNovelas = file of novela;


function opciones(): integer;
var 
    num: integer;

begin

    writeln('ELIJA UNA OPCION: ');
    writeln('1. Exportar txt a binario');
    writeln('2. Actualizar archivo binario');
    writeln('3. Cancelar');
    write('Ingrese un numero: ');
    readln(num);
    opciones := num;
    writeln;

end;


procedure  crearArchivo();
var 
    archivoBin: archivoNovelas;
    archivoTxt: text;
    n: novela;

begin

    assign(archivoBin, 'novelas.dat');
    rewrite(archivoBin);
    assign(archivoTxt, 'novelas.txt');
    reset(archivoTxt);

    while (not EOF(archivoTxt)) do
    begin
        readln(archivoTxt, n.code, n.precio, n.genero);
        readln(archivoTxt, n.nombre);

        write(archivoBin, n);
    end;

    close(archivoBin);
    close(archivoTxt);

end;


procedure imprimirNovela (n: novela);
begin
    writeln('Codigo: ', n.code, ' Precio: ', n.precio:2:2, ' Genero: ', n.genero, ' Nombre: ', n.nombre);
end;

procedure leerNovela(var n: novela);
begin
    write('Nombre: '); readln(n.nombre);
    write('Genero: '); readln(n.genero);
    write('Codigo: '); readln(n.code);
    write('Precio: '); readln(n.precio);
end;


{procedure imprimirArchivoBinario (var archivoBin: archivoNovelas);
var
  n: novela;

begin

    assign(archivoBin, 'novelas.dat');
    reset(archivoBin);

    while not eof(archivoBin) do
    begin
        read(archivoBin, n);
        imprimirNovela(n);
    end;

    close(archivoBin);

end;}


procedure cambiarDatos (var n: novela);
var 
    aux: novela;

begin 

    writeln('Ingrese los datos para actualizarlo. Si desea no realizar cambios, ingrese 0');
    leerNovela(aux);

    if (aux.nombre <> '0') then 
        n.nombre := aux.nombre;
    if (aux.genero <> '0') then 
        n.genero := aux.genero;
    if (aux.code <> 0) then 
        n.code := aux.code;
    if (aux.precio <> 0) then 
        n.precio := aux.precio;

end;


procedure modificarNovela();
var 
    archivoBin: archivoNovelas;
    code: integer;
    n: novela;

begin

    write('Ingrese codigo de la novela: ');
    readln(code);

    assign(archivoBin, 'novelas.dat');
    reset(archivoBin);

    read(archivoBin, n);
    while ((not EOF(archivoBin)) and (code <> n.code)) do 
    begin
        read(archivoBin, n);
    end;

    if (code = n.code) then 
    begin
        imprimirNovela(n);
        cambiarDatos(n);
        seek(archivoBin, filePos(archivoBin)-1);
        write(archivoBin, n)
    end
    else 
        writeln('La pelicula con codigo ', code, ' no fue encontrada');
    close(archivoBin);

    //imprimirArchivoBinario(archivoBin);

end;


procedure agregarNovela();
var 
    archivoBin: archivoNovelas;
    n: novela;

begin

    assign(archivoBin, 'novelas.dat');
    reset(archivoBin);

    leerNovela(n);
    seek(archivoBin, fileSize(archivoBin));
    write(archivoBin, n);

    close(archivoBin);

    //imprimirArchivoBinario(archivoBin);

end;


procedure actualizarArchivo ();
var 
    opcion: integer;

begin

    writeln('1. Modificar información de una novela');
    writeln('2. Agregar nueva novela');
    writeln('3. Cancelar');
    write('Ingrese un numero: ');
    readln(opcion);
    writeln;

    case opcion of 
        1: modificarNovela();
        2: agregarNovela();
        3: writeln;
    end;

end;



{ Programa principal }
begin

    case opciones() of
        1: crearArchivo();
        2: actualizarArchivo();
        3: writeln;
    end;

end.