/* b. Cree una clase llamada Profesor con los atributos especificados abajo y sus
correspondientes métodos getters y setters (haga uso de las facilidades que brinda eclipse)
● nombre
● apellido
● email
● catedra
● facultad 

c. Agregue un método de instancia llamado tusDatos() en la clase Estudiante y en la
clase Profesor, que retorne un String con los datos de los atributos de las mismas. Para
acceder a los valores de los atributos utilice los getters previamente definidos */


package ejercicio3;

public class Profesor {
	private String nombre;
	private String apellido;
	private String email;
	private String catedra;
	private String facultad;
	
	
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
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCatedra() {
		return catedra;
	}
	
	public void setCatedra(String catedra) {
		this.catedra = catedra;
	}
	
	public String getFacultad() {
		return facultad;
	}
	
	public void setFacultad(String facultad) {
		this.facultad = facultad;
	}
	
	
	public String tusDatos() {
		String datos = this.getNombre() + " " + this.getApellido() + " " + this.getEmail() + " " + this.getCatedra() + " " + this.getFacultad();
		return datos;
	}

}
