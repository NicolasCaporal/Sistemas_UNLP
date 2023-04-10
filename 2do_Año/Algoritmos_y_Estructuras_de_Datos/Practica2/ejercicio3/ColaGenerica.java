/* 3a) Implemente en JAVA (pase por máquina) las clases ColaGenerica y PilaGenerica de acuerdo con
la especificación dada en el diagrama de clases. Defina estas clases adentro del paquete
tp02.ejercicio3. */

package Ejercicio3pr2;

public class ColaGenerica<T> {
	private ListaEnlazadaGenerica<T> lista = new ListaEnlazadaGenerica<T>();
	
	// Agrega dato a la cola.
	public void encolar(T dato) {
		this.lista.agregarFinal(dato);
	}
	
	//  Devuelve el elemento en el tope de la cola sin eliminarlo.
	public T tope() {
		return this.lista.elemento(1);
	}
	
	
	// Elimina y devuelve el primer elemento de la cola.
	public T desencolar() {
		T dato = this.tope();		
		this.lista.eliminarEn(1);
		return dato;
	}
	
	// Retorna true si la cola está vacía, false en caso contrario.
	public boolean esVacia() {
		return lista.esVacia();
	}
	
}
