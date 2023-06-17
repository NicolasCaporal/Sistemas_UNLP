/* Ejercicio 4
Implemente en JAVA una clase llamada Recorridos ubicada dentro del paquete ejercicio5 cumpliendo la siguiente especificación:
-> dfs(Grafo<T> grafo): ListaGenerica <T> // Retorna una lista de vértices con el recorrido en profundidad del grafo recibido como parámetro.
-> bfs(Grafo<T> grafo): ListaGenerica <T>// Retorna una lista de vértices con el recorrido en amplitud del grafo recibido como parámetro. */

package practica6;

public class Recorridos<T> {

	public ListaGenerica<Vertice<T>> dfs (Grafo<T> grafo){
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<Vertice<T>> lista = new ListaEnlazadaGenerica<>();
		for (int i=1; i<=grafo.listaDeVertices().tamanio(); i++) {
			if (!marca[i])
				dfs(i, grafo, lista, marca);
		}
		return lista;
	} 
	
	
	private void dfs (int i, Grafo<T> grafo, ListaGenerica<Vertice<T>> lista, boolean[] marca) {	
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i); 
		
		lista.agregarFinal(v); 
		
		ListaGenerica<Arista<T>> adyacentes = grafo.listaDeAdyacentes(v); 
		adyacentes.comenzar();
		while (!adyacentes.fin()) {
			int j = adyacentes.proximo().verticeDestino().getPosicion();
			if (!marca[j]) {
				this.dfs(j, grafo, lista, marca);
			}
		}
	}
	
	
	
	public ListaGenerica<Vertice<T>> bfs (Grafo<T> grafo){
		boolean[] marca = new boolean[grafo.listaDeVertices().tamanio()+1];
		ListaEnlazadaGenerica<Vertice<T>> lista = new ListaEnlazadaGenerica<>();
		for (int i =  1; i <= grafo.listaDeVertices().tamanio(); i++) {
			if (!marca[i]) {
				this.bfs(i, grafo, lista, marca);
			}
		}
		return lista;
	}
	
	
	private void bfs (int i, Grafo<T> grafo, ListaGenerica<Vertice<T>> lista, boolean[] marca) {	
		marca[i] = true;
		ListaGenerica<Arista<T>> adyacentes = null;
		ColaGenerica<Vertice<T>> cola = new ColaGenerica<Vertice<T>>();
		cola.encolar(grafo.listaDeVertices().elemento(i));
		
		while (!cola.esVacia()) {
			Vertice<T> v = cola.desencolar();
			
			lista.agregarFinal(v);
			
			adyacentes = grafo.listaDeAdyacentes(v);
			adyacentes.comenzar();
			
			while (!adyacentes.fin()) {
				Arista<T> aristaActual = adyacentes.proximo();
				int j = aristaActual.verticeDestino().getPosicion();
				if (!marca[j]) {
					Vertice<T> vertice = aristaActual.verticeDestino();
					marca[j] = true;
					cola.encolar(vertice);
				}
			}
		}
	}
	
}
