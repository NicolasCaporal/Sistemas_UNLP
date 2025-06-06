package io.github.unlp;

public class Basico extends Configuracion {

    @Override
    public void setCPU() {
        this.getPc().addComponente(catalogo.getComponente("Procesador Básico"));
    }

    @Override
    public void setRAM() {
        this.getPc().addComponente(catalogo.getComponente("8 GB"));
    }

    @Override
    public void setDisco() {
        this.getPc().addComponente(catalogo.getComponente("HDD 500 GB"));
    }

    @Override
    public void setGrafica() {

    }

    @Override
    public void setGabinete() {
        this.getPc().addComponente(catalogo.getComponente("Gabinete Estándar"));
    }
}
