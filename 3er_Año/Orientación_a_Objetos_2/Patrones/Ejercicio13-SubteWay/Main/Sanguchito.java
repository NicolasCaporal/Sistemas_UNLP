package io.github.unlp;

public class Sanguchito {

    private double pan;
    private double principal;
    private double adicional;
    private double aderezo;

    public Sanguchito(){}

    public void setPan(double pan) {
        this.pan = pan;
    }

    public void setPrincipal(double principal) {
        this.principal = principal;
    }

    public void setAdicional(double adicional) {
        this.adicional = adicional;
    }

    public void setAderezo(double aderezo) {
        this.aderezo = aderezo;
    }

    public double getPrecio(){
        return this.pan + this.adicional + this.principal + this.aderezo;
    }

}
