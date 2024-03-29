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
					encontro = dfs(verticesCiudades[0], mapa, lista, marca, ciudad2) ;
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
				rta[0] = ciudadActual.getPosicion();
				nro += 1;
			} else if (ciudadActual.dato().equals(ciudad2)){
				rta[1] = ciudadActual.getPosicion();
				nro += 1;
			}
		}

		if (nro == 2)
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
			
			ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
			
			vertices.comenzar();
			Vertice<String> ciudadActual = vertices.proximo();
			while (!vertices.fin()) {
				ciudades.comenzar();
				while(!ciudades.fin()) {
					if (ciudadActual.dato().equals(ciudades.proximo())){
						marca[ciudadActual.getPosicion()] = true;
					}
				}
				ciudadActual = vertices.proximo();
			}
			
			
			lista.agregarFinal(ciudad1);
			for (int i = 1; i <= vertices.tamanio(); i++) {
				if ((!marca[i]) && (!encontro)) {				
					encontro = dfs(verticesCiudades[0], mapa, lista, marca, ciudad2);
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
	
	

	/* El método caminoMasCorto(String ciudad1, String ciudad2): ListaGenerica<String> //
	Retorna la lista de ciudades que forman el camino más corto para llegar de ciudad1 a ciudad2, si no
	existe camino retorna la lista vacía. (Las rutas poseen la distancia). (Sin tener en cuenta el
	combustible) */
	public ListaGenerica<String> caminoMasCorto (String ciudad1, String ciudad2){
		ListaGenerica<String> camActual = new ListaEnlazadaGenerica<String>();
		ListaGenerica<String> camMinimo = new ListaEnlazadaGenerica<String>();

		
		int[] verticesCiudades = buscarCiudades(mapa.listaDeVertices(), ciudad1, ciudad2);
				
		if (verticesCiudades != null) {
			boolean encontro = false;
			boolean[] marca = new boolean[mapa.listaDeVertices().tamanio() + 1];
			
			ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
			
			
			vertices.comenzar();
			camActual.agregarFinal(ciudad1);
			for (int i = 1; i<= vertices.tamanio(); i++) {
				if (!marca[i] && (!encontro)) {
					dfsMinimo(verticesCiudades[0], mapa, camActual, camMinimo, 0, Integer.MAX_VALUE, marca, ciudad2);
				}
			}
			
			if (camActual.tamanio() == 1) {
				camActual.eliminarEn(camActual.tamanio());
				System.out.println("No se puede llegar desde " + ciudad1 + " hasta " +  ciudad2);
				return camActual;
				
			} else {
				System.out.println("Proceso existoso");
			}
			
		} else {
			System.out.println("Alguna de las 2 ciuadades no existe");
		}
		
		return camMinimo;
	}
	
	
	private int dfsMinimo (int i, Grafo<String> mapa, ListaGenerica<String> camActual, ListaGenerica<String> camMinimo, int valorActual, int valorMinimo, boolean[] marca, String ciudad2) {
		marca[i] = true;
		Vertice<String> vertice = mapa.listaDeVertices().elemento(i);
		

		if (vertice.dato().equals(ciudad2)) {

			if (valorActual < valorMinimo) {
				camMinimo = camActual.clonar();
				valorMinimo = valorActual;
				marca[i] = false;
			}
			
		} else {
			
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(vertice);
			
			adyacentes.comenzar();
			int sumaActual = valorActual;
			int minimoLocal = valorMinimo;

			while (!adyacentes.fin()) {

				Arista<String> arista = adyacentes.proximo();
				sumaActual = valorActual + arista.peso();

				Vertice<String> destino = arista.verticeDestino();
				
				int j = destino.getPosicion();
				camActual.agregarFinal(destino.dato());
				
				if (!marca[j])
					minimoLocal = dfsMinimo(j, mapa, camActual, camMinimo, sumaActual, valorMinimo, marca, ciudad2);
				

				if (minimoLocal < valorMinimo)
					valorMinimo = minimoLocal;
				
				camActual.eliminarEn(camActual.tamanio());
			
				sumaActual = sumaActual - arista.peso();
			}
			marca[i] = false;
		}
				
		return valorMinimo;
	}
	
	

	/*El método caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto):
	ListaGenerica<String> // Retorna la lista de ciudades que forman un camino para llegar de ciudad1
	a ciudad2. El auto no debe quedarse sin combustible y no puede cargar. Si no existe camino retorna la
	lista vacía. */
	
	public ListaGenerica<String> caminoSinCargarCombustible(String ciudad1, String ciudad2, int tanqueAuto){
		ListaGenerica<String> lista = new ListaEnlazadaGenerica<String>();
		
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		int[] verticesCiudades = buscarCiudades(vertices, ciudad1, ciudad2);
		
		if (verticesCiudades != null) {
			boolean[] marca = new boolean[vertices.tamanio() +1];
			boolean encontro = false;
			
			encontro = dfsSinCargarCombustible(verticesCiudades[0], mapa, lista, marca, ciudad2, tanqueAuto);
			
			
			if (encontro) {
				System.out.println("Proceso existoso");
			} else {
				System.out.println("No se puede llegar desde " + ciudad1 + " hasta " +  ciudad2);
			}
			
		} else {
			System.out.println("Alguna de las dos ciudades no existia");
		}
	
		return lista;	
	}
	

	private boolean dfsSinCargarCombustible(int i, Grafo<String> mapa, ListaGenerica<String> lista, boolean[] marca, String ciudad2, int tanque) {
		
		boolean encontro = false;
		marca[i] = true;
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();

		Vertice<String> vertice = vertices.elemento(i);
		
		if (vertice.dato().equals(ciudad2)) {
			encontro = true;
			lista.agregarFinal(vertice.dato());

			
		} else {
		
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(vertice);
			adyacentes.comenzar();
			int naftaPrevia = tanque;
			
			while ((!adyacentes.fin()) && (!encontro)){
				Arista<String> arista = adyacentes.proximo();
				
				tanque = naftaPrevia - arista.peso();
				
				if (tanque >= 0) {
					
					Vertice<String> destino = arista.verticeDestino();
					int j = destino.getPosicion();
					if (!marca[j]) {
						lista.agregarFinal(vertice.dato());
						encontro = dfsSinCargarCombustible(j, mapa, lista, marca, ciudad2, tanque);
					}
				}
			}
			
			if (!encontro) {
				lista.eliminarEn(lista.tamanio());
				marca[i] = false;
			}

		}
		return encontro;
	}



	/* El método caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2, int
	tanqueAuto): ListaGenerica<String> // Retorna la lista de ciudades que forman un camino para
	llegar de ciudad1 a ciudad2 teniendo en cuenta que el auto debe cargar la menor cantidad de veces. El
	auto no se debe quedar sin combustible en medio de una ruta, además puede completar su tanque al
	llegar a cualquier ciudad. Si no existe camino retorna la lista vacía */

	public ListaGenerica<String> caminoConMenorCargaDeCombustible (String ciudad1, String ciudad2, int tanqueAuto){
		
		ListaGenerica<String> camActual = new ListaEnlazadaGenerica<String>();
		ListaGenerica<String> camMinimo = new ListaEnlazadaGenerica<String>();
		
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		int[] verticesCiudades = buscarCiudades(vertices, ciudad1, ciudad2);

		if (verticesCiudades != null) {
			boolean[] marca = new boolean[vertices.tamanio() + 1];
			
			dfsMenorCombustible(verticesCiudades[0], mapa, marca, camActual, camMinimo, 0, Integer.MAX_VALUE, tanqueAuto, tanqueAuto, ciudad2);
		}
		
		return camMinimo;
	}
		
	
	private int dfsMenorCombustible (int i, Grafo<String> mapa, boolean[] marca, ListaGenerica<String> camActual, ListaGenerica<String> camMinimo, int valorActual, int valorMinimo, int capacidadTanque, int tanqueAct, String ciudad2) {
		
		marca[i] = true;
		int minimo = valorMinimo;
		ListaGenerica<Vertice<String>> vertices = mapa.listaDeVertices();
		Vertice<String> vertice = vertices.elemento(i);
		
		System.out.println(vertice.dato() + " " + tanqueAct);
		
		if (vertice.dato().equals(ciudad2)) {
			if (valorActual < valorMinimo) {
				valorMinimo = valorActual;
				camMinimo = camActual.clonar();
				marca[i] = false;
				System.out.println("Actualiza -> " + valorMinimo);

			}
			
		} else {
			
			ListaGenerica<Arista<String>> adyacentes = mapa.listaDeAdyacentes(vertice);
			
			adyacentes.comenzar();
			while (!adyacentes.fin()) {
				
				Arista<String> arista = adyacentes.proximo();
				
				if (tanqueAct - arista.peso() < 0) {
					valorActual += 1;
					tanqueAct = capacidadTanque;
					System.out.println("Cargo el tanque en " + vertice.dato());
				}
					
				if (tanqueAct - arista.peso() >= 0) {
					tanqueAct = tanqueAct - arista.peso();
					

					camActual.agregarFinal(vertice.dato()); 
					
					Vertice<String> destino = arista.verticeDestino();
					int j = destino.getPosicion();
					
					if (!marca[j]) {
						System.out.println(vertice.dato() + "---" + arista.peso() + "--> " + destino.dato());
						minimo = dfsMenorCombustible(j, mapa, marca, camActual, camMinimo, valorActual, valorMinimo, capacidadTanque, tanqueAct, ciudad2);
					}
					
					if (minimo < valorMinimo)
						valorMinimo = minimo;
					
					tanqueAct = tanqueAct + arista.peso();
				
					camActual.eliminarEn(camActual.tamanio());
				}
				
			}
			
			marca[i] = false;
		}
		
	return valorMinimo;
	}
}
	
	