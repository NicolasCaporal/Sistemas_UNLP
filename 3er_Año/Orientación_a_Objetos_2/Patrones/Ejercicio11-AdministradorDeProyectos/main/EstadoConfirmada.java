package ar.edu.info.unlp.ejercicio11;

public class EstadoConfirmada extends EstadoAprobacion {
    public EstadoConfirmada() {
        super();
    }

    @Override
    public void aprobarEtapa(Proyecto proyecto) {
        // No produce efecto alguno en el proyecto
    }

    @Override
    public boolean setMargenDeGanancia(Proyecto proyecto, double margen) {
        return false; // No produce efecto alguno en el proyecto
    }

}
