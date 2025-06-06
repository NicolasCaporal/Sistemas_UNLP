package io.github.unlp;

import java.util.ArrayList;
import java.util.List;

public class Catalogo {
    private ArrayList<Componente> catalogo;

    public Catalogo() {
        this.catalogo = new ArrayList<>();
    }

    public void setCatalogo(ArrayList<Componente> catalogo){
        this.catalogo = catalogo;
    }

    public Componente getComponente(String desc) {
        return this.catalogo.stream().filter(componente -> componente.getDesc().equals(desc)).findFirst().orElse(null);

    }
}