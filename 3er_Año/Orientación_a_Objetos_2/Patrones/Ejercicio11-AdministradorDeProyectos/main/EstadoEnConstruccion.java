package ar.edu.info.unlp.ejercicio11;

public class EstadoEnConstruccion extends EstadoAprobacion {
    public EstadoEnConstruccion() {
        super();
    }

    @Override
    public void aprobarEtapa(Proyecto proyecto) {
        if (proyecto.precioDelProyecto() != 0){
            proyecto.setEstado(new EstadoEnEvaluacion());
        } else {
            throw new RuntimeException("EN CONSTRUCCION: El precio es 0. No puede pasar a 'En Evaluacion'");
        }
    }

    @Override
    public boolean setMargenDeGanancia(Proyecto proyecto, double margen) {
        boolean cambio = false;
        if (margen >= 8 && margen <= 10) {
            proyecto.setMargenDeGanancia(margen);
            cambio = true;
        }
        return cambio;
    }
}
