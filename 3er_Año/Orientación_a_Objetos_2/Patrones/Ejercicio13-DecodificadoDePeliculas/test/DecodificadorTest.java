package ar.edu.info.unlp.ejercicioDemo;

import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import java.util.Arrays;
import java.util.List;

class DecodificadorTest {
	private Decodificador decodificador;
	private Pelicula thor;
	private Pelicula capitanAmerica;
	private Pelicula ironMan;
	private Pelicula dunkirk;
	private Pelicula rocky;
	private Pelicula rambo;

	@BeforeEach
	void setUp() {
		thor = new Pelicula("Thor", 7.9, 2007);
		capitanAmerica = new Pelicula("Capitan America", 7.8, 2016);
		ironMan = new Pelicula("Iron Man", 7.9, 2010);
		dunkirk = new Pelicula("Dunkirk", 7.9, 2017);
		rocky = new Pelicula("Rocky", 8.1, 1976);
		rambo = new Pelicula("Rambo", 7.8, 1979);

		thor.addSimilar(capitanAmerica);
		thor.addSimilar(ironMan);
		capitanAmerica.addSimilar(thor);
		capitanAmerica.addSimilar(ironMan);
		ironMan.addSimilar(thor);
		ironMan.addSimilar(capitanAmerica);
		rocky.addSimilar(rambo);
		rambo.addSimilar(rocky);

		List<Pelicula> grilla = Arrays.asList(thor, capitanAmerica, ironMan, dunkirk, rocky, rambo);
		decodificador = new Decodificador(grilla);
		decodificador.reproducir(thor);
		decodificador.reproducir(rocky);
	}

	@Test
	void testSugerenciasPorSimilaridad() {
		decodificador.configurarCriterio(new CriterioPorSimilitud());
		List<Pelicula> sugerencias = decodificador.recomendarPeliculas();
		assertTrue(sugerencias.containsAll(Arrays.asList(this.capitanAmerica, ironMan, rambo)));
	}

	@Test
	void testSugerenciasPorPuntaje() {
		decodificador.configurarCriterio(new CriterioPorPuntaje());
		List<Pelicula> sugerencias = decodificador.recomendarPeliculas();
		assertTrue(sugerencias.containsAll(Arrays.asList(dunkirk, ironMan, capitanAmerica)));

	}
}
