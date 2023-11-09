package ar.edu.unlp.info.oo1.ejercicio13;

import java.util.List;
import java.util.ArrayList;

public class Carpeta {
	private String nombre;
	private List<Email> emails;
	private int tamaño;
	
	public Carpeta (String nombre) {
		this.nombre = nombre;
		this.emails = new ArrayList<Email>();
		this.tamaño = 0;
	}
	
	public String getNombre() {
		return this.nombre;
	}
	
	public List<Email> getEmails(){
		return this.emails;
	}
	
	public void agregarEmail(Email email) {
		this.emails.add(email);
		this.tamaño += email.getTamaño();
	}
	
	public void eliminarEmail(Email email) {
		if (emails.contains(email)) {
			this.emails.remove(email);
			this.tamaño -= email.getTamaño();
		}
	}
	
	public int getTamaño() {
		return this.tamaño;
	}

	public Email buscar(String texto) {
		return emails.stream().filter(email -> email.contiene(texto) == true).findFirst().orElse(null);
	}
	
}

