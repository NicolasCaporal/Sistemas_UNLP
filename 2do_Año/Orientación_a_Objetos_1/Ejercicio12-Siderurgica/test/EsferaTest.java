package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class EsferaTest {
	
	private Esfera esfera;
	
	@BeforeEach
	public void setUp() {
		esfera = new Esfera("Hierro", "Rojo", 4);
	}
	
	@Test
	public void testConstructor() {
		assertEquals("Hierro", esfera.getMaterial());
		assertEquals("Rojo", esfera.getColor());
		assertEquals(4, esfera.getRadio());
	}
	
	@Test
	public void testVolumen() {
		double resultadoEsperado = 268.082573106329;
		assertEquals(resultadoEsperado, esfera.getVolumen());
	}
	
	@Test
	public void testSuperficie() {
		double resultadoEsperado = 201.06192982974676;
		assertEquals(resultadoEsperado, esfera.getSuperficie());
	}
	
}
