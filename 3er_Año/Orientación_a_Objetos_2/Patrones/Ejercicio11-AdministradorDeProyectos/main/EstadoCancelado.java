package ar.edu.info.unlp.ejercicio11;

public class EstadoCancelado extends EstadoAprobacion {
    public EstadoCancelado(Proyecto proyecto) {
        super(proyecto);
    }

    @Override
    public void aprobarEtapa() {
        throw new RuntimeException("CANCELADO: El Proyecto fue cancelado");
    }

    @Override
    public boolean setMargenDeGanancia(double margen) {
        throw new RuntimeException("CANCELADO: El Proyecto fue cancelado");
    }

    @Override
    public void cancelarProyecto(){
        throw new RuntimeException("CANCELADO: El Proyecto fue cancelado");
    }

}
