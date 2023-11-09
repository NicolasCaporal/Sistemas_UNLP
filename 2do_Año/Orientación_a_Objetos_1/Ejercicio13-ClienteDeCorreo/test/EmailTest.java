package ar.edu.unlp.info.oo1.ejercicio13;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class EmailTest {
	private Email email;
	private Archivo archivo;
	
	@BeforeEach
	public void setUp() {
		email = new Email("EjercicioA", "Envio el ejercicio A");
		archivo = new Archivo("eje13.java");
	}
	
	@Test
	public void testConstructor() {
		assertEquals("EjercicioA", email.getTitulo());
		assertEquals("Envio el ejercicio A", email.getCuerpo());
		assertNotNull(email.getAdjuntos());
		assertEquals(30, email.getTamaño());
	}
	
	@Test
	public void testAgregarAdjuntos() {
		email.agregarAdjuntos(archivo);
		assertEquals(40, email.getTamaño());
	}
	
	
	@Test
	public void testContiene() {
		assertTrue(email.contiene("cicio"));
		assertFalse(email.contiene("cicioB"));
	}
	
}
