/* d. Escriba una clase llamada Test con el método main, el cual cree un arreglo con 2
objetos Estudiante, otro arreglo con 3 objetos Profesor, y luego recorra ambos arreglos
imprimiendo los valores obtenidos mediante el método tusDatos(). Recuerde asignar los
valores de los atributos de los objetos Estudiante y Profesor invocando los respectivos
métodos setters. */

package ejercicio3;

public class Test {
	public static void main(String[] args) {
		
		Estudiante[] estudiantes = new Estudiante[2]; 
		Profesor[] profesores = new Profesor[3];
		
		estudiantes[0] = new Estudiante();
		estudiantes[0].setNombre("Nicolas");
		estudiantes[0].setApellido("Caporal");
		estudiantes[0].setComision("M3B");
		estudiantes[0].setEmail("nicolascaporal.unlp@gmail.com");
		estudiantes[0].setDireccion("50 y 120");
		
		estudiantes[1] = new Estudiante();
		estudiantes[1].setNombre("Emiliano");
		estudiantes[1].setApellido("Martinez");
		estudiantes[1].setComision("T3A");
		estudiantes[1].setEmail("miraquetecomo@afa.com.ar");
		estudiantes[1].setDireccion("Villa Park 26");
		
		profesores[0] = new Profesor();
		profesores[0].setNombre("Laureano");
		profesores[0].setApellido("De Giusta"); 
		profesores[0].setEmail("laureanodegiusta@unlp.com");
		profesores[0].setCatedra("CADP");
		profesores[0].setFacultad("Informatica");
		
		profesores[1] = new Profesor();
		profesores[1].setNombre("Lionel");
		profesores[1].setApellido("Scaloni");
		profesores[1].setEmail("campeondelmundo@afa.com.ar");
		profesores[1].setCatedra("Entrenamiento Deportivo");
		profesores[1].setFacultad("Futbol Champagne");

		profesores[2] = new Profesor();
		profesores[2].setNombre("Alejandra");
		profesores[2].setApellido("García"); 
		profesores[2].setEmail("agarcia@unlp.com");
		profesores[2].setCatedra("Base de Datos");
		profesores[2].setFacultad("Informática");
		
		for (Estudiante est: estudiantes) {
			System.out.println(est.tusDatos());
		}
		
		System.out.println();
		
		for (Profesor pro: profesores) {
			System.out.println(pro.tusDatos());
		}

	}
}
