{ 13. Suponga que usted es administrador de un servidor de correo electrónico. En los logs
del mismo (información guardada acerca de los movimientos que ocurren en el server) que
se encuentra en la siguiente ruta: /var/log/logmail.dat se guarda la siguiente información:
nro_usuario, nombreUsuario, nombre, apellido, cantidadMailEnviados. Diariamente el
servidor de correo genera un archivo con la siguiente información: nro_usuario,
cuentaDestino, cuerpoMensaje. Este archivo representa todos los correos enviados por los
usuarios en un día determinado. Ambos archivos están ordenados por nro_usuario y se
sabe que un usuario puede enviar cero, uno o más mails por día.
a- Realice el procedimiento necesario para actualizar la información del log en
un día particular. Defina las estructuras de datos que utilice su procedimiento.

b- Genere un archivo de texto que contenga el siguiente informe dado un archivo
detalle de un día determinado:
nro_usuarioX…………..cantidadMensajesEnviados
………….
nro_usuarioX+n………..cantidadMensajesEnviados
Nota: tener en cuenta que en el listado deberán aparecer todos los usuarios que
existen en el sistema. }

program ejercicio13_practica2;

type 
    log = record
        nroUsuario: integer;
        nombreUsuario: string;
        nombre: string;
        apellido: string;
        cantidadMailEnviados: integer;
    end;

    logs = file of log;

    mail = record
        nroUsuario: integer;
        cuentaDestino: integer;
        cuerpoMensaje: string;
    end;

    archivo = file of mail;



procedure actualizarLogs (var aLogs: logs; var aInfoDia: archivo);
var 
    mailActual: mail;
    usuarioActual: integer;
    logActual: log;

begin
    reset(aLogs);
    reset(aInfoDia);

    leerDetalle(aInfoDia, mailActual);

    while (mailActual.nroUsuario <> valorEspecial) do 
    begin

        read(aLogs, logActual);
        while (mailActual.nroUsuario <> logActual.nroUsuario) do 
        begin
            read(aLogs, logActual);
        end;
        seek(aLogs, filePos(aLogs) -1);

        usuarioActual := mailActual.nroUsuario;
        while (usuarioActual = mailActual.nroUsuario) do 
        begin
            logActual.cantidadMailEnviados := logActual.cantidadMailEnviados + 1;
            leerDetalle(mailActual); 
        end;

        write(aLogs, logActual);

    end;

    close(aLogs);
    close(aInfoDia);
end;

procedure generarTxt (var a: archivo);
var 
    m: mail;
    usuarioActual: integer;
    cant: integer;
    archivoTexto: text;

begin
    assign(archivoTexto, 'informe.txt');
    rewrite(archivoTexto);

    reset(a);
    

    leerDetalle(a, m);
    while (m.nroUsuario <> valorEspecial) do 
    begin

        cant := 0;
        usuarioActual := m.nroUsuario;

        while (usuarioActual = m.nroUsuario) do
        begin
            cant := cant + 1;
            leerDetalle(a, m);
        end;

        writeln(archivoTexto, 'Nro Usuario ', usuarioActual, ' Cantidad mensajes enviados: ', cant);

    end;

    close(a);
    close(archivoTexto);
end;

{ Programa Principal }
var 
    archivoLogs: logs;
    
begin 

    assign(archivoLogs, 'logmail.dat');
    assign(archivoDiaN, 'dia.dat');

    actualizarLogs(archivoLogs, archivoDiaN);

    writeln('Termino');
end. 