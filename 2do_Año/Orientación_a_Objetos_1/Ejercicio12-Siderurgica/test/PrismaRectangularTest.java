package ar.edu.unlp.info.oo1.ejercicio12;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;


public class PrismaRectangularTest {
	
	private PrismaRectangular prisma;
	
	@BeforeEach
	public void setUp() {
		prisma = new PrismaRectangular("Hierro", "Rojo", 4, 2, 10);
	}
	
	@Test
	public void testConstructor() {
		assertEquals("Hierro", prisma.getMaterial());
		assertEquals("Rojo", prisma.getColor());
		assertEquals(4, prisma.getLadoMayor());
		assertEquals(2, prisma.getLadoMenor());
		assertEquals(10, prisma.getAltura());
	}
	
	@Test
	public void testVolumen() {
		double resultadoEsperado = 80;
		assertEquals(resultadoEsperado, prisma.getVolumen());
	}
	
	@Test
	public void testSuperficie() {
		double resultadoEsperado = 136;
		assertEquals(resultadoEsperado, prisma.getSuperficie());
	}
	
}
