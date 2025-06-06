package io.github.unlp;

public class Componente {
    private String nombre;
    private String desc;
    private double precio;
    private double consumo;

    public Componente(String nombre, String desc, double precio, double consumo) {
        this.nombre = nombre;
        this.desc = desc;
        this.precio = precio;
        this.consumo = consumo;
    }

    protected String getNombre() {
        return this.nombre;
    }
    protected String getDesc() {
        return this.desc;
    }
    protected double getPrecio() {
        return this.precio;
    }
    protected double getConsumo() {
        return this.consumo;
    }


    public boolean equals(Object o) {
        return o.toString().equals(this.toString());
    }


}