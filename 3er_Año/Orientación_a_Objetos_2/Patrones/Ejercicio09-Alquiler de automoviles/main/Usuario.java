package org.example;

public class Usuario {

    private String nombre;
    private ArraList<AutoEnAlquiler> alquileres;

    public Usuario(String nombre, ArraList<AutoEnAlquiler> alquileres) {
        this.nombre = nombre;
        this.alquileres = alquileres;
    }
}
