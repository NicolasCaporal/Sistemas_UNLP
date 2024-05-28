package ar.edu.info.unlp.ejercicio11;

public class EstadoEnEvaluacion extends EstadoAprobacion {
    public EstadoEnEvaluacion(Proyecto proyecto) {
        super(proyecto);
    }

    @Override
    public void aprobarEtapa() {
        this.proyecto.setEstado(new EstadoConfirmada(this.proyecto));
    }

    @Override
    public boolean setMargenDeGanancia(double margen) {
        boolean cambio = false;
        if (margen >= 11 && margen <= 15) {
            this.proyecto.setMargenDeGanancia(margen);
            cambio = true;
        }
        return cambio;
    }
}
