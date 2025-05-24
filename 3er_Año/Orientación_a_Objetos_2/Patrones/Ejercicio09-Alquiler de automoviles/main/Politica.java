package org.example;

import java.time.LocalDate;

public interface Politica {
    public double montoAReembolsar(double montoTotalPagado, LocalDate fecha);
}
