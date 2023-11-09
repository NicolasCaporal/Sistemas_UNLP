package ar.edu.unlp.info.oo1.ejercicio12;

public class Esfera extends Pieza {
	private int radio;
	
	public Esfera(String material, String color, int radio) {
		super(material, color);
		this.radio = radio;
	}
	
	public int getRadio() {
		return this.radio;
	}
	
	public double getVolumen() {
		return (4 * Math.PI * Math.pow(this.radio, 3)/3);
	}
	
	public double getSuperficie() {
		return 4 * Math.PI * Math.pow(this.radio, 2);
	}
	
}
