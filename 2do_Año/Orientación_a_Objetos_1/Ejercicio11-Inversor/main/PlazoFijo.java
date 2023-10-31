package ar.edu.unlp.info.oo1.ejercicio11;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo implements Inversion {
	private LocalDate fechaDeConstitución;
	private double montoDepositado;
	private double porcentajeDeInteresDiario;
	
	public PlazoFijo(LocalDate fechaDeConstitucion, double montoDepositado, double porcentajeDeInteresDiario) {
		this.fechaDeConstitución = fechaDeConstitucion;
		this.montoDepositado = montoDepositado;
		this.porcentajeDeInteresDiario = porcentajeDeInteresDiario;
	}
	
	public double getMontoDepositado() {
		return montoDepositado;
	}
	public void setMontoDepositado(double montoDepositado) {
		this.montoDepositado = montoDepositado;
	}
	public double getPorcentajeDeInteresDiario() {
		return porcentajeDeInteresDiario;
	}
	public void setPorcentajeDeInteresDiario(double porcentajeDeInteresDiario) {
		this.porcentajeDeInteresDiario = porcentajeDeInteresDiario;
	}
	
	public LocalDate getFechaDeConstitucion() {
		return this.fechaDeConstitución;
	}
	
	public void setFechaDeConstitucion(LocalDate fechaConstitucion) {
		this.fechaDeConstitución = fechaConstitucion;
	}

	@Override
	public double valorActual() {
		long diasTranscurridos = ChronoUnit.DAYS.between(fechaDeConstitución, LocalDate.now());
		return this.getMontoDepositado() + ((this.getMontoDepositado()* this.getPorcentajeDeInteresDiario())/100 * diasTranscurridos);
	}
}
