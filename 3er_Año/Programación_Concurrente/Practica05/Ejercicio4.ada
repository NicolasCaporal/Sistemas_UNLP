-- Practica 5 - Rendevouz
-- 4.
-- En una clínica existe un médico de guardia que recibe continuamente peticiones de
-- atención de las E enfermeras que trabajan en su piso y de las P personas que llegan a la
-- clínica ser atendidos.
-- Cuando una persona necesita que la atiendan espera a lo sumo 5 minutos a que el médico lo
-- haga, si pasado ese tiempo no lo hace, espera 10 minutos y vuelve a requerir la atención del
-- médico. Si no es atendida tres veces, se enoja y se retira de la clínica.
-- Cuando una enfermera requiere la atención del médico, si este no lo atiende inmediatamente
-- le hace una nota y se la deja en el consultorio para que esta resuelva su pedido en el
-- momento que pueda (el pedido puede ser que el médico le firme algún papel). Cuando la
-- petición ha sido recibida por el médico o la nota ha sido dejada en el escritorio, continúa
-- trabajando y haciendo más peticiones.
-- El médico atiende los pedidos dándole prioridad a los enfermos que llegan para ser atendidos.
-- Cuando atiende un pedido, recibe la solicitud y la procesa durante un cierto tiempo. Cuando
-- está libre aprovecha a procesar las notas dejadas por las enfermeras.

procedure ejercicio4 

Task Medico is 
    entry atenderPersona(consulta: String IN);
    entry atenderEnfermera(consulta: String IN);
end medico;

Task Enfermera;
Type Task Paciente;

arrEnfermeras: array (1 .. E) of Enfermera;
arrPacientes: array (1 .. P) of Pacientes;

Task escritorio is 
    entry dejarNota(nota: IN String);
    entry tomarNota(nota: OUT String);
end escritorio;

-- Cuando una persona necesita que la atiendan espera a lo sumo 5 minutos a que el médico lo
-- haga, si pasado ese tiempo no lo hace, espera 10 minutos y vuelve a requerir la atención del
-- médico. Si no es atendida tres veces, se enoja y se retira de la clínica.
Task Body Paciente is 
    consulta: String;
    cantIntentos: Integer;

begin 
    cantIntentos := 0;
    consulta = generarConsulta();
    while (cantIntentos < 3) lopp
        select
            Medico.atenderPersona(consulta);
        or delay 300
            cantIntentos += 1;
            delay(600);
    end loop;
end Paciente;


-- Cuando una enfermera requiere la atención del médico, si este no lo atiende inmediatamente
-- le hace una nota y se la deja en el consultorio para que esta resuelva su pedido en el
-- momento que pueda (el pedido puede ser que el médico le firme algún papel). Cuando la
-- petición ha sido recibida por el médico o la nota ha sido dejada en el escritorio, continúa
-- trabajando y haciendo más peticiones.
Task Body Enfermera is 
    consulta: String;
    nota: String;
begin 
    consulta = generarConsulta();
    loop 
        consulta = generarConsulta();
        select 
            Medico.atenderEnfermera(consulta);
        else:
            nota = generarNota(consulta);
            Escritorio.dejarNota(nota);
    end loop;
end Enfermera;

-- El médico atiende los pedidos dándole prioridad a los enfermos que llegan para ser atendidos.
-- Cuando atiende un pedido, recibe la solicitud y la procesa durante un cierto tiempo. Cuando
-- está libre aprovecha a procesar las notas dejadas por las enfermeras.
Task Body Medico is 
    nota: String;
    consulta: String;
begin 

    loop
        select 
            acept atenderPersona(consulta: IN String);
            // procesa la consulta
        or 
            where (atenderPersona´count == 0) => acept atenderEnfermera(consulta: IN String);
            // procesa la consulta
        else: 
            Escritorio.tomarNota(nota: IN String); 
            // procesa la nota
    end loop;

end Medico;

Task Body Escritorio is 
    notas: queue;
    nota: String;
begin 
    loop 
        select
            acept dejarNota(nota: IN String) is 
                nota := nota;
            end;
            notas.push(nota);
            
        or where (queue.lenght > 0) => acept tomarNota(nota: OUT nota);
            notas.pop();
    end loop;
end escritorio;

begin 
    null;
end ejercicio4;