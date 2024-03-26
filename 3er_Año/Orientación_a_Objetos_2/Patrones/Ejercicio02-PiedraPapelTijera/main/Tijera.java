package ar.edu.info.unlp.ejercicio02;

public class Tijera implements Jugada{

    public String jugarContra(Jugada jugada) {
        return jugada.jugarContraTijera();
    }

    public String jugarContraPiedra() {
        return "Gana Piedra";
    }

    public String jugarContraPapel(){
        return "Gana Tijera";
    }

    public String jugarContraTijera() {
        return "Empate";
    }

    public String jugarContraLagarto(){
        return "Gana Tijera";
    }

    public String jugarContraSpock(){
        return "Gana Spock";
    }
}