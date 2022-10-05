
package Practica3;

public class Cliente {
    private String nombre;
    private int DNI;
    private int edad; 
    
    public Cliente(String nombre, int DNI, int edad){
        this.nombre = nombre;
        this.DNI = DNI;
        this.edad = edad; 
    }
    
    public Cliente(){
     
    }

    public int getDNI() {
        return DNI;
    }

    public int getEdad() {
        return edad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String toString(){
        String aux; 
        aux = "Nombre: " + nombre + " DNI: " + DNI + " Edad: " + edad;
        return aux;
    }
    
}