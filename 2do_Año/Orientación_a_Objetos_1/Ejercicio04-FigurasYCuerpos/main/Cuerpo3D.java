package ar.edu.unlp.info.oo1.ejercicio4;

public class Cuerpo3D {
	private Figura caraBasal;
	private double altura;
	
	public Cuerpo3D() {}
	
	public Cuerpo3D(Figura caraBasal, double altura) {
		this.caraBasal = caraBasal;
		this.altura = altura;
	}
	
	public void setAltura(double altura) {
		this.altura = altura;
	}
	
	public double getAltura() {
		return this.altura;
	}
	
	public void setCaraBasal(Figura caraBasal) {
		this.caraBasal = caraBasal;
	}
	
	public double getVolumen() {
		return this.caraBasal.getArea() * this.altura;
	}
	
	public double getSuperficieExterior() {
		return 2 * this.caraBasal.getArea() + this.caraBasal.getPerimetro() * this.altura;
	}
	
}
