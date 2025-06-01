package io.github.unlp;

public class Clasico extends Sanguchero {

    @Override
    public void hacerPan() {
        this.getSanguchito().setPan(100); //pan brioche
    }

    @Override
    public void hacerPrincipal() {
        this.getSanguchito().setPrincipal(300); //carne de ternera
    }

    @Override
    public void hacerAdicional() {
        this.getSanguchito().setAdicional(80); //tomate
    }

    @Override
    public void hacerAderezo() {
        this.getSanguchito().setAderezo(20); //aderezo a base de mayo
    }
}
