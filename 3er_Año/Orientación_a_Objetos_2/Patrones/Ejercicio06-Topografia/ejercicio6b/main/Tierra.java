package ar.edu.info.unlp.ejercicio06;

public class Tierra implements Topografia {

    public double proporcionAgua(){
        return 0;
    }

    public double proporcionTierra(){
        return 1;
    }

    public boolean equals(Topografia otraTopografia){
        return otraTopografia.igualTierra();
    }

    public boolean igualAgua(){
        return false;
    }

    public boolean igualTierra(){
        return true;
    }

    public boolean igualPantano(){
        return false;
    }

    public boolean igualMixta(TopografiaMixta otraTopografia){
        return false;
    }
}
