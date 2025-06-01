package io.github.unlp;

public class Chef {

    private Sanguchero ayudanteSanguchero;

    public Chef (Sanguchero ayudanteSanguchero){
        this.ayudanteSanguchero = ayudanteSanguchero;
    }

    public void setSanguchero(Sanguchero builder) {
        this.ayudanteSanguchero = builder;
    }

    public Sanguchito hacerSanguche(){
        this.ayudanteSanguchero.hacerPan();
        this.ayudanteSanguchero.hacerPrincipal();
        this.ayudanteSanguchero.hacerAdicional();
        this.ayudanteSanguchero.hacerAderezo();
        return this.ayudanteSanguchero.getSanguchito();
    }

}