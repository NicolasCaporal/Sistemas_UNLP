package ar.edu.info.unlp.ejercicioDemo;
import java.util.Comparator;
import java.util.List;

public class CriterioPorPuntaje extends Criterio {

    @Override
    public List<Pelicula> recomendar (Decodificador deco) {
        return deco.getGrilla().stream()
                .sorted(Comparator.comparing(Pelicula::getPuntaje)
                        .thenComparing(Pelicula::getAnioEstreno).reversed())
                .toList();
    }

}
