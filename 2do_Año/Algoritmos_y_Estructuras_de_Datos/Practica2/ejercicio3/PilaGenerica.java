/* 3a) Implemente en JAVA (pase por máquina) las clases ColaGenerica y PilaGenerica de acuerdo con
la especificación dada en el diagrama de clases. Defina estas clases adentro del paquete
tp02.ejercicio3. */

package Ejercicio3pr2;

public class PilaGenerica<T> {
	private ListaEnlazadaGenerica<T> lista = new ListaEnlazadaGenerica<T>();
	
	// Agrega dato a la pila.
	public void apilar(T dato) {
		this.lista.agregarInicio(dato);
	}
	
	// desapilar(): Elimina y devuelve el dato en el tope de la pila.
	public T desapilar() {
		T dato = this.tope();
		this.lista.eliminarEn(1);
		return dato;
	}
	
	// Devuelve el elemento en el tope de la pila sin eliminarlo 
	public T tope() { 
		return this.lista.elemento(1);	
	}
	
	// Retorna true si la pila está vacía, false en caso contrario
	public boolean esVacia() {
		return this.lista.esVacia();
	}
	
}
