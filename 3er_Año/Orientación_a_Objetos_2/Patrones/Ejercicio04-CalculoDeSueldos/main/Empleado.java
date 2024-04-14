package ar.edu.info.unlp.ejercicio04;

public abstract class Empleado {
	private int cantHijos;
	private boolean casado;

	public Empleado(int cantHijos, boolean casado){
		this.cantHijos = cantHijos;
		this.casado = casado;
	}

	public double sueldo() {
		double basico = this.basico();
		double adicional = this.adicional();
		return basico + adicional - this.descuento(basico, adicional);
	}

	public abstract double basico();

	public abstract double adicional();

	public double descuento(double basico, double adicional){
		return (basico * 0.13) + (adicional * 0.05);
	}

	protected boolean isCasado(){
		return this.casado;
	}

	protected int getCantHijos(){
		return this.cantHijos;
	}
}
