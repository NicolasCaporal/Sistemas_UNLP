package ar.edu.unlp.info.oo1.ejercicio13;

import java.util.List;
import java.util.ArrayList;

public class ClienteDeCorreo {
	private Carpeta inbox;
	private List<Carpeta> carpetas;
	
	public ClienteDeCorreo(Carpeta inbox) {
		this.inbox = inbox;
		this.carpetas = new ArrayList<Carpeta>();
		this.agregarCarpeta(inbox);
	}
	
	public Carpeta getInbox() {
		return this.inbox;
	}
	
	public List<Carpeta> getCarpetas() {
		return this.carpetas;
	}
	
	public void agregarCarpeta(Carpeta carpeta) {
		this.carpetas.add(carpeta);
	}
	
	public void recibir (Email email) {
		this.inbox.agregarEmail(email);
	}
	
	public void mover (Email email, Carpeta destino, Carpeta origen) {
		destino.eliminarEmail(email);
		origen.agregarEmail(email);
	}
	
	public Email buscar(String texto) {
		return carpetas.stream().map(carpeta -> carpeta.buscar(texto))
				.filter(email -> email != null).findFirst().orElse(null);
	}
	
	public int espacioOcupado() {
		return carpetas.stream().mapToInt(carpeta -> carpeta.getTamaño()).sum();
	}
	
}
