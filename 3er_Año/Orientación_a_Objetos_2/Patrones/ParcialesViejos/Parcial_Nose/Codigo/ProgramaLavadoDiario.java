package ar.edu.info.unlp.ejercicioDemo;

public class ProgramaLavadoDiario extends ProgramaLavado{

    @Override
    public int getPorcentajeAgua() {
        return 50;
    }

    @Override
    public int getTiempoLavado() {
        return 20;
    }

    @Override
    public int getTiempoEnjuague() {
        return 7;
    }

    @Override
    public int getTiempoCentrifugado() {
        return 3;
    }

}
