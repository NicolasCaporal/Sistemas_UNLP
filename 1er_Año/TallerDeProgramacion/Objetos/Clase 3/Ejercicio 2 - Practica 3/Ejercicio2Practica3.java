/*
B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro.
 */

package Practica3;

/**
 *
 * @author vsanz
 */
public class Ejercicio2Practica3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        String bio1 = "Herbert Schildt es un autor, programador y músico estadounidense de informática...";
        Autor autor1 = new Autor("Herbert Schildt", bio1, "Chicago, EEUU");
        
        Libro libro1= new  Libro("Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014, autor1,  
                                 "978-0071809252", 21.72);
        
        
        String bio2 = "John Horton Conway fue un prolífico matemático británico, especialista en la teoría de grupos...";
        Autor autor2 = new Autor("John Horton", bio2, "Liverpool, RU");
        
        Libro libro2= new Libro("Learning Java by Building Android Games",  
                                "CreateSpace Independent Publishing", 
                                 autor2, "978-1512108347");
        
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro 2: " + libro2.getPrecio());
        System.out.println("Año edición del libro 2: " + libro2.getAñoEdicion());
        Libro libro3= new Libro(); 
    }
    
}

