/* Implemente en la clase Parcial el metodo resolver que recibe un arbol binario de enteros positivos y un
 numero entero y devuelve un camino que cumple con la siguiente condicion: 
 la cantidad de numeros pares que contenga dicho camino debe ser mayor o igual al parametro "min".
 Si existen varios caminos que cumplen la condicion, el metodo debe devolver el primer camino que encuentre.
 Firma: ListaGenerica<Integer> resolver(ArbolBinario<Integer> ab, int min)*/

public class Parcial4 {
	
	    public  ListaGenerica<Integer> resolver (ArbolBinario<Integer> ab, int min){
	        ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
	        resolverP(ab, min, lista);
	        return lista;
	    }

	    private  Boolean resolverP (ArbolBinario<Integer> arbol, int min, ListaGenerica<Integer> lista){
	        
	        int dato = arbol.getDato();
	        lista.agregarFinal(dato);

	         if (arbol.esHoja()){
	            boolean rta;
	            if (min <= 0)
	                rta = true;
	            else 
	                rta = false;
	            return rta;
	         }

	        int par = 0;
	        if (dato % 2 == 0){
	            par = 1;
	        }

	        boolean resultado = true;
	        boolean seguir = true;
	        if (arbol.tieneHijoIzquierdo()){
	            resultado = resolverP(arbol.getHijoIzquierdo(), min-par, lista);

	            if (!resultado){
	                lista.eliminarEn(lista.tamanio());
	            } else {
	                seguir = false;
	            }

	        }

	        if ((arbol.tieneHijoDerecho()) && (seguir)){
	            resultado = resolverP(arbol.getHijoDerecho(), min-par, lista);

	            if (!resultado){
	                lista.eliminarEn(lista.tamanio());
	            }
	        }

	        return resultado;
        }
	    
}

