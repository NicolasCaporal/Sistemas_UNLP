package ar.edu.info.unlp.ejercicio09;

public class Usuario {

	private String nombre;
	private String apellido;
	private String email;
	
	public Usuario(String nombre, String apellido, String email){
		this.nombre = nombre;
		this.apellido = apellido;
		this.email = email;
	}

	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getEmail() {
		return this.email;
	}
	public void setDni(String email) {
		this.email = email;
	}

	public String getNombreCompleto() {
		return this.getApellido() + ", " + this.getNombre();
	}

}
