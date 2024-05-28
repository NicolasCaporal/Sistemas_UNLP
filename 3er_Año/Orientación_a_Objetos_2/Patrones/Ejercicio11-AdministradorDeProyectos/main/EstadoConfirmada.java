package ar.edu.info.unlp.ejercicio11;

public class EstadoConfirmada extends EstadoAprobacion {
    public EstadoConfirmada(Proyecto proyecto) {
        super(proyecto);
    }

    @Override
    public void aprobarEtapa() {
        throw new RuntimeException("CONFIRMADA: El Proyecto ya está confirmado");
    }

    @Override
    public boolean setMargenDeGanancia(double margen) {
        throw new RuntimeException("CONFIRMADA: El Proyecto ya está confirmado, no podés modificar el margen de ganancia");
    }

}
