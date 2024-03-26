package ar.edu.info.unlp.ejercicio02;

public class Papel implements Jugada{

    public String jugarContra(Jugada jugada) {
        return jugada.jugarContraPapel();
    }

    public String jugarContraPiedra() {
        return "Gana Papel";
    }

    public String jugarContraPapel(){
        return "Empate";
    }

    public String jugarContraTijera() {
        return "Gana Tijera";
    }

    public String jugarContraLagarto(){
        return "Gana Lagarto";
    }

    public String jugarContraSpock(){
        return "Gana Papel";
    }
}