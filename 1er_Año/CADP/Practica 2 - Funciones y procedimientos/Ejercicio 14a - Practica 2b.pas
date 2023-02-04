{ 14. a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona: 
    1 --> 6 toneladas por ha
    2 --> 2,6 toneladas por ha
    3 --> 1,4 toneladas por ha }

program Practica2b_Ejercicio14;
type
    zona = 1..3;

function rendimientoPorHa(cantHa: integer; tipoZona: zona; precio: real): real;
begin
    case (tipoZona) of
        1: rendimientoPorHa := cantHa * 6 * precio;
        2: rendimientoPorHa := cantHa * 2.6 * precio;
        3: rendimientoPorHa := cantHa * 1.4 * precio;
    end;
end;


begin
    {}
end.