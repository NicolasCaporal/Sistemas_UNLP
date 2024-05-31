package ar.edu.info.unlp.ejercicioDemo;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Pelicula {

	private String titulo;
	private int anioEstreno;
	private double puntaje;
	private List<Pelicula> similares;

	public Pelicula(String titulo, double puntaje, int anioEstreno){
		this.titulo = titulo;
		this.anioEstreno = anioEstreno;
		this.puntaje = puntaje;
		this.similares = new ArrayList<Pelicula>();
	}

	public List<Pelicula> getSimilares() {
		return similares;
	}

	public void addSimilar(Pelicula pelicula){
		this.similares.add(pelicula);
	}

	public int getAnioEstreno(){
		return this.anioEstreno;
	}

	public double getPuntaje(){
		return this.puntaje;
	}

}
