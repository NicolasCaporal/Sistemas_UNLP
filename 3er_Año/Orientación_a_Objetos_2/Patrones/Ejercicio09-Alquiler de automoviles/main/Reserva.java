package org.example;

import java.time.LocalDate;

public class Reserva {

    private Usuario conductor;
    private int cantidadDias;
    private LocalDate fecha;
    private AutoEnAlquiler auto;

    public double montoAPagar(){
        return this.auto.getPrecioPorDia() * this.cantidadDias;
    }

    public double montoAReembolsar(double montoTotalPagado){
        return this.auto.montoAReembolsar(this.montoAPagar(), this.fecha);
    }

}