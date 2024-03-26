package ar.edu.info.unlp.ejercicio02;

public interface Jugada {

    String jugarContra(Jugada jugada);

    String jugarContraPiedra();

    String jugarContraPapel();

    String jugarContraTijera();

    String jugarContraLagarto();

    String jugarContraSpock();
}
