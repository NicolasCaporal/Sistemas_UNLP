package ar.edu.info.unlp.ejercicio09;

public class EstadoDefinitiva extends EstadoInscripciones{

    public EstadoDefinitiva(Excursion excursion){
        super(excursion);
    }

    public void inscribir(Usuario usuario){
        this.excursion.nuevaInscripcion(usuario);
        if (this.excursion.usuariosFaltantesMaximo() == 0) {
            this.excursion.setEstado(new EstadoCompleta(excursion));
        }
    }

    public String obtenerInformacion(){
        return "Cantidad de usuarios faltantes completar cupo: " + this.excursion.usuariosFaltantesMaximo() + "\n" +
                "Email de los usuarios inscriptos: " + this.excursion.listaEmailsInscriptos();
    }

}
