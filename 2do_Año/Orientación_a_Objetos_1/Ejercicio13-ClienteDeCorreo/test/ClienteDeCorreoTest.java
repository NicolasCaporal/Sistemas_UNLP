package ar.edu.unlp.info.oo1.ejercicio13;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertSame;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

public class ClienteDeCorreoTest {
	private ClienteDeCorreo cliente;
	private ClienteDeCorreo clienteLleno;
	private Carpeta carpeta42;
	private Carpeta inbox;
	private Carpeta carpeta12;
	private Email email;
	private Email email2;
	
	
	@BeforeEach
	public void setUp() {
		email = new Email("EjercicioA", "Envio el ejercicio A");
		email2 = new Email("Asunto", "Cuerpo");
		
		carpeta42 = new Carpeta("Facultad");
		carpeta42.agregarEmail(email);
		carpeta42.agregarEmail(email2);
		
		carpeta12 = new Carpeta("Doce");
		carpeta12.agregarEmail(email2);
		
		inbox = new Carpeta("Inbox");
		
		cliente = new ClienteDeCorreo(inbox);
		
		clienteLleno = new ClienteDeCorreo(inbox);
		clienteLleno.agregarCarpeta(carpeta42);
		clienteLleno.agregarCarpeta(carpeta12);
	}
	
	
	@Test
	public void testConstructor() {
		assertSame(inbox, cliente.getInbox());
		assertNotNull(cliente.getCarpetas());
		assertTrue(cliente.getCarpetas().contains(inbox));
	}
	
	@Test
	public void testAgregarCarpeta() {
		cliente.agregarCarpeta(carpeta42);
		assertEquals(2, cliente.getCarpetas().size());
	}
	
	
	@Test
	public void testRecibir() {
		cliente.recibir(email);
		assertTrue(cliente.getInbox().getEmails().contains(email));
	}
	
	@Test
	public void testMover() {
		cliente.mover(email, carpeta42, inbox);
		assertTrue(cliente.getInbox().getEmails().contains(email));
		assertFalse(carpeta42.getEmails().contains(email));
		assertEquals(1, inbox.getEmails().size());
		assertEquals(1, carpeta42.getEmails().size());
	}
	
	@Test
	public void testBuscarVacia() {
		assertNull(cliente.buscar("cicio"));
	}
	
	@Test
	public void testBuscar() {
		assertNull(clienteLleno.buscar("cicioB"));
		assertSame(email, clienteLleno.buscar("cicio"));
	}
	
	@Test
	public void testEspacioOcupado() {
		assertEquals(54, clienteLleno.espacioOcupado());
	}
	
}
