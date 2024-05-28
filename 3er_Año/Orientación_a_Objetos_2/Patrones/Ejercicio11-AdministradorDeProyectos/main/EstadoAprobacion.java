package ar.edu.info.unlp.ejercicio11;

public abstract class EstadoAprobacion {
    protected Proyecto proyecto;

    public EstadoAprobacion(Proyecto proyecto){
        this.proyecto = proyecto;
    }

    public abstract void aprobarEtapa();

    public abstract boolean setMargenDeGanancia(double margen);

    public void cancelarProyecto(){
        this.proyecto.setObjetivo(this.proyecto.getObjetivo() + " (Cancelado)");
        this.proyecto.setEstado(new EstadoCancelado(proyecto));
    }
}
