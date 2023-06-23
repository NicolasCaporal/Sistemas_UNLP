package practica6;

public class Mapa {
	private Grafo<String> mapa;
	
	public Mapa (Grafo<String> grafo) {
		this.mapa = grafo;
	}
	
	/* El método devolverCamino (String ciudad1, String ciudad2): ListaGenerica<String> //
	Retorna la lista de ciudades que se deben atravesar para ir de ciudad1 a ciudad2 en caso que se pueda
	llegar, si no retorna la lista vacía. (Sin tener en cuenta el combustible). */
	
	public ListaGenerica<String> devolverCamino (String ciudad1, String ciudad2){
		ListaGenerica<String> lista = new ListaEnlazadaGenerica<String>();
		
		int[] verticesCiudades = buscarCiudades(mapa.listaDeVertices(), ciudad1, ciudad2);		

		
		if (verticesCiudades != null) {	
			boolean encontro = false;
			boolean[] marca = new boolean[mapa.listaDeVertices().tamanio()+1];
			
			lista.agregarFinal(ciudad1);

			for (int i = 1; i <= mapa.listaDeVertices().tamanio(); i++) {
				if (!marca[i] && !encontro){
					encontro = dfs(verticeCiudad1.getPosicion(), mapa, lista, marca, ciudad2) ;
				}
			}
			
			if (encontro) {
				System.out.println("Proceso exitoso");
			} else {
				System.out.println("No se puede llegar desde " + ciudad1 + " hasta " +  ciudad2);
				lista.eliminarEn(lista.tamanio());
			}
			
			
		} else {
			System.out.println("Alguna de las 2 ciuades no existe");
		}
		
		return lista;
	}	
	
	private int[] buscarCiudades(ListaGenerica<Vertice<String>> vertices, String ciudad, String ciudad2){
		vertices.comenzar();

		int nro = 0;
		int[] rta = new int[2];

		Vertice<String> ciudadActual;
		while(!(vertices.fin())) {
			ciudadActual = vertices.proximo();
			if (ciudadActual.dato().equals(ciudad)){
				rta[0] = ciudadActual;
				nro += 1;
			} else if (cciudadActual.dato().equals(ciudad2)){
				rta[1] = ciudadActual;
				nro += 1;
			}
		}

		if (nro = 2)
			return rta;
		else
			return null;
	}
	
	
	private boolean dfs(int i, Grafo<String> mapa, ListaGenerica<String> lista, boolean[] marca, String ciudad2) {
		boolean encontro = false;
		marca[i] = true;
		Vertice<String> vertice = mapa.listaDeVertices().elemento(i);
		
		if (vertice.dato().equals(ciudad2)) {
			encontro = true;
			
		} else {
						
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(vertice); 
			
			adyacentes.comenzar();
			while (!adyacentes.fin() && (!encontro)) {
				Vertice<String> destino = adyacentes.proximo().verticeDestino();
				int j = destino.getPosicion();
				
				if (!marca[j]) {
					lista.agregarFinal(destino.dato());
					encontro = dfs(j, mapa, lista, marca, ciudad2);
					if (!lista.elemento(lista.tamanio()).equals(ciudad2))
						lista.eliminarEn(lista.tamanio());
				}
			}

		}
		return encontro;
	}
	
	
	/* El método devolverCaminoExceptuando (String ciudad1, String ciudad2,
	ListaGenerica<String> ciudades): ListaGenerica<String> // Retorna la lista de ciudades que
	forman un camino desde ciudad1 a ciudad2, sin pasar por las ciudades que están contenidas en la lista
	ciudades pasada por parámetro, si no existe camino retorna la lista vacía. (Sin tener en cuenta el
	combustible). */
	public ListaGenerica<String> devolverCaminoExceptuando (String ciudad1, String ciudad2, ListaGenerica<String> ciudades){
		
		ListaGenerica<String> lista = new ListaEnlazadaGenerica<String>();
		
		int[] verticesCiudades = buscarCiudades(mapa.listaDeVertices(), ciudad1, ciudad2);		

		
		if (verticesCiudades != null) {	
			boolean encontro = false;
			boolean[] marca = new boolean[mapa.listaDeVertices().tamanio()+1]; 
			
			lista.agregarFinal(ciudad1);
			for (int i = 1; i <= mapa.listaDeVertices().tamanio(); i++) {
				if ((!marca[i]) && (!encontro)) {				
					encontro = dfsExceptuando(verticeCiudad1.getPosicion(), mapa, lista, marca, ciudad2, ciudades);
				}
			}
			if (encontro) {
				System.out.println("Proceso exitoso");
			} else {
				System.out.println("No se puede llegar desde " + ciudad1 + " hasta " +  ciudad2);
				lista.eliminarEn(lista.tamanio());
			}
			
			
		} else {
			System.out.println("Alguna de las 2 ciuades no existe");
		}
		
		return lista;
	}
	
