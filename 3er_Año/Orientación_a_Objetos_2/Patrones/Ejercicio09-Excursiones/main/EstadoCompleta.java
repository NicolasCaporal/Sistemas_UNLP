package ar.edu.info.unlp.ejercicio09;

public class EstadoCompleta extends EstadoInscripciones{

    public EstadoCompleta(Excursion excursion){
        super(excursion);
    }

    public void inscribir(Usuario usuario){
        this.excursion.nuevaInscripcionEspera(usuario);
    }

    public String obtenerInformacion(){
        return "";
    }

}
