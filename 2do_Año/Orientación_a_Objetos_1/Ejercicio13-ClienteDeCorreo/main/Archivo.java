package ar.edu.unlp.info.oo1.ejercicio13;

public class Archivo {
	private String nombre;
	private int tamaño;
	
	public Archivo(String nombre) {
		this.nombre = nombre;
		this.tamaño = nombre.length();
	}
	
	public String getNombre(){
		return this.nombre;
	}
	
	public void setNombre (String nombre) {
		this.nombre = nombre;
		this.tamaño = nombre.length();
	}
	
	public int getTamaño() {
		return this.tamaño;
	}

}
