package ar.edu.info.unlp.ejercicio11;

public class EstadoEnEvaluacion extends EstadoAprobacion {
    public EstadoEnEvaluacion() {
        super();
    }

    @Override
    public void aprobarEtapa(Proyecto proyecto) {
        proyecto.setEstado(new EstadoConfirmada());
    }

    @Override
    public boolean setMargenDeGanancia(Proyecto proyecto, double margen) {
        boolean cambio = false;
        if (margen >= 11 && margen <= 15) {
            proyecto.setMargenDeGanancia(margen);
            cambio = true;
        }
        return cambio;
    }
}
