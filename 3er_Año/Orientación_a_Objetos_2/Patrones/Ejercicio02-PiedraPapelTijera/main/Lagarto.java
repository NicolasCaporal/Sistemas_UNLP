package ar.edu.info.unlp.ejercicio02;

public class Lagarto implements Jugada {
    public String jugarContra(Jugada jugada){
        return jugada.jugarContraLagarto();
    }

    public String jugarContraPiedra(){
        return "Gana Piedra";
    }

    public String jugarContraPapel(){
        return "Gana Lagarto";
    }

    public String jugarContraTijera(){
        return "Gana Tijera";
    }

    public String jugarContraLagarto() {
        return "Empate";
    }

    public String jugarContraSpock() {
        return "Gana Lagarto";
    }
}
