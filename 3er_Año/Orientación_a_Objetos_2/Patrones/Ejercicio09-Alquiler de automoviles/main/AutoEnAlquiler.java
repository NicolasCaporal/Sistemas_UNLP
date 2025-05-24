package org.example;

import java.sql.Time;
import java.time.LocalDate;

// Rol: Context
public class AutoEnAlquiler {

    private double precioPorDia;
    private int cantPlazas;
    private String marca;
    private Politica politicaCancelacion;

    public double montoAReembolsar(double montoTotalPagado, LocalDate fecha){
        if (fecha.isAfter(LocalDate.now())){ return 0; }
        return this.politicaCancelacion.montoAReembolsar(montoTotalPagado, fecha);
    }

    public void setPolitica (Politica politica){
        this.politicaCancelacion = politica;
    }


}
