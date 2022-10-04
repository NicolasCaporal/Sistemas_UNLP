/*
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
 */
package Practica3;

import PaqueteLectura.Lector;

/**
 *
 * @author nicol
 */
public class Ejercicio3Practica3 {
    public static Libro leerLibro (){
        
        System.out.print("Ingrese titulo: ");
        String titulo = Lector.leerString();
        
        System.out.print("Ingrese editorial: ");
        String editorial = Lector.leerString();
        
        System.out.print("Ingrese año de edicion: ");
        int anio = Lector.leerInt();
        
        Autor autor = new Autor();
        System.out.print("Ingrese autor: ");
        autor.setNombre(Lector.leerString());  
        
        System.out.print("Ingrese ISBN: ");
        String isbn = Lector.leerString();
        
        System.out.print("Ingrese PRECIO: ");
        double precio = Lector.leerDouble();
        
        Libro L = new  Libro(titulo, editorial, anio, autor, isbn, precio); 
        
        return L;
    }
    
    public static void main (String[] args){
        Estante estante = new Estante();
        
        Libro libro;      
        
        for (int i = 0; i < 4; i++){
            libro = leerLibro();
            estante.agregarLibro(libro);
        }
        
        boolean estaMujercitas;
        System.out.println("Autor/a de Mujercitas: " + estante.buscarLibro("Mujercitas").getPrimerAutor());
        
    }
    
}
