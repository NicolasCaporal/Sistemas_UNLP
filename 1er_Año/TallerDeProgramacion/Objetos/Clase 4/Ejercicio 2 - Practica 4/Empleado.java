/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica4;

public abstract class Empleado {
    private String nombre;
    private double sueldoBasico;
    private int antiguedad;
    
    public Empleado (String nombre, double sueldoBasico, int antiguedad){
        this.nombre = nombre;
        this.sueldoBasico = sueldoBasico;
        this.antiguedad = antiguedad;
    }
    
    public void setNombre (String nombre){
        this.nombre = nombre;
    }
    
    public void setSueldoBasico (double sueldoBasico){
        this.sueldoBasico = sueldoBasico;
    }
    
    public void setAntiguedad (int antiguedad){
        this.antiguedad = antiguedad;
    }
    
    public String getNombre() {
        return nombre;
    }

    public double getSueldoBasico() {
        return sueldoBasico;
    }

    public int getAntiguedad() {
        return antiguedad;
    }
    
    public abstract double calcularEfectividad();
    
    public double calcularSueldoACobrar(){
        double adicional = sueldoBasico * 0.1 * antiguedad;
        return sueldoBasico + adicional;
    }
    
    public String toString (){
        return "Nombre: " + nombre + " Efectividad: " + this.calcularEfectividad() + " Sueldo a cobrar: " + this.calcularSueldoACobrar();
    }
    
}
