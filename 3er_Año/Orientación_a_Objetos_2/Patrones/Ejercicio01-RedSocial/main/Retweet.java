package ar.edu.info.unlp.ejercicio01;

public class Retweet implements Publicacion{
    private Tweet origen;

    public Retweet(Tweet origen){
        this.origen = origen;
    }

    public String getTexto(){
        return this.origen.getTexto();
    }
}
