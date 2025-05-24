package org.example;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PoliticaModerada implements Politica {
    @Override
    public double montoAReembolsar(double montoTotalPagado, LocalDate fechaLimite) {
        LocalDate fechaActual = LocalDate.now();
        double diasHastaLimite = ChronoUnit.DAYS.between(fechaActual, fechaLimite);

        if (diasHastaLimite >= 7) {
            return montoTotalPagado;
        } else if (diasHastaLimite >= 2) {
            return montoTotalPagado * 0.50;
        } else {
            return 0;
        }
    }
}

