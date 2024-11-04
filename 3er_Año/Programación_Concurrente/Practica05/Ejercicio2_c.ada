-- Practica 5 - Rendevouz
-- 2c.
-- Se quiere modelar el funcionamiento de un banco, al cual llegan clientes que deben realizar
-- un pago y retirar un comprobante. Existe un único empleado en el banco, el cual atiende de
-- acuerdo con el orden de llegada.
-- a) Implemente una solución donde los clientes llegan y se retiran sólo después de haber sido
-- atendidos.
-- b) Implemente una solución donde los clientes se retiran si esperan más de 10 minutos para realizar el pago
-- c) Implemente una solución donde los clientes se retiran si no son atendidos
inmediatamente.


procedure Ejercicio2c

Task Empleado is 
    entry atender(pago: Float IN, comprobante: String OUT);
end Empleado

Task type Cliente;

arrClientes : array (1 .. C) of Cliente;

Task Body Empleado is 
    loop
        accept atender(pago: Float IN, comprobante: String OUT) do 
            procesarPago(pago);
            comprobante := generarComprobante();
        end Atenedr;
    end loop;
End Empleado;

Task Body Cliente is 
    ValorAPagar: Integer;
    comprobante: String;
Begin 
    valorAPagar := randomFloat();
    select 
        Empleado.atender(valorAPagar, comprobante);
    else
        null
    end select;
End Cliente;

Begin
    null
End Ejercicio2c
