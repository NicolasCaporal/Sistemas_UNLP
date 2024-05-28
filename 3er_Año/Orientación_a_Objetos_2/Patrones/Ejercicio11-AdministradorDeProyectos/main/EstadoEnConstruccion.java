package ar.edu.info.unlp.ejercicio11;

public class EstadoEnConstruccion extends EstadoAprobacion {
    public EstadoEnConstruccion(Proyecto proyecto) {
        super(proyecto);
    }

    @Override
    public void aprobarEtapa() {
        if (this.proyecto.precioDelProyecto() != 0){
            this.proyecto.setEstado(new EstadoEnEvaluacion(this.proyecto));
        } else {
            throw new RuntimeException("EN CONSTRUCCION: El precio es 0. No puede pasar a 'En Evaluacion'");
        }
    }

    @Override
    public boolean setMargenDeGanancia(double margen) {
        boolean cambio = false;
        if (this.proyecto.getMargenDeGanancia() >= 8 && this.proyecto.getMargenDeGanancia() <= 10) {
            this.proyecto.setMargenDeGanancia(margen);
            cambio = true;
        }
        return cambio;
    }
}
