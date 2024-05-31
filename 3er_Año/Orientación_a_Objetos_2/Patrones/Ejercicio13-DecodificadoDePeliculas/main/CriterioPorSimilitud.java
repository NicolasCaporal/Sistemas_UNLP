package ar.edu.info.unlp.ejercicioDemo;

import java.util.List;

public class CriterioPorSimilitud extends Criterio {

    @Override
    public List<Pelicula> recomendar(Decodificador deco) {
        return deco.getReproducidas().stream()
                .flatMap(peli -> peli.getSimilares().stream())
                .distinct()
                .sorted((peli2, peli1) -> Integer.compare(peli1.getAnioEstreno(), peli2.getAnioEstreno()))
                .toList();
    }

}