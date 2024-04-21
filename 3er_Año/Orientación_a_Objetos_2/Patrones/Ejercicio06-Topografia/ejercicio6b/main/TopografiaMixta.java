package ar.edu.info.unlp.ejercicio06;

import java.util.ArrayList;

public class TopografiaMixta implements Topografia {
    
    private ArrayList<Topografia> partes;

    public TopografiaMixta(Topografia t1, Topografia t2, Topografia t3, Topografia t4){
        this.partes = new ArrayList<Topografia>();
        this.partes.add(t1);
        this.partes.add(t2);
        this.partes.add(t3);
        this.partes.add(t4);
    }

    public double proporcionAgua() {
        return partes.stream().mapToDouble(parte -> parte.proporcionAgua()).sum()/4;
    }

    public double proporcionTierra() {
        return partes.stream().mapToDouble(parte -> parte.proporcionTierra()).sum()/4;
    }

    public boolean equals(Topografia otraTopografia) {
        return otraTopografia.igualMixta(this);
    }

    public boolean igualAgua() {
        return false;
    }

    public boolean igualTierra() {
        return false;
    }

    public boolean igualPantano(){
        return false;
    }

    public boolean igualMixta(TopografiaMixta otraTopografia) {
        return this.partes.equals(otraTopografia.getPartes());
    }

    public ArrayList<Topografia> getPartes(){
        return this.partes;
    }
}
