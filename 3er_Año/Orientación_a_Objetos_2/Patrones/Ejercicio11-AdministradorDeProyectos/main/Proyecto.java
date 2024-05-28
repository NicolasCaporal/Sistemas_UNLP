package ar.edu.info.unlp.ejercicio11;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class Proyecto {

	private String nombre;
	private String objetivo;
	private LocalDate fechaInicio;
	private LocalDate fechaFin;
	private int cantIntegrantes;
	private double montoDiario;
	private double margenGanancia;
	private EstadoAprobacion estado;

	public Proyecto(String nombre, String objetivo, LocalDate fechaInicio, LocalDate fechaFin, int cantIntegrantes, double montoDiario) {
		this.nombre = nombre;
		this.objetivo = objetivo;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.cantIntegrantes = cantIntegrantes;
		this.montoDiario = montoDiario;
		this.margenGanancia = 7; // En %
		this.estado = new EstadoEnConstruccion();
	}

	public void aprobarEtapa() {
		this.estado.aprobarEtapa(this);
	}

	private int cantDias(){
		return (int) ChronoUnit.DAYS.between(this.fechaInicio, this.fechaFin);
	}
	public double costoDelProyecto() {
		return this.cantIntegrantes * this.cantDias() * this.montoDiario;
	}
	public double precioDelProyecto() {
		return this.costoDelProyecto() * (1 + this.margenGanancia / 100);
	}

	public boolean cambiarMargenDeGanancia(double margen) {
		return this.estado.setMargenDeGanancia(this, margen);
	}

	public void cancelarProyecto() {
		this.estado.cancelarProyecto(this);
	}

	protected void setMargenDeGanancia(double margen) {
		this.margenGanancia = margen;
	}

	protected double getMargenDeGanancia(){
		return this.margenGanancia;
	}

	protected void setEstado(EstadoAprobacion estado) {
		this.estado = estado;
	}

	protected EstadoAprobacion getEstado(){
		return this.estado;
	}

	protected void setObjetivo(String objetivo){
		this.objetivo = objetivo;
	}

	public String getObjetivo(){
		return this.objetivo;
	}

}
