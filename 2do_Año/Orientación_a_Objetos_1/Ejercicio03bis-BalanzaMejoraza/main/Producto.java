package ar.edu.unlp.info.oo1.ejercicio3bis;

public class Producto {
	private double peso;
	private double precioPorKilo;
	private String descripcion;
	
	public Producto(){
		this.peso = 0;
		this.precioPorKilo = 0;
		this.descripcion = "No description";
	}
	
	public Producto(double peso, double precioPorKilo, String descripcion) {
		this.peso = peso;
		this.precioPorKilo = precioPorKilo;
		this.descripcion = descripcion;
	}
	
	public void setPeso(double peso) {
		this.peso = peso;
	}
	
	public double getPeso() {
		return this.peso;
	}
	
	public void setPrecioPorKilo (double precioPorKilo) {
		this.precioPorKilo = precioPorKilo;
	}
	
	public double getPrecioPorKilo(){
		return this.precioPorKilo;
	}
	
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getDescripcion() {
		return this.descripcion;
	}
	
	
	public double getPrecio() {
		return this.getPeso() * this.getPrecioPorKilo();
	}
	
}
