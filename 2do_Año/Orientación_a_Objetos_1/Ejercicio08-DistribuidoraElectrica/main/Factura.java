package ar.edu.unlp.info.oo1.ejercicio8;

import java.time.LocalDate;

public class Factura {
	private Usuario usuario;
	private double montoEnergiaActiva;
	private double descuento;
	private LocalDate fecha;
	
	
	public Factura(double montoEnergiaActiva, double descuento, Usuario usuario) {
		this.fecha = LocalDate.now();
		this.montoEnergiaActiva = montoEnergiaActiva;
		this.descuento = descuento;
		this.usuario = usuario;
	}
	
	
	
	public Usuario getUsuario() {
		return this.usuario;
	}
	
	
	public double getMontoEnergiaActiva() {
		return this.montoEnergiaActiva;
	}
	
	
	public LocalDate getFecha() {
		return this.fecha;
	}
	
	
	public double getDescuento() {
		return this.descuento;
	}
	
	
	public double montoTotal() {
		return this.montoEnergiaActiva - (this.montoEnergiaActiva * this.descuento /100);
	}
	
}
