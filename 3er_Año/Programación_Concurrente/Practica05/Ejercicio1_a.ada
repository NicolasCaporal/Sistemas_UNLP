-- Practica 5 - Rendevouz
-- 1a.
-- Se requiere modelar un puente de un único sentido que soporta hasta 5 unidades de peso.
-- El peso de los vehículos depende del tipo: cada auto pesa 1 unidad, cada camioneta pesa 2
-- unidades y cada camión 3 unidades. Suponga que hay una cantidad innumerable de
-- vehículos (A autos, B camionetas y C camiones). Analice el problema y defina qué tareas,
-- recursos y sincronizaciones serán necesarios/convenientes para resolverlo.
-- a. Realice la solución suponiendo que todos los vehículos tienen la misma prioridad

Procedure Ejercicio1_a is

Task Puente is 
    entry IngresarAuto();
    entry IngresarCamioneta();
    entry IngresarCamion();
    entry Salir(peso:IN int);
end Puente

Task type Auto;
Task type Camioneta;
Task type Camion;

arrAutos : array (1..A) of Auto;
arrCamionetas: array (1..B) of Camioneta;
arrCamions: array (1..C) of Camion;

Task Body Puente is
    pesoActual: Integer

Begin
    pesoActual = 0;
    loop
        SELECT
            accept Salir(peso:IN int) do
                pesoActual -= peso
            end Salir
        OR
            when (pesoActual <= 4) =>
                accept IngresarAuto() do
                    pesoActual += 1
                end IngresarAuto
        OR
            when (pesoActual <= 3) =>
                accept IngresarCamioneta() do
                    pesoActual += 2
                end IngresarCamioneta
        OR
            when (pesoActual <= 2) =>
                accept IngresarCamion() do
                    pesoActual += 3
                end IngresarCamion
        END SELECT
    end loop
End Puente


Task Body Auto
Begin
    Puente.IngresarAuto()
    // Pasa el puente
    Puente.Salir(1)
End Auto

Task Body Camioneta
Begin
    Puente.IngresarCamioneta()
    // Pasa el puente
    Puente.Salir(2)
End Auto

Task Body Camion
Begin
    Puente.IngresarCamion()
    // Pasa el puente
    Puente.Salir(3)
End Auto

Begin
    null
End Ejercicio1_a
