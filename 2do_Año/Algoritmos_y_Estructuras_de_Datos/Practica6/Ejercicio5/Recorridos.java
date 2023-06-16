package ejercicio5practica6;


public class Recorridos <T> {
	public ListaGenerica<Vertice<T>> dfs (Grafo<T> grafo){
		boolean[]marca = new boolean[grafo.listaDeVertices().tamanio() + 1];
		ListaEnlazadaGenerica<Vertice<T>> lis = new ListaEnlazadaGenerica<Vertice<T>>();
		for (int i=1; i<=grafo.listaDeVertices().tamanio(); i++) {
			if (!marca[i])
				dfs(i,grafo,lis,marca);
		}
		return lis;
	}
	
	private void dfs (int i,Grafo<T> grafo,ListaEnlazadaGenerica<Vertice<T>> lis, boolean[] marca) {
		marca[i] = true;
		Vertice<T> v = grafo.listaDeVertices().elemento(i);
		lis.agregarFinal(v);
		ListaGenerica<Arista<T>> ady = grafo.listaDeAdyacentes(v);
		ady.comenzar();
		while (!ady.fin()) {
			int j = ady.proximo().verticeDestino().getPosicion();
			if (!marca[j])
				dfs(j,grafo,lis,marca);
		}
		
	}