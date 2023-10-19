package ar.edu.unlp.info.oo1.ejercicio7;

public class Gerente extends EmpleadoJerarquico{
	public Gerente(String string) {
		super(string);
	}

	public double aportes() {
		return this.montoBasico() * 0.05d;
	}
	
	public double montoBasico() {
		System.out.println("Gerente");
		return 57000;
	}
}