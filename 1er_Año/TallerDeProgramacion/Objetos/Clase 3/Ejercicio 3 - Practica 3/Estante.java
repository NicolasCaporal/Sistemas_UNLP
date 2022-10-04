/*
3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
 */
package Practica3;

/**
 *
 * @author nicol
 */
public class Estante {
    private Libro [] libros;
    private int dimL;
    private int dimF;
    
    public Estante (){
        dimL = 0;
        dimF = 20;
        libros = new Libro[dimF];
    }
    
    public int cantidadLibros (){
        return dimL;
    }
    
    public boolean estaLleno (){
        return (dimL == dimF);
    }
    
    public void agregarLibro (Libro L){
        if (dimL < dimF){
            libros[dimL] = L;
            dimL++; 
        }
    }
    
    public Libro buscarLibro (String titulo){
        int i = 0;
        while ((i < dimL) && (libros[i].getTitulo() != titulo)){
            i++;
        }
        if (libros[i].getTitulo() == titulo){
            return libros[i];
        } else {
            return null;
        }
    }
}
