{ 5. Realizar un programa para una tienda de celulares, que presente un menú con
opciones para:
a. Crear un archivo de registros no ordenados de celulares y cargarlo con datos
ingresados desde un archivo de texto denominado “celulares.txt”. Los registros
correspondientes a los celulares, deben contener: código de celular, el nombre,
descripción, marca, precio, stock mínimo y el stock disponible.
b. Listar en pantalla los datos de aquellos celulares que tengan un stock menor al
stock mínimo.
c. Listar en pantalla los celulares del archivo cuya descripción contenga una
cadena de caracteres proporcionada por el usuario.
d. Exportar el archivo creado en el inciso a) a un archivo de texto denominado
“celulares.txt” con todos los celulares del mismo. El archivo de texto generado
podría ser utilizado en un futuro como archivo de carga (ver inciso a), por lo que
debería respetar el formato dado para este tipo de archivos en la NOTA 2. }

program ejercicio5;
type
    cellphone = record
        code: integer;
        minStock: integer;
        stock: integer;
        price: real;
        model: string[20];
        brand: string[20];
        description: string[20];
    end;

    cellphonesFile = file of cellphone;

function Menu(): integer;
var
    option: integer;
begin
    writeln('Elige una opcion');
    writeln('1- Texto a bin');
    writeln('2- Imprimir en pantalla poco stock');
    writeln('3- Buscar por descripcion');
    writeln('4- Bin a texto');

    readln(option);

    Menu:= option;
end;

procedure ReadTextReg(var textFile: text; var c: cellphone);
begin
    readln(textFile, c.code, c.minStock, c.stock, c.price, c.model);
    readln(textFile, c.brand);
    readln(textFile, c.description);
end;

procedure PrintCellphone(c: cellphone);
begin
    writeln('Code: ', c.code);
    writeln('Stock: ', c.stock, ' (', c.stock, '/', c.minStock, ')');
    writeln('Price: ', c.price);
    writeln('Cellphone: ', c.model, ' ', c.brand, ': ', c.description);
    writeln;
    writeln('_________________________________________');
    writeln;
end;

procedure TextToBin();
var
    binFile: cellphonesFile;
    textFile: Text;
    c: cellphone;
begin
    assign(binFile, 'cellphoneBin');
    assign(textFile, 'celulares.txt');

    rewrite(binFile);
    reset(textFile);

    while (not eof(textFile)) do
    begin
        ReadTextReg(textFile, c);

        write(binFile, c);
    end;
    close(binFile);
    close(textFile);
end;

procedure PrintLowStock();
var
    textFile: text;
    c: cellphone;
begin
    assign(textFile, 'celulares.txt');
    reset(textFile);

    while (not eof(textFile)) do
    begin
        ReadTextReg(textFile, c);
        if (c.stock < c.minStock) then
            PrintCellphone(c);
    end;
    close(textFile);
end;

procedure BinToText();
var
    textFile: text;
    binFile: cellphonesFile;
    c: cellphone;
begin
    assign(binFile, 'cellphoneBin');
    assign(textFile, 'celulares2.txt');

    rewrite(textFile);
    reset(binFile);

    while (not eof(binFile)) do
    begin
        read(binFile, c);
        writeln(textFile, c.code, ' ', c.minStock, ' ',  c.stock, ' ',  c.price:2:2, ' ',  c.model);
        writeln(textFile, c.brand);
        writeln(textFile, c.description);
    end;
    close(binFile);
    close(textFile);
end;

procedure Search();
var 
    binFile: cellphonesFile;
    c: cellphone;
    input: string; 
begin
    write('Ingrese cadena a buscar: ');
    readln(input);

    assign(binFile, 'cellphoneBin');
    Reset(binFile);

    while not Eof(binFile) do
    begin
        Read(binFile, c);
        if Pos(input, c.description) > 0 then
            PrintCellphone(c)
    end;

    Close(binFile);
end;

begin
    case Menu() of
        1: TextToBin();
        2: PrintLowStock();
        3: Search();
        4: BinToText();
    end;
end.
