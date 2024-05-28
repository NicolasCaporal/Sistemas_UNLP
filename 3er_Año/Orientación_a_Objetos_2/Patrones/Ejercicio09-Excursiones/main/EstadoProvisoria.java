package ar.edu.info.unlp.ejercicio09;

public class EstadoProvisoria extends EstadoInscripciones{

    public EstadoProvisoria(){
        super();
    }

    public void inscribir(Excursion excursion, Usuario usuario){
        excursion.nuevaInscripcion(usuario);
        if (excursion.usuariosFaltantesMinimo() == 0) {
            excursion.setEstado(new EstadoDefinitiva());
        }
    }

    public String obtenerInformacion(Excursion excursion){
        return "Cantidad de usuarios faltantes para alcanzar minimo: " + excursion.usuariosFaltantesMinimo();
    }

}
