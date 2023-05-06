/* Implemente en la clase parcial el metodo Boolean esArbolCreciente (ArbolBinario<Integer> arbol)
que devuelve true si el +arbol es creciente, falso sino lo es.
Un arbol binario es creciente si para cada nivel de larbol la cantidad de nodos que
hay en ese nivel es igual al valor del nivel +1. Realice un recorrido por niveles. */


public class Parcial {

    public Boolean esArbolCreciente(ArbolBinario<Integer arbol){

        
        if (arbol.esVacio())
            return False;
        

        ColaGenerica<ArbolBinario<Integer>> cola = new ColaGenerica<ArbolBinario<Integer>>();
            
        int contador = 0;
        int nivel = 0;                
        
        boolean seguir = true;

        cola.encolar(arbol);
        cola.encolar(null);

        while (!cola.esVacia() && seguir){
            
            ArbolBinario<Integer> actual = cola.desencolar();

            if (actual != null){    
                contador += 1;

                if (arbol.tieneHijoIzquierdo)
                    cola.encolarHijoIzquierdo();

                if (a.tieneHijoDrecho)
                    cola.encolarHijoDerecho();


            } else if (!cola.esVacia) {
                
                cola.encolar(null);
                nivel ++;
                if (!contador = nivel)
                    seguir = false;    
                contador = 0;                

            }
        }

        return seguir;
  }
  
}
