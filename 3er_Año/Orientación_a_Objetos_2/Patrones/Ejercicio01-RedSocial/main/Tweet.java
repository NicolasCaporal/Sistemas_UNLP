package ar.edu.info.unlp.ejercicio01;

public class Tweet implements Publicacion{
    private String texto;

    public Tweet(String texto){
        this.texto = texto;
    }

    public String getTexto(){
        return this.texto;
    }

}
