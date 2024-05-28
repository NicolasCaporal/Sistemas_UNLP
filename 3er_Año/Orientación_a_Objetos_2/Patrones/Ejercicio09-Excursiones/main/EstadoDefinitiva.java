package ar.edu.info.unlp.ejercicio09;

public class EstadoDefinitiva extends EstadoInscripciones{

    public EstadoDefinitiva(){
        super();
    }

    public void inscribir(Excursion excursion, Usuario usuario){
        excursion.nuevaInscripcion(usuario);
        if (excursion.usuariosFaltantesMaximo() == 0) {
            excursion.setEstado(new EstadoCompleta());
        }
    }

    public String obtenerInformacion(Excursion excursion){
        return "Cantidad de usuarios faltantes completar cupo: " + excursion.usuariosFaltantesMaximo() + "\n" +
                "Email de los usuarios inscriptos: " + excursion.listaEmailsInscriptos();
    }

}
