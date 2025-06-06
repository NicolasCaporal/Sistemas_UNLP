package io.github.unlp;

public abstract class Configuracion {
    private PC pc;
    protected Catalogo catalogo;

    public Configuracion(){
        this.pc = new PC();
        this.catalogo = new Catalogo();
    }

    public abstract void setCPU();
    public abstract void setRAM();
    public abstract void setDisco();
    public abstract void setGrafica();
    public abstract void setGabinete();

    public void reset(){
        this.pc = new PC();
    }

    public PC getPc(){
        return this.pc;
    }
}
