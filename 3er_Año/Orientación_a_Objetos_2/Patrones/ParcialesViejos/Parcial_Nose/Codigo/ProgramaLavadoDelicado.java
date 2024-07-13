package ar.edu.info.unlp.ejercicioDemo;

public class ProgramaLavadoDelicado extends ProgramaLavado{

    @Override
    public int getPorcentajeAgua() {
        return 100;
    }

    @Override
    public int getTiempoLavado() {
        return 40;
    }

    @Override
    public int getTiempoEnjuague() {
        return 15;
    }

    @Override
    public int getTiempoCentrifugado() {
        return 0;
    }
}
