{ 6. Agregar al menú del programa del ejercicio 5, opciones para:
a. Añadir uno o más celulares al final del archivo con sus datos ingresados por
teclado.
b. Modificar el stock de un celular dado.
c. Exportar el contenido del archivo binario a un archivo de texto denominado:
”SinStock.txt”, con aquellos celulares que tengan stock 0. }

program ejercicio5;
type
    cellphone = record
        code: integer;
        minStock: integer;
        stock: integer;
        price: real;
        model: string[20];
        brand: string[20];
        description: string[50];
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
    writeln('5- Agregar celular/es');
    writeln('6- Modificar stock de un celular');
    writeln('7- Generar .txt de celulares sin stock');

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

function checkCode (code: integer; var binFile: cellphonesFile): boolean;
var 
    bool: boolean;
    c: cellphone;

begin
    bool := True;
    seek(binFile, 0);
    while (not EOF(binFile)) do 
    begin
        read(binFile, c);
        if (code = c.code) then 
            bool := False;
    end;

    checkCode := bool;
end;

procedure readCellphone (var c: cellphone; var binFile: cellphonesFile);
begin
    write('Code: '); readln(c.code);
    if (checkCode(c.code, binFile) and (c.code <> 0)) then
    begin
        write('Stock: '); readln(c.stock);
        write('MinStock: '); readln(c.minStock);
        write('Precio: '); readln(c.price);
        write('Modelo: '); readln(c.model);
        write('Marca: '); readln(c.brand);
        write('Descripcion: '); readln(c.description);
    end
    else if (c.code <> 0) then
    begin
        writeln('El celular con codigo ', c.code, ' ya estaba cargado');
        c.code := -1;
    end;
end;

procedure addCellphones();
var 
    binFile: cellphonesFile;
    c: cellphone;
begin 
    assign(binFile, 'cellphoneBin');
    reset(binFile);
    

    readCellphone(c, binFile);
    while (c.code <> 0) do 
    begin
        if (c.code <> -1) then 
            write(binFile, c);
        readCellphone(c, binFile);
    end;

    close(binFile);
    BinToText();
end;

procedure modifyStock ();
var 
    binFile: cellphonesFile;
    c: cellphone;
    code: integer;
begin
    assign(binFile, 'cellphoneBin');
    reset(binFile);


    write('Ingrese codigo de celular: ');
    readln(code);

    read(binFile, c);
    while (not EOF(binFile) and (code <> c.code)) do 
    begin
        read(binFile, c);
        write(c.code, ' ');
    end;

    if (code = c.code) then 
    begin
        PrintCellphone(c);
        seek(binFile, filePos(binFile)-1);
        write('Ingrese stock: ');
        readln(c.stock);
        write(binFile, c);
    end
    else 
        writeln('No se encontró el celular con codigo ', code);

    close(binFile);

end;

procedure withoutStock ();
var 
    binFile: cellphonesFile;
    c: cellphone;
    zeroStockTxt: text;
begin
    assign(binFile, 'cellphoneBin');
    assign(zeroStockTxt, 'SinStock.txt');

    reset(binFile);
    rewrite(zeroStockTxt);

    while (not EOF(binFile)) do 
    begin
        read(binFile, c);
        if (c.stock = 0) then 
            writeln(zeroStockTxt, c.code, ' ', c.minStock, ' ', c.stock, ' ', c.price, ' ', c.model, ' ', c.brand, ' ', c.description); 
    end;

    close(binFile);
    close(zeroStockTxt);
end;

begin
    case Menu() of
        1: TextToBin();
        2: PrintLowStock();
        3: Search();
        4: BinToText();
        5: addCellphones();
        6: modifyStock();
        7: withoutStock();
    end;
end.
