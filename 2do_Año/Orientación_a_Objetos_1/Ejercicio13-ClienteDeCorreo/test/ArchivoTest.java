package ar.edu.unlp.info.oo1.ejercicio13;

import static org.junit.jupiter.api.Assertions.assertEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ArchivoTest {
	private Archivo archivo;
	
	@BeforeEach
	public void setUp() {
		archivo = new Archivo("eje13.java");
	}
	
	@Test
	public void testNombre() {
		assertEquals("eje13.java", archivo.getNombre());
	}
	
	@Test
	public void testTamaño() {
		assertEquals(10, archivo.getTamaño());
	}
	
}
