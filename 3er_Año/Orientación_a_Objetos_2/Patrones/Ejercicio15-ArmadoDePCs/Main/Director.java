package io.github.unlp;

public class Director {

    private Configuracion configuracion;

    public Director (Configuracion configuracion){
        this.configuracion = configuracion;
    }

    public void setConfiguracion(Configuracion configuracion) {
        this.configuracion = configuracion;
    }

    public PC hacerPC(){
        this.configuracion.setCPU();
        this.configuracion.setRAM();
        this.configuracion.setDisco();
        this.configuracion.setGrafica();
        this.configuracion.setGabinete();
        return this.configuracion.getPc();
    }
}
