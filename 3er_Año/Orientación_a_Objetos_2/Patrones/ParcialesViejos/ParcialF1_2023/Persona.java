package Parcial10_06_23;

import java.util.ArrayList;
import java.util.List;

public class Persona {
    private int edad;
    private List<Vehiculo> vehiculos;
    private Promocion promocion;

    public Persona (int edad, Promocion promo){
        this.edad = edad;
        this.vehiculos = new ArrayList<Vehiculo>();
        this.promocion = promo;
    }

    public double calcularCosto(){
        return this.vehiculos.stream().mapToDouble(vehiculo -> vehiculo.calcularCosto(this.edad)).sum() - this.promocion.calcularPromocion(this);
    }

    public void addVehiculo(Vehiculo vehiculo){
        this.vehiculos.add(vehiculo);
    }

    public int getCantPolizas(){
        return this.vehiculos.size();
    }

    public double getSeguroMasEconomico() {
        return this.vehiculos.stream()
            .max((v2, v1) -> Double.compare(v1.calcularCosto(this.edad), v2.calcularCosto(this.edad)))
            .map(v -> v.calcularCosto(this.edad))
            .orElse(0.0); 
    }
    
    
    public void setPromocion(Promocion promo){
        this.promocion = promo;
    }

}