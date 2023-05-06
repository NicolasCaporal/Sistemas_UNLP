/* Implemente en la clase Parcial, que tiene como variable de instancia un arbol general<Integer>
El metodo: ListaGenerica<Integer> resolver() que devuelva en la lista la suma de los datos contenidos 
en los nodos del arbol que tienen un numero impar de hijos.
Realiza recorrido postorden */

public class Parcial{

    private ArbolGeneral<Integer> arbol;

    public Parcial (ArbolGeneral<Integer> arbol){
        this.arbol = arbol;
    }

    public ListaGenerica<Integer> resolver(){
    
        ListaGenerica<Integer> lista = new ListaEnlazadaGenerica<Integer>();
        resolverP(lista, this.arbol);

        return lista;
    
    }

    private Integer resolverP (ListaGenerica<Integer> lista, ArbolGeneral<Integer> arbol){

        int suma = 0;
        if (arbol.tieneHijos()){
            ListaGenerica<ArbolGeneral<Integer>> hijos = arbol.getHijos();
            hijos.comenzar();

            while (!hijos.fin()){
                suma += resolverP(lista, hijos.proximo());
            }

            int cantHijos = hijos.tamanio();

            if (cantHijos % 2 != 0)
                lista.agregarFinal(suma);            

        }    

        return arbol.getDato();
    }

}
