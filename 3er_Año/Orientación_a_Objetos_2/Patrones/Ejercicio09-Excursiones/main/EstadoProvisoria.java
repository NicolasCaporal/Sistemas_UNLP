package ar.edu.info.unlp.ejercicio09;

public class EstadoProvisoria extends EstadoInscripciones{

    public EstadoProvisoria(Excursion excursion){
        super(excursion);
    }

    public void inscribir(Usuario usuario){
        this.excursion.nuevaInscripcion(usuario);
        if (this.excursion.usuariosFaltantesMinimo() == 0) {
            this.excursion.setEstado(new EstadoDefinitiva(excursion));
        }
    }

    public String obtenerInformacion(){
        return "Cantidad de usuarios faltantes para alcanzar minimo: " + this.excursion.usuariosFaltantesMinimo();
    }

}
