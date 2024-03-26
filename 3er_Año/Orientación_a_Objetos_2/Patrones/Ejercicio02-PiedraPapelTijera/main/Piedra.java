package ar.edu.info.unlp.ejercicio02;

public class Piedra implements Jugada {

    public String jugarContra(Jugada jugada) {
        return jugada.jugarContraPiedra();
    }

    public String jugarContraPiedra() {
        return "Empate";
    }

    public String jugarContraPapel() {
        return "Gana Papel";
    }

    public String jugarContraTijera() {
        return "Gana Piedra";
    }

    public String jugarContraLagarto(){
        return "Gana Piedra";
    }

    public String jugarContraSpock(){
        return "Gana Spock";
    }
}