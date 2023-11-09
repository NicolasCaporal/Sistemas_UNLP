package ar.edu.unlp.info.oo1.ejercicio12;

import java.util.List;
import java.util.ArrayList;

public class ReporteDeConstruccion {
	private List<Pieza> piezas;
	
	public ReporteDeConstruccion() {
		this.piezas = new ArrayList<Pieza>();
	}

	public List<Pieza> getPiezas() {
		return this.piezas;
	}
	
	public void agregarPieza(Pieza pieza) {
		piezas.add(pieza);
	}
	
	public double getVolumenDeMaterial(String material) {
		return piezas.stream().filter(pieza -> pieza.getMaterial() == material).mapToDouble(pieza -> pieza.getVolumen()).sum();
	}

	public double getSuperficieDeColor(String color) {
		return piezas.stream().filter(pieza -> pieza.getColor() == color).mapToDouble(pieza -> pieza.getSuperficie()).sum();
	}
	
}
