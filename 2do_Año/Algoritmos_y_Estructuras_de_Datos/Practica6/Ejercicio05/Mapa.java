package practica6;

public class mapa {
	private Grafo<String> mapa;
	
	public mapa (Grafo<String> grafo) {
		this.mapa = grafo;
	}
	
	/* El método devolverCamino (String ciudad1, String ciudad2): ListaGenerica<String> //
	Retorna la lista de ciudades que se deben atravesar para ir de ciudad1 a ciudad2 en caso que se pueda
	llegar, si no retorna la lista vacía. (Sin tener en cuenta el combustible). */
	
	public ListaGenerica<String> devolverCamino (String ciudad1, String ciudad2){
		ListaGenerica<String> lista = new ListaEnlazadaGenerica<String>();
		
		Vertice<String> verticeCiudad1 = buscarCiudad(mapa.listaDeVertices(), ciudad1);		
		Vertice<String> verticeCiudad2 = buscarCiudad(mapa.listaDeVertices(), ciudad2);
		
		
		if (verticeCiudad1 != null && verticeCiudad2 != null) {	
			boolean encontro = false;
			boolean[] marca = new boolean[mapa.listaDeVertices().tamanio()+1];
			
			for (int i = 1; i <= mapa.listaDeVertices().tamanio()+1; i++) {
				if (!marca[i]){
					encontro = dfs(verticeCiudad1.getPosicion(), mapa, lista, marca, ciudad2) ;
				}
			}
			
			if (encontro) {
				System.out.println("Proceso exitoso");
			} else {
				System.out.println("No se puede llegar desde " + ciudad1 + " hasta " +  ciudad2);
			}
			
			
		} else {
			System.out.println("Alguna de las 2 ciuades no existe");
		}
		
		return lista;
	}	
	
	private Vertice<String> buscarCiudad(ListaGenerica<Vertice<String>> vertices, String ciudad){
		vertices.comenzar();
		Vertice<String> ciudadActual = vertices.proximo();
		while(!(vertices.fin())) {
			ciudadActual = vertices.proximo();
			if (ciudadActual.dato().equals(ciudad)){
				return ciudadActual;
			}
		}
		return null;
	}
	
	
	private boolean dfs(int i, Grafo<String> mapa, ListaGenerica<String> lista, boolean[] marca, String ciudad2) {
		boolean encontro = false;
		marca[i] = true;
		Vertice<String> vertice = mapa.listaDeVertices().elemento(i);
		
		if (vertice.dato().equals(ciudad2)) {
			encontro = true;
		} else {
			lista.agregarFinal(vertice.dato());
			
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(vertice); 
			adyacentes.comenzar();
			while (!adyacentes.fin() && (!encontro)) {
				Vertice<String> destino = adyacentes.proximo().verticeDestino();
				int j = destino.getPosicion();

				if (!marca[j]) {
					lista.agregarFinal(destino.dato());
					dfs(j, mapa, lista, marca, ciudad2);
					lista.eliminarEn(lista.tamanio());
				}
			}

		}
		return encontro;
	}
}