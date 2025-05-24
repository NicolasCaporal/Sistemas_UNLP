package org.example;

import java.time.LocalDate;

public class PoliticaFlexible implements Politica {

    @Override
    public double montoAReembolsar(double montoTotalPagado, LocalDate fecha) {
        return montoTotalPagado;
    }
}