	private boolean dfsExceptuando(int i, Grafo<String> mapa, ListaGenerica<String> lista, boolean[] marca, String ciudad, ListaGenerica<String> ciudadesAEvitar) {
		
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		Vertice<String> ciudadActual = vertices.elemento(i);
		boolean encontro = false;
		
		if (ciudadActual.dato().equals(ciudad)) {
			encontro = true;
			
		} else {
			
			ciudadesAEvitar.comenzar();
			while(!ciudadesAEvitar.fin()) {
				if (ciudadActual.dato().equals(ciudadesAEvitar.proximo())){
					return false;
				}
			}
			
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(ciudadActual);
			
			adyacentes.comenzar();
			
			while (!adyacentes.fin() && !encontro) {
				Vertice<String> destino = adyacentes.proximo().verticeDestino();
				int j = destino.getPosicion();
				
				if (!marca[j]) {
					lista.agregarFinal(destino.dato());
					encontro = dfsExceptuando(j, mapa, lista, marca, ciudad, ciudadesAEvitar);
					if (!lista.elemento(lista.tamanio()).equals(ciudad)) {
						lista.eliminarEn(lista.tamanio());
					}
				}
			}
			
		}
		return encontro;
	}
	
	
	/* El método caminoMasCorto(String ciudad1, String ciudad2): ListaGenerica<String> //
	Retorna la lista de ciudades que forman el camino más corto para llegar de ciudad1 a ciudad2, si no
	existe camino retorna la lista vacía. (Las rutas poseen la distancia). (Sin tener en cuenta el
	combustible) */
	public ListaGenerica<String> caminoMasCorto (String ciudad1, String ciudad2){
		
				
		int[] verticesCiudades = buscarCiudades(mapa.listaDeVertices(), ciudad1, ciudad2);	

		int costo[] = new int[mapa.listaDeVertices().tamanio()+1]; //D
		int anterior[] = new int[mapa.listaDeVertices().tamanio()+1]; //P
		int iCiudad1 = verticeCiudad1.getPosicion();
		boolean[] marca = new boolean[mapa.listaDeVertices().tamanio()+1];
		
		if (verticesCiudades != null) {		
			dijkstra(iCiudad1, costo, anterior, marca);
		} else {
			System.out.println("Alguna de las 2 ciudades no existe");
		}
		
		ListaGenerica<String> lista = new ListaEnlazadaGenerica<String>();
		int i = verticeCiudad2.getPosicion();
		if (costo[i] != 9999) {
			
			while(costo[i] != 0) {
				lista.agregarInicio(mapa.listaDeVertices().elemento(i).dato());
				i = anterior[i];
			}
			lista.agregarInicio(ciudad1);
			System.out.println("Proceso exitoso");

		} else {
			System.out.println("No se puede llegar desde " + ciudad1 + " hasta " + ciudad2);
		}
		
		return lista;
	}
	
	public void dijkstra (int ciudadInicio, int[] costo, int[] anterior, boolean[] marca) {
		
		// Inicializo la tabla
		for(int i = 0; i <= mapa.listaDeVertices().tamanio(); i++) {
			costo[i] = 9999;
			anterior[i] = 0;
		}
		costo[ciudadInicio] = 0;
		
		// Procesamiento
		for (int h = 1; h <= mapa.listaDeVertices().tamanio(); h++) {
			
			int min = Integer.MAX_VALUE;
			int iMin = -1;
			for (int j = 1; j <= mapa.listaDeVertices().tamanio(); j++) {
				if (costo[j] < min && !marca[j]) {
					min = costo[j];
					iMin = j;
				}
				if (iMin == 0)
					System.out.println("I MIN ES 0 !!!!!!!");
			}
			
			marca[iMin] = true;
			Vertice<String> vertice = mapa.listaDeVertices().elemento(iMin);
			
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(vertice);
			
			int costoActual;
			int costoAvance;
			int costoDestino;
					
			adyacentes.comenzar();
			while(!adyacentes.fin()) {
				
				Arista<String> arista = adyacentes.proximo();
				Vertice<String> destino = arista.verticeDestino();
				int indiceDestino = destino.getPosicion();
				
				if (!marca[indiceDestino]) {
					 costoActual = costo[iMin];
					 costoAvance = costoActual + arista.peso(); 
					 costoDestino = costo[indiceDestino];
					 
					 if (costoAvance < costoDestino) {
						 costo[indiceDestino] = costoAvance;
						 anterior[indiceDestino] = iMin;
					 }
					 
				}
				 
			}
		}
		
		
	}
}