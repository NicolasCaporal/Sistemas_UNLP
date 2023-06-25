/* Ejercicio 6
Se quiere realizar un paseo en bicicleta por lugares emblemáticos de Oslo. Para esto se cuenta con un grafo de
bicisendas. Partiendo desde el “Ayuntamiento” hasta un lugar destino en menos de X minutos, sin pasar por
un conjunto de lugares que están restringidos.
Escriba una clase llamada VisitaOslo e implemente su método:
ListaGenerica<String> paseoEnBici(Grafo<String> lugares, String destino, int maxTiempo, ListaGenerica<String> lugaresRestringidos)

Notas:
	- El “Ayuntamiento” debe ser buscado antes de comenzar el recorrido para encontrar un camino.
	- De no existir camino posible, se debe retornar una lista vacía.
	- Debe retornar el primer camino que encuentre que cumple las restricciones. */

package practica6;

public class VisitaOslo {
	
	public ListaGenerica<String> paseoEnBici (Grafo<String> lugares, String destino, int maxTiempo, ListaGenerica<String> lugaresRestringidos){
		
		ListaGenerica<Vertice<String>> vertices = lugares.listaDeVertices();
		int[] posLugares = buscarLugares(vertices, "Ayuntamiento", destino);
		ListaGenerica<String> camino = new ListaEnlazadaGenerica<String>();
		if (posLugares != null) {
			
			boolean[] marca = new boolean[vertices.tamanio() + 1];
			marcarRestringidos(marca, lugaresRestringidos, vertices);
			
						
			dfs(posLugares[0], lugares, marca, 0, maxTiempo, camino, destino);
			
		}
		return camino;
	}
	
	private int[] buscarLugares (ListaGenerica<Vertice<String>> listaVertices, String lugar1, String lugar2) {
		
		int[] lugares = new int[2];
		int cant = 0;
		
		Vertice<String> v;
		listaVertices.comenzar();
		while ((!listaVertices.fin()) && (cant < 2)) {
			v = listaVertices.proximo();
			if (v.dato().equals(lugar1)) {
				cant += 1;
				lugares[0] = v.getPosicion();
			} else if (v.dato().equals(lugar2)) {
				cant += 1;
				lugares[0] = v.getPosicion();
			}
		}
		
		if (cant < 2) {
			lugares = null;
		}
		
		return lugares;
	}
	
	
	private void marcarRestringidos(boolean[] marca, ListaGenerica<String> restringidos, ListaGenerica<Vertice<String>> vertices) {
		
		vertices.comenzar();
		
		Vertice<String> v;
		while (!vertices.fin()) {
			v = vertices.proximo();
			restringidos.comenzar();
			while (! restringidos.fin()) {
				if (v.dato().equals(restringidos.proximo())){
					marca[v.getPosicion()] = true;
				}
			}
		}
	}
	
	
	private boolean dfs(int i, Grafo<String> lugares, boolean[] marca, int tiempoActual, int tiempoMaximo, ListaGenerica<String> camino, String lugarDestino) {
		
		ListaGenerica<Vertice<String>> vertices = lugares.listaDeVertices();
		Vertice<String> vertice = vertices.elemento(i);
		marca[i] = true;
		boolean encontro = false;
		
		if (vertice.dato().equals(lugarDestino)) {
			encontro = true;
			
		} else {
			
			ListaGenerica<Arista<String>> adyacentes = lugares.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			while (!adyacentes.fin() && (!encontro)) {
				Arista<String> arista = adyacentes.proximo();
				if (tiempoActual + arista.peso() <= tiempoMaximo) {
					tiempoActual += arista.peso();
					
					Vertice<String> verticeDestino = arista.verticeDestino();
					camino.agregarFinal(verticeDestino.dato());
					int j = verticeDestino.getPosicion();
					
					if (!marca[j])
						encontro = dfs(j, lugares, marca, tiempoActual, tiempoMaximo, camino, lugarDestino);
					
					if (!encontro) {
						tiempoActual -= arista.peso();
						camino.eliminarEn(camino.tamanio());
					}
				}
			}
			marca[i] = false;
		}
			
		return encontro;	
	}	
}
	
	

