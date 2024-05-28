package ar.edu.info.unlp.ejercicio11;

public class EstadoCancelado extends EstadoAprobacion {
    public EstadoCancelado() {
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

    @Override
    public void cancelarProyecto(Proyecto proyecto){
        // No produce efecto alguno en el proyecto
    }

}
