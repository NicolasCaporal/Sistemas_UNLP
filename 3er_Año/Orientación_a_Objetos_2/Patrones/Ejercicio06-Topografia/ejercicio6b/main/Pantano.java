package ar.edu.info.unlp.ejercicio06;

public class Pantano implements Topografia {

    public double proporcionAgua(){
        return 0.7;
    }

    public double proporcionTierra(){
        return 0.3;
    }

    public boolean equals(Topografia otraTopografia){
        return otraTopografia.igualPantano();
    }

    public boolean igualAgua(){
        return false;
    }

    public boolean igualTierra(){
        return false;
    }

    public boolean igualPantano(){
        return true;
    }

    public boolean igualMixta(TopografiaMixta otraTopografia){
        return false;
    }
}
