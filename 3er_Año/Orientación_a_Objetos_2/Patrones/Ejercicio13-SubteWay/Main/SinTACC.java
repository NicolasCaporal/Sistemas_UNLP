package io.github.unlp;

public class SinTACC extends Sanguchero {

    @Override
    public void hacerPan() {
        this.getSanguchito().setPan(150); // pan de chipa
    }

    @Override
    public void hacerPrincipal() {
        this.getSanguchito().setPrincipal(250); // carne de pollo
    }

    @Override
    public void hacerAdicional() {
        this.getSanguchito().setAdicional(200); // verduras grilladas
    }

    @Override
    public void hacerAderezo() {
        this.getSanguchito().setAderezo(18); // salsa tártara
    }
}
