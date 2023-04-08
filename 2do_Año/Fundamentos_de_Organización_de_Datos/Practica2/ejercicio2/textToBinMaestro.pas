program textToBinMaestro;
type 
    alumno = record 
        codigo: integer;
        apellido: String;
        nombre: String;
        cantCursadas: integer;
        cantFinales: integer; 
    end; 

    archivo = file of alumno;

var 
    logicoB: archivo;

    logicoT: text;
    fisicoT: string;

    r: alumno;

    textCheck: text;

begin
    write('Ingrese nombre de archivo txt en memoria: ');
    readln(fisicoT);
    assign(logicoT, fisicoT);
    reset(logicoT);

    assign(logicoB, 'alumnos.dat');
    rewrite(logicoB);

    //Actualizo el binario
    while (not EOF(logicoT)) do 
    begin
        readln(logicoT, r.codigo, r.cantCursadas, r.cantFinales, r.apellido);
        readln(logicoT, r.nombre);
        write(logicoB, r);
    end;

    close(logicoT);

    //Genero un txt para chequear que el nuevo binario este bien
    seek(logicoB, 0);

    assign(textCheck, 'checkTxtAlumnos.txt');
    rewrite(textCheck);
    while(not EOF(logicoB)) do 
    begin
        read(logicoB, r);
        writeln(textCheck, r.codigo, ' ', r.cantCursadas, ' ', r.cantFinales, ' ', r.apellido);
        writeln(textCheck, r.nombre);
    end;

    close(logicoB);
    close(textCheck);
end.