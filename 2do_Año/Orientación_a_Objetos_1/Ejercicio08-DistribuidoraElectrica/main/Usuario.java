package ar.edu.unlp.info.oo1.ejercicio8;

import java.util.List;
import java.util.ArrayList;

public class Usuario {
	private String domicilio;
	private String nombre;
	private List<Factura> facturas;
	private List<Consumo> consumos;
	
	
	public Usuario (String nombre, String domicilio) {
		this.nombre = nombre;
		this.domicilio = domicilio;
		this.facturas = new ArrayList<Factura>();
		this.consumos = new ArrayList<Consumo>();
	}
	
	
	
	public String getNombre() {
		return this.nombre;
	}
	
	
	public String getDomicilio() {
		return this.domicilio;
	}
	
	
	public void agregarMedicion(Consumo medicion) {
		this.consumos.add(medicion);
	}
	
	
	private Consumo getUltimoConsumo() {
		return this.consumos.stream()
				.max((Consumo c1, Consumo c2) -> c1.getFecha().compareTo(c2.getFecha())).orElse(null);
	}
	
	
	public double ultimoConsumoActiva() {
		Consumo ultimo = this.getUltimoConsumo();
		if (ultimo != null) {
			return ultimo.getConsumoDeEnergiaActiva();
		}
		return 0;
	}
	
	
	public Factura facturarEnBaseA(double precioKWh) {
		double costo = 0;
		double descuento = 0;
		
		if (this.consumos.size() != 0) {
			Consumo ultimoConsumo = this.getUltimoConsumo();
			costo = ultimoConsumo.getConsumoDeEnergiaActiva() * precioKWh;
			double factorPotencia = ultimoConsumo.factorDePotencia();
					
			if (factorPotencia > 0.8) {
				descuento = 10;
			}
		}
		
		return new Factura(costo, descuento, this);
	}
	
	
	public List<Factura> getFacturas(){
		return this.facturas;
	}
	
}
