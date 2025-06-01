package io.github.unlp;

public abstract class Sanguchero {

    private Sanguchito sanguche;

    public Sanguchero(){
        this.sanguche = new Sanguchito();
    }

    public abstract void hacerPan();

    public abstract void hacerPrincipal();

    public abstract void hacerAdicional();

    public abstract void hacerAderezo();

    public void reset(){
        this.sanguche = new Sanguchito();
    }

    public Sanguchito getSanguchito(){
        return this.sanguche;
    }

}
