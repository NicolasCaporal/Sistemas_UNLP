package ar.edu.info.unlp.ejercicioDemo;

import java.util.List;

public class CriterioPorNovedad extends Criterio {

    @Override
    public List<Pelicula> recomendar(Decodificador deco) {
        return deco.getGrilla().stream()
                .sorted((p2, p1) -> Integer.compare(p1.getAnioEstreno(), p2.getAnioEstreno())).toList();
    }

}
