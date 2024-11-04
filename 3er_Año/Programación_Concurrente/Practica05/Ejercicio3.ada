-- Practica 5 - Rendevouz
-- 3.
-- Se dispone de un sistema compuesto por 1 central y 2 procesos periféricos, que se
-- comunican continuamente. Se requiere modelar su funcionamiento considerando las
-- siguientes condiciones:
-- * La central siempre comienza su ejecución tomando una señal del proceso 1; luego
-- toma aleatoriamente señales de cualquiera de los dos indefinidamente. Al recibir una
-- señal de proceso 2, recibe señales del mismo proceso durante 3 minutos.
-- * Los procesos periféricos envían señales continuamente a la central. La señal del
-- proceso 1 será considerada vieja (se deshecha) si en 2 minutos no fue recibida. Si la
-- señal del proceso 2 no puede ser recibida inmediatamente, entonces espera 1 minuto y
-- vuelve a mandarla (no se deshecha).

procedure Ejercicio3

Task Central is 
    entry signal1();
    entry signal2();
    entry finTimer();
End central;

Task timer is 
    entry iniciar();
End timer;

Task proceso1;
Task proceso2;

Task Body timer is 
Begin 
    acept iniciar();
    delay(180); -- 3 mins 
    Central.finTimer();
End timer;


Task Body Central is 
    timer = True;
Begin 

    acept signal1() do 
        loop
            SELECT 
                accept signal1();
            OR
                accept signal2() do 

                    timer.iniciar();
                    while timer loop
                        select 
                            acept finTimer(); do 
                                timer = False; 
                            end finTimer();

                        or 
                            when (finTimer'count == 0) => acept signal2();

                    end loop;
                end signal2;

            END SELECT
        end loop;
    end signal1;

end Central;


-- La señal del proceso 1 será considerada vieja (se deshecha) si en 2 minutos no fue recibida.
Task Body proceso1 is 
Begin 
    loop 
        select 
            Central.signal1();
        or delay 120 -- 2 mins 
            null
        end select; 
    end loop;
end proceso1;

-- Si la señal del proceso 2 no puede ser recibida inmediatamente, entonces espera 1 minuto y vuelve a mandarla (no se deshecha).
Task Body proceso2 is 
Begin 
    loop 
        select 
            Central.signal1();
        else:
            delay 60; -- 1 min
    end loop;
end proceso2;

begin 
    null 
End Ejercicio3