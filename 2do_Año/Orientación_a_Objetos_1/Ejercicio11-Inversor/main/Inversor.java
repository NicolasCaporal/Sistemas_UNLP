package ar.edu.unlp.info.oo1.ejercicio11;

import java.util.List;
import java.util.ArrayList;

public class Inversor {
	private String nombre;
	private List<Inversion> inversiones;
	
	public Inversor(String nombre){
		this.nombre = nombre;
		this.inversiones = new ArrayList<Inversion>();
	}

	public String getNombre() {
		return nombre;
	}
	
	public List<Inversion> getInversiones() {
		return new ArrayList<Inversion>(this.inversiones);
	}
	
	public void agregarInversion(Inversion inversion) {
		this.inversiones.add(inversion);
	}
	
	public double valorActual() {
		return this.inversiones.stream().mapToDouble(inversion -> inversion.valorActual()).sum();
	}
}
