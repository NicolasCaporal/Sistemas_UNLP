package ar.edu.info.unlp.ejercicio09;

public abstract class EstadoInscripciones {
    protected Excursion excursion;

    public EstadoInscripciones(Excursion excursion){
        this.excursion = excursion;
    }

    public abstract void inscribir(Usuario usuario);

    public abstract String obtenerInformacion();

}
