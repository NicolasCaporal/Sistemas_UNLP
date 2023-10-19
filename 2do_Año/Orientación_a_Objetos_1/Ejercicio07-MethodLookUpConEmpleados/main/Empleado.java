package ar.edu.unlp.info.oo1.ejercicio7;

public class Empleado {
	private String nombre;
	
	public Empleado(String string) {
		this.nombre = string;
	}

	public double montoBasico() {
		return 35000;
	}
	
	public double aportes() {
		return 13500;
	}
	
	public double sueldoBasico() {
		System.out.println("this.montoBasico() = " + this.montoBasico());
		return this.montoBasico() + this.aportes();
	}
	
}
