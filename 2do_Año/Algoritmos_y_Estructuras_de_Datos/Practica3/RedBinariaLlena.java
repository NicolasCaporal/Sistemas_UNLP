/* Ejercicio 4
Una red binaria es una red que posee una topología de árbol binario lleno. 

Los nodos que conforman una red binaria llena tiene la particularidad de que todos ellos conocen
cuál es su retardo de reenvío. El retardo de reenvío se define como el período comprendido entre
que un nodo recibe un mensaje y lo reenvía a sus dos hijos.
Su tarea es calcular el mayor retardo posible, en el camino que realiza un mensaje desde la raíz
hasta llegar a las hojas en una red binaria llena.
Nota: asuma que cada nodo tiene el dato de retardo de reenvío expresado en cantidad de segundos.

a) Indique qué estrategia (recorrido en profundidad o por niveles) utilizará para resolver el
problema.

b) Cree una clase Java llamada RedBinariaLlena (dentro del paquete tp03.ejercicio4)
donde implementará lo solicitado en el método retardoReenvio():int/ */

package ejercicio4pr3;

public class RedBinariaLlena {
	private ArbolBinario<Integer> arbol;
	
	public RedBinariaLlena(ArbolBinario<Integer> arbol) {
		this.arbol = arbol;
	}
	
	public int retardoReenvio() {
		return retardoR(this.arbol);
	}
	
	private int retardoR(ArbolBinario<Integer> arbol) {
		int rI = 0;
		int rD = 0;
		int m = -1;
		
		if (arbol.esHoja())
			return 0;
		
		if (arbol.tieneHijoIzquierdo()){
			rI = retardoR(arbol.getHijoIzquierdo());
		}
		
		if (arbol.tieneHijoDerecho()){
			rD = retardoR(arbol.getHijoDerecho());
		}
		
		m = (max(rI, rD));
		
		return (arbol.getDato() + m);
	}

	private int max(int a, int b) {
		if (a >= b)
			return a;
		else
			return b;
	}
}
