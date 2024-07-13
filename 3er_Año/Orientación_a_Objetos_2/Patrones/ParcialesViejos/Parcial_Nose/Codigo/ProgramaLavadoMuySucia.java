package ar.edu.info.unlp.ejercicioDemo;

public class ProgramaLavadoMuySucia extends ProgramaLavado{

    @Override
    public void cicloLavar(Lavarropas lavarropas){
        lavarropas.agregarJabonEnPolvo();
        lavarropas.lavar(100);
        lavarropas.agregarJabonEnPolvo();
        lavarropas.lavar(30);
    }

    @Override
    public int getPorcentajeAgua() {
        return 100;
    }

    @Override
    public int getTiempoLavado() {
        return 100 + 30;
    }

    @Override
    public int getTiempoEnjuague() {
        return 30;
    }

    @Override
    public int getTiempoCentrifugado() {
        return 0;
    }

    @Override
    public int getCantLavado() {
        return 2;
    }
}
