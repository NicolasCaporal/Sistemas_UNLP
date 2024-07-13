package ar.edu.info.unlp.ejercicioDemo;

public abstract class ProgramaLavado {

    public Integer lavar(Lavarropas lavarropas){

        lavarropas.agregarAgua(this.getPorcentajeAgua());
        this.cicloLavar(lavarropas);
        this.cambiarAgua(lavarropas);
        this.enjuagar(lavarropas);
        lavarropas.centrifugar(this.getTiempoCentrifugado());

        return this.getTiempoLavado() + this.getTiempoEnjuague() + this.getTiempoCentrifugado();
    }


    private void cambiarAgua(Lavarropas lavarropas){
        lavarropas.vaciarAgua();
        lavarropas.agregarAgua(this.getPorcentajeAgua());
    }

    public void cicloLavar(Lavarropas lavarropas){
        lavarropas.agregarJabonEnPolvo();
        lavarropas.lavar(this.getCantLavado());
    }

    private void enjuagar(Lavarropas lavarropas) {
        lavarropas.agregarEnjuague();
        lavarropas.enjuagar(this.getTiempoEnjuague());
    }

    public abstract int getPorcentajeAgua();

    public abstract int getTiempoLavado();

    public abstract int getTiempoEnjuague();

    public abstract int getTiempoCentrifugado();

    public int getCantLavado(){
        return 1;
    }

}
