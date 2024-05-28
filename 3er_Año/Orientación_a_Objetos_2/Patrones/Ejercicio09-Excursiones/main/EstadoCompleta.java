package ar.edu.info.unlp.ejercicio09;

public class EstadoCompleta extends EstadoInscripciones{

    public EstadoCompleta(){
        super();
    }

    public void inscribir(Excursion excursion, Usuario usuario){
        excursion.nuevaInscripcionEspera(usuario);
    }

    public String obtenerInformacion(Excursion excursion){
        return "";
    }

}
