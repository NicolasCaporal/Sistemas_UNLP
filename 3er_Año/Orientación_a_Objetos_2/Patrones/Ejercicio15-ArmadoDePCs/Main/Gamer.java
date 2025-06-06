package io.github.unlp;

public class Gamer extends Configuracion {

    @Override
    public void setCPU() {
        this.getPc().addComponente(catalogo.getComponente("Procesador Gamer"));
        this.getPc().addComponente(catalogo.getComponente("Pad termico"));
        this.getPc().addComponente(catalogo.getComponente("Cooler"));
    }

    @Override
    public void setRAM() {
        this.getPc().addComponente(catalogo.getComponente("32 GB"));
        this.getPc().addComponente(catalogo.getComponente("32 GB"));
    }

    @Override
    public void setDisco() {
        this.getPc().addComponente(catalogo.getComponente("SSD 500 GB"));
        this.getPc().addComponente(catalogo.getComponente("SSD 1 TB"));
    }

    @Override
    public void setGrafica() {
        this.getPc().addComponente(catalogo.getComponente("RTX 4090"));
    }

    @Override
    public void setGabinete() {
        this.getPc().addComponente(catalogo.getComponente("Gabinete Gamer"));
    }
}
