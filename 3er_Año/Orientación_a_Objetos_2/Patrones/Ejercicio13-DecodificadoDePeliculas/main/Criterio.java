package ar.edu.info.unlp.ejercicioDemo;

import java.util.List;

public abstract class Criterio {

    public List<Pelicula> recomendarPeliculas(Decodificador deco){
        return this.recomendar(deco).stream()
                .filter(pelicula -> !deco.getReproducidas().contains(pelicula))
                .limit(3).toList();
    }

    public abstract List<Pelicula> recomendar(Decodificador deco);

}
