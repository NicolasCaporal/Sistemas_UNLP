package ar.edu.info.unlp.ejercicio09;

public abstract class EstadoInscripciones {
    protected Excursion excursion;

    public EstadoInscripciones(){ }

    public abstract void inscribir(Excursion excursion, Usuario usuario);

    public abstract String obtenerInformacion(Excursion excursion);

}
