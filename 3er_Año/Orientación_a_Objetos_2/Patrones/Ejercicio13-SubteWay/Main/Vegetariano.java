package io.github.unlp;

public class Vegetariano extends Sanguchero {

    @Override
    public void hacerPan() {
        this.getSanguchito().setPan(120); // pan con semillas
    }

    @Override
    public void hacerPrincipal() {
        this.getSanguchito().setPrincipal(200); // provoleta grillada
    }

    @Override
    public void hacerAdicional() {
        this.getSanguchito().setAdicional(100); // berenjenas al escabeche
    }

    @Override
    public void hacerAderezo() {
        this.getSanguchito().setAderezo(0); // sin aderezo
    }
}
