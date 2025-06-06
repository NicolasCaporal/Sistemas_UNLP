package io.github.unlp;

import java.util.ArrayList;
import java.util.List;

public class PC {
    private List<Componente> componentes;

    public PC(){
        this.componentes = new ArrayList<Componente>();
    }

    public void addComponente(Componente componente){
        this.componentes.add(componente);
    }

    public double calcularConsumo(){
        return this.componentes.stream().mapToDouble(c -> c.getConsumo()).sum();
    }

    public double calcularPrecio(){
        return this.componentes.stream().mapToDouble(c -> c.getPrecio()).sum();
    }
}
