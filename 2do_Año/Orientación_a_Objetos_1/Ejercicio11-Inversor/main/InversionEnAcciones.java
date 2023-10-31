package ar.edu.unlp.info.oo1.ejercicio11;

public class InversionEnAcciones implements Inversion {
	private String nombre;
	private int cantidad;
	private double valorUnitario;
	
	public InversionEnAcciones(String nombre, int cantidad, double valorUnitario) {
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.valorUnitario = valorUnitario;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public int getCantidad() {
		return this.cantidad;
	}
	
	public double getValorUnitario() {
		return this.valorUnitario;
	}
	
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	
	public void setValorUnitario(double valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	@Override
	public double valorActual() {
		return this.cantidad * this.valorUnitario;
	}
}
