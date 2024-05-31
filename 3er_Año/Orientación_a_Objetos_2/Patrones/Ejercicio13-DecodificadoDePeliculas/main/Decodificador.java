package ar.edu.info.unlp.ejercicioDemo;

import java.util.ArrayList;
import java.util.List;

public class Decodificador {
    private Criterio criterio;
    private List<Pelicula> grilla;
    private List<Pelicula> reproducidas;

    public Decodificador(){
        this.grilla = new ArrayList<Pelicula>();
        this.reproducidas = new ArrayList<Pelicula>();
        this.criterio = new CriterioPorNovedad();
    }

    public Decodificador(List<Pelicula> grilla){
        this.grilla = grilla;
        this.reproducidas = new ArrayList<Pelicula>();
        this.criterio = new CriterioPorNovedad();
    }

    public List<Pelicula> recomendarPeliculas(){
        return this.criterio.recomendarPeliculas(this);
    }

    public void configurarCriterio(Criterio criterio){
        this.criterio = criterio;
    }

    protected List<Pelicula> getGrilla(){
        return this.grilla;
    }

    protected List<Pelicula> getReproducidas(){
        return this.reproducidas;
    }

    public void agregarGrilla(Pelicula pelicula){
        this.grilla.add(pelicula);
    }

    public void reproducir(Pelicula pelicula){
        this.reproducidas.add(pelicula);
    }





}
