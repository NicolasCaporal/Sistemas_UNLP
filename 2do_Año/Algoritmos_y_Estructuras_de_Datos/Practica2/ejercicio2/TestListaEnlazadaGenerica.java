/* 2.3. Escriba una clase llamada TestListaEnlazadaGenerica que cree 4 objetos de tipo Estudiante
(implementado en la practica 1) y los agregue a un objeto de tipo ListaEnlazadaGenerica usando los
diferentes métodos de la lista y luego, imprima los elementos de dicha lista usando el método
tusDatos(). */

package ejercicio2pr2;

import java.util.Scanner;

public class TestListaEnlazadaGenerica {
	
	public static Estudiante leerEstudiante(Scanner s) {
		
		Estudiante e = new Estudiante();
		System.out.print("Ingrese nombre: ");
		e.setNombre(s.nextLine());
		System.out.print("Ingrese apellido: ");
		e.setApellido(s.nextLine());
		System.out.print("Ingrese comision: ");
		e.setComision(s.nextLine());
		System.out.print("Ingrese email: ");
		e.setEmail(s.nextLine());
		System.out.print("Ingrese direccion: ");
		e.setDireccion(s.nextLine());
		System.out.println();
		
		return e;
		
	}
	
	public static void main(String[] args) {
		
		Scanner s = new Scanner(System.in);
		
		ListaEnlazadaGenerica<Estudiante> lista = new ListaEnlazadaGenerica<Estudiante>();
		
		lista.comenzar();
		for (int i=1; i <= 4; i++) {
			lista.agregarFinal(leerEstudiante(s));			
		}
		
		
		System.out.println();
		
		System.out.println("Imprimiendo lista.");
		lista.comenzar();
		while (!lista.fin()) {
			Estudiante e = lista.proximo();
			System.out.println(e.tusDatos());
		}
		
	}

}
