package ar.edu.info.unlp.ejercicio02;

import ar.edu.info.unlp.ejercicio02.Jugada;

public class Spock implements Jugada {
    public String jugarContra(Jugada jugada){
        return jugada.jugarContraSpock();
    }

    public String jugarContraPiedra(){
        return "Gana Spock";
    }

    public String jugarContraPapel(){
        return "Gana Papel";
    }

    public String jugarContraTijera(){
        return "Gana Spock";
    }

    public String jugarContraLagarto() {
        return "Gana Lagarto";
    }

    public String jugarContraSpock() {
        return "Empate";
    }
}
