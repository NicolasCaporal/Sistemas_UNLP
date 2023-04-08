program textToBinDetalle;
type 
    aprobacion = record
        codigo: integer;
        estado: integer; // 0 = cursada desaprobada | 1 = Cursada aprobada | 2 = Final aprobado
    end;

    archivo = file of aprobacion;

var 
    logicoB: archivo;

    logicoT: text;
    fisicoT: string;

    r: aprobacion;

    textCheck: text;
begin
    write('Ingrese nombre de archivo txt en memoria: ');
    readln(fisicoT);
    assign(logicoT, fisicoT);
    reset(logicoT);

    assign(logicoB, 'notas.dat');
    rewrite(logicoB);

    //Actualizo el binario
    while (not EOF(logicoT)) do 
    begin
        readln(logicoT, r.codigo, r.estado);
        write(logicoB, r);
    end;

    close(logicoT);

    //Genero un txt para chequear que el nuevo binario este bien
    seek(logicoB, 0);

    assign(textCheck, 'checkTxtNotas.txt');
    rewrite(textCheck);
    while(not EOF(logicoB)) do 
    begin
        read(logicoB, r);
        writeln(textCheck, r.codigo, ' ', r.estado);
    end;

    close(logicoB);
    close(textCheck);
end.