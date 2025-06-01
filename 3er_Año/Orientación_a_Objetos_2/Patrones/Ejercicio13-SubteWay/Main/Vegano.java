package io.github.unlp;

public class Vegano extends Sanguchero {

    @Override
    public void hacerPan() {
        this.getSanguchito().setPan(100); // pan integral
    }

    @Override
    public void hacerPrincipal() {
        this.getSanguchito().setPrincipal(500); // milanesa de girgolas
    }

    @Override
    public void hacerAdicional() {
        this.getSanguchito().setAdicional(0); // sin adicional
    }

    @Override
    public void hacerAderezo() {
        this.getSanguchito().setAderezo(20); // salsa criolla
    }
}
