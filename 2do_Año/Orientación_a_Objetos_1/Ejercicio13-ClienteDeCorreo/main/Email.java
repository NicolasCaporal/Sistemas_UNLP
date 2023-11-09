package ar.edu.unlp.info.oo1.ejercicio13;

import java.util.List;
import java.util.ArrayList;

public class Email {
	private String titulo;
	private String cuerpo;
	private List<Archivo> adjuntos;
	private Integer tamaño;
	
	public Email(String titulo, String cuerpo) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.adjuntos = new ArrayList<Archivo>();
		this.tamaño = titulo.length() + cuerpo.length();
	}
	
	public String getTitulo() {
		return this.titulo;
	}
	
	public String getCuerpo() {
		return this.cuerpo;
	}
	
	public List<Archivo> getAdjuntos(){
		return this.adjuntos;
	}
	
	public void agregarAdjuntos(Archivo adjunto) {
		this.adjuntos.add(adjunto);
		this.tamaño += adjunto.getTamaño();
	}
	
	public int getTamaño() {
		return this.tamaño;
	}
	
	public boolean contiene(String texto) {
		return (this.titulo.contains(texto) || this.cuerpo.contains(texto));
	}
	
}
