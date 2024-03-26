package ar.edu.info.unlp.ejercicio01;

import java.util.List;
import java.util.ArrayList;

public class Usuario {
    private String screenName;
    private List<Publicacion> publicaciones;

    public Usuario(String screenName){
        this.screenName = screenName;
        this.publicaciones = new ArrayList<Publicacion>();
    }

    public String getScreenName(){
        return this.screenName;
    }

    public boolean publicarTweet(String texto){
        if ((texto.length() <= 280) && (!texto.isEmpty())){
            this.publicaciones.add(new Tweet(texto));
            return true;
        }
        return false;
    }

    public void retwittear(Tweet origen){
        this.publicaciones.add(new Retweet(origen));
    }

    public void borrarTweets(){
        this.publicaciones = new ArrayList<Publicacion>();
    }
    // Se pierde la referencia a la lista anterior, y por tanto a los tweets anteriores,
    // así que el GarbageCollector de Java los va a fletar :)
    // Como el enunciado tampoco dice nada de que los retweets de otros usuarios no pueden
    // hay que borrarlos si se borra el original, no hay que encargarse de eso (gracia' a Dio')

    public List<Publicacion> getPublicaciones(){
        return this.publicaciones;
    }

}
