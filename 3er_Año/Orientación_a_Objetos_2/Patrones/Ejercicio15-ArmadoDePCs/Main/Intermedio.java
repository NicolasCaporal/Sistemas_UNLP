package io.github.unlp;

public class Intermedio extends Configuracion {

    @Override
    public void setCPU() {
        this.getPc().addComponente(catalogo.getComponente("Procesador Intermedio"));
    }

    @Override
    public void setRAM() {
        this.getPc().addComponente(catalogo.getComponente("16 GB"));
    }

    @Override
    public void setDisco() {
        this.getPc().addComponente(catalogo.getComponente("SSD 500 GB"));
    }

    @Override
    public void setGrafica() {
        this.getPc().addComponente(catalogo.getComponente("GTX 1650"));
    }

    @Override
    public void setGabinete() {
        this.getPc().addComponente(catalogo.getComponente("Gabinete Intermedio"));
    }
}
