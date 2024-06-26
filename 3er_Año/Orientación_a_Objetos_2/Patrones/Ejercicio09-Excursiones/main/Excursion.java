package ar.edu.info.unlp.ejercicio09;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

public class Excursion {
    private String nombre;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    private String puntoEncuentro;
    private double costo;
    private int cupoMinimo;
    private int cupoMaximo;
    private EstadoInscripciones estado;
    private List<Usuario> inscriptos;
    private List<Usuario> enEspera;

    public Excursion(String nombre, LocalDate fechaInicio, LocalDate fechaFin, String puntoEncuentro, double costo, int cupoMinimo, int cupoMaximo) {
        this.nombre = nombre;
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.puntoEncuentro = puntoEncuentro;
        this.costo = costo;
        this.cupoMinimo = cupoMinimo;
        this.cupoMaximo = cupoMaximo;
        this.estado = new EstadoProvisoria();
        this.inscriptos = new ArrayList<Usuario>();
        this.enEspera = new ArrayList<Usuario>();
    }

    public void inscribir(Usuario usuario){
        this.estado.inscribir(this, usuario);
    }

    public String obtenerInformacion(){
        return "Nombre: " + this.nombre + "\n" +
                "Costo: " + this.costo + "\n" +
                "Fecha Inicio:" + this.fechaInicio + "\n" +
                "Fecha Fin: " + this.fechaFin + "\n" +
                "Punto de encuentro: " + this.puntoEncuentro + "\n" +
                this.estado.obtenerInformacion(this);
    }

    protected void nuevaInscripcion(Usuario usuario){
        this.inscriptos.add(usuario);
    }

    protected void nuevaInscripcionEspera(Usuario usuario){
        this.enEspera.add(usuario);
    }

    protected int cantInscriptos(){
        return this.inscriptos.size();
    }

    protected int cantEnEspera(){
        return this.enEspera.size();
    }

    protected void setEstado(EstadoInscripciones nuevoEstado){
        this.estado = nuevoEstado;
    }

    protected int usuariosFaltantesMinimo(){
        return this.cupoMinimo - this.cantInscriptos();
    }

    protected int usuariosFaltantesMaximo(){
        return this.cupoMaximo - this.cantInscriptos();
    }

    protected String listaEmailsInscriptos(){
        StringBuilder listaEmails = new StringBuilder();
        this.inscriptos.stream()
                .forEach(usuario -> listaEmails.append(usuario.getEmail()).append("\n"));
        return listaEmails.toString();
    }

}
