package ar.edu.unlp.info.oo1.ejercicio5;

import java.time.LocalDate;

public class Mamifero {
	private String identificador;
	private String especie;
	private LocalDate fechaNacimiento;
	private Mamifero padre;
	private Mamifero madre;

	public Mamifero() {
		
	}
	
	public Mamifero(String identificador) { 
		this.identificador = identificador;
	}

	public String getIdentificador() {
		return this.identificador;
	}

	public void setIdentificador(String identificador) {
		this.identificador = identificador;
	}

	public String getEspecie() {
		return this.especie;
	}

	public void setEspecie(String especie) {
		this.especie = especie;
	}

	public LocalDate getFechaNacimiento() {
		return this.fechaNacimiento;
	}

	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}

	public Mamifero getPadre() {
		return this.padre;
	}

	public void setPadre(Mamifero padre) {
		this.padre = padre;
	}

	public Mamifero getMadre() {
		return this.madre;
	}

	public void setMadre(Mamifero madre) {
		this.madre = madre;
	}

	public Mamifero getAbuelaMaterna() {
		if (this.getMadre() != null)
			return this.getMadre().getMadre();
		return null;
	}

	public Mamifero getAbueloMaterno() {
		if (this.getMadre() != null)
			return this.getMadre().getPadre();
		return null;
	}

	public Mamifero getAbuelaPaterna() {
		if (this.getPadre() != null)
			return this.getPadre().getMadre();
		return null;
	}


	public Mamifero getAbueloPaterno() {
		if (this.getPadre() != null)
			return this.getPadre().getPadre();
		return null;
	}
	
	
	
	public Boolean tieneComoAncestroA (Mamifero ancestro) {
		if (this == ancestro)
			return false;
		
		return ((buscarAncestro(ancestro, this.getPadre()))||(buscarAncestro(ancestro, this.getMadre())));
	}
	
	
	private Boolean buscarAncestro(Mamifero ancestro, Mamifero actual) {
		
		boolean resultado = false;
		
		if (actual == ancestro)
			return true;
		
		
		if (actual != null) {
			if (actual.getPadre() != null) 
				resultado = buscarAncestro(ancestro, actual.getPadre());
			
			
			if ((resultado == false) && (actual.getMadre() != null))
				resultado = buscarAncestro(ancestro, actual.getMadre());
		}
		
		return resultado;
	}
}
