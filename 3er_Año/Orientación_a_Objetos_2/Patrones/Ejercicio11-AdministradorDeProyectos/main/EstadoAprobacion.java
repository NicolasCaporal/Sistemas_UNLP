package ar.edu.info.unlp.ejercicio11;

public abstract class EstadoAprobacion {

    public EstadoAprobacion(){  }

    public abstract void aprobarEtapa(Proyecto proyecto);

    public abstract boolean setMargenDeGanancia(Proyecto proyecto, double margen);

    public void cancelarProyecto(Proyecto proyecto){
        proyecto.setObjetivo(proyecto.getObjetivo() + " (Cancelado)");
        proyecto.setEstado(new EstadoCancelado());
    }
}
