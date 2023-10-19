package ar.edu.unlp.info.oo1.ejercicio7;

public class EmpleadoJerarquico extends Empleado {
	

	public EmpleadoJerarquico(String string) {
		super(string);
	}

	public double sueldoBasico() {
		//System.out.println("This.sueldoBasico = " + this.sueldoBasico());
		System.out.println("Super.sueldoBasico = " + super.sueldoBasico());
		System.out.println("This.BonoPorCategotia = " + this.bonoPorCategoria());
		return super.sueldoBasico() + this.bonoPorCategoria();
	}
	
	public double montoBasico() {
		return 45000;
	}
	
	public double bonoPorCategoria() {
		return 8000;
	}
}