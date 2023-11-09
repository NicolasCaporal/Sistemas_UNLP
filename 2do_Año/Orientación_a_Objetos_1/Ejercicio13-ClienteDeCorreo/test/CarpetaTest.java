package ar.edu.unlp.info.oo1.ejercicio13;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class CarpetaTest {
	private Carpeta carpeta;
	private Carpeta carpetaVacia;
	private Email email;
	private Email email2;
	
	
	@BeforeEach
	public void setUp() {
		carpetaVacia = new Carpeta("Facultad");
		email = new Email("EjercicioA", "Envio el ejercicio A");
		email2 = new Email("Asunto", "Cuerpo");
		carpeta = new Carpeta("Facultad");
		carpeta.agregarEmail(email);
		carpeta.agregarEmail(email2);
	}
	
	@Test
	public void testConstructor() {
		assertEquals("Facultad", carpetaVacia.getNombre());
		assertNotNull(carpetaVacia.getEmails());
		assertEquals(0, carpetaVacia.getTamaño());
	}
	
	@Test
	public void testAgregarEmail() {
		carpetaVacia.agregarEmail(email);
		assertEquals(1, carpetaVacia.getEmails().size());
	}
	
	
	@Test
	public void testEliminarCarpetaVacia() {
		carpetaVacia.eliminarEmail(email);
		assertEquals(0, carpetaVacia.getTamaño());
	}
	
	@Test
	public void testEliminar() {
		carpeta.eliminarEmail(email2);
		assertEquals(30, carpeta.getTamaño());
		assertEquals(1, carpeta.getEmails().size());
	}
	
	@Test
	public void testBuscarVacia() {
		assertNull(carpetaVacia.buscar("cicio"));
	}
	
	@Test
	public void testBuscar() {
		assertSame(email, carpeta.buscar("cicio"));
		assertNull(carpeta.buscar("cicioB"));
	}
	
}
