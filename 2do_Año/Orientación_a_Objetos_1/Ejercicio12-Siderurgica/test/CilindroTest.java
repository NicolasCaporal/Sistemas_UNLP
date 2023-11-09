package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class CilindroTest {
	
	private Cilindro cilindro;
	
	@BeforeEach
	public void setUp() {
		cilindro = new Cilindro("Hierro", "Rojo", 2, 5);
	}
	
	@Test
	public void testConstructor() {
		assertEquals("Hierro", cilindro.getMaterial());
		assertEquals("Rojo", cilindro.getColor());
		assertEquals(2, cilindro.getRadio());
		assertEquals(5, cilindro.getAltura());
	}
	
	@Test
	public void testVolumen() {
		double resultadoEsperado = 62.83185307179586;
		assertEquals(resultadoEsperado, cilindro.getVolumen());
	}
	
	@Test
	public void testSuperficie() {
		double resultadoEsperado = 87.96459430051421;
		assertEquals(resultadoEsperado, cilindro.getSuperficie());
	}
	
}
